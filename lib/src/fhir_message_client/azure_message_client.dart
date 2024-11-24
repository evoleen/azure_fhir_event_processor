import 'dart:convert';
import 'package:azstore/azstore.dart';
import 'package:azure_fhir_event_processor/azure_fhir_event_processor.dart';

class AzureMessageClient implements AbstractFhirMessageClient {
  late AzureStorage _storage;
  late String _connectionString;
  late String _queueName;
  late String _poisonQueueName;
  int? _msgVisibilityTimeout;
  late int _poisonedMessageTtl;

  AzureMessageClient({
    required connectionString,
    required String queueName,
    String? poisonQueueName,
    int? messageVisibilityTimeout,
    int? poisonedMessageTtl,
    AzureStorage? azureStorage,
  }) {
    _connectionString = connectionString;
    _queueName = queueName;
    _poisonQueueName = poisonQueueName ?? "poisoned-messages";
    _poisonedMessageTtl = poisonedMessageTtl ?? -1;
    _msgVisibilityTimeout = messageVisibilityTimeout ?? 30;
    _storage = azureStorage ?? AzureStorage.parse(_connectionString);
  }

  @override
  Future<void> sanitizeMessage(
      {required FhirMessage fhirPoisonedMessage}) async {
    String message = _serializeToFhirMessage(fhirPoisonedMessage);

    // Send message to poison queue
    await _storage.putQMessage(
        qName: _poisonQueueName,
        message: message,
        messagettl: _poisonedMessageTtl);
    // Remove message from current queue
    await removeMessage(fhirMessage: fhirPoisonedMessage);
  }

  @override
  Future<bool> queueIsNotEmpty() async {
    List<AzureQMessage> messages = await _storage.peekQmessages(
      qName: _queueName,
      numofmessages: 10,
    );

    return messages.isNotEmpty;
  }

  @override
  Future<void> removeMessage({required FhirMessage fhirMessage}) async {
    await _storage.delQmessage(
      qName: _queueName,
      messageId: Uri.encodeComponent(fhirMessage.id),
      popReceipt: Uri.encodeComponent(fhirMessage.popReceipt),
    );
  }

  @override
  Future<List<FhirMessage>> consumeMessages({required messagesCount}) async {
    List<FhirMessage> fhirMessages = [];

    List<AzureQMessage> messages = await _storage.getQmessages(
      qName: _queueName,
      numOfmessages: messagesCount,
      visibilitytimeout: _msgVisibilityTimeout,
    );

    if (messages.isEmpty) {
      return List.empty();
    }

    for (AzureQMessage azureMessage in messages) {
      final FhirMessage fhirMessage = _deserializeToFhirMessage(azureMessage);
      fhirMessages.add(fhirMessage);
    }

    return fhirMessages;
  }

  FhirMessage _deserializeToFhirMessage(AzureQMessage azureMessage) {
    // We decode from base64 and get json string
    azureMessage.messageText = _getDecoder().decode(
      azureMessage.messageText ?? "",
    );
    FhirMessage fhirMessage = FhirMessage.fromAzureQMessage(azureMessage);

    return fhirMessage;
  }

  String _serializeToFhirMessage(FhirMessage fhirMessage) {
    String fhirMessageAsJsonStr = jsonEncode(fhirMessage.toJson());

    return _getDecoder().encode(fhirMessageAsJsonStr);
  }

  Codec<String, String> _getDecoder() {
    return utf8.fuse(base64);
  }
}
