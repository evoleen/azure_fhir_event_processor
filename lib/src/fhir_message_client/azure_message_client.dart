import 'dart:convert';
import 'package:azstore/azstore.dart';
import 'abstract_fhir_message_client.dart';
import 'models/fhir_message.dart';

class AzureMessageClient implements FhirMessageClientAbstract {
  late AzureStorage _storage;
  late String _connectionString;
  late String _queueName;
  int? _msgVisibilityTimeout;

  AzureMessageClient({
    required connectionString,
    required String queueName,
    int? msgVisibilityTimeout,
    AzureStorage? azureStorage,
  }) {
    _connectionString = connectionString;
    _queueName = queueName;
    _msgVisibilityTimeout = msgVisibilityTimeout ?? 30;
    _storage = azureStorage ?? AzureStorage.parse(_connectionString);
  }

  @override
  Future<bool> queueIsNotEmpty() async {
    List<AzureQMessage> messages = await _storage.peekQmessages(qName: _queueName, numofmessages: 10);

    return messages.isNotEmpty;
  }

  @override
  Future<void> removeMessage({required FhirMessage fhirMessage}) async {
    await _storage.delQmessage(
      qName: _queueName,
      messageId: fhirMessage.id,
      popReceipt: fhirMessage.popReceipt,
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
    azureMessage.messageText = _base64TxtDecode(azureMessage.messageText);
    FhirMessage fhirMessage = FhirMessage.fromAzureQMessage(azureMessage);

    return fhirMessage;
  }

  String _serializeToForMessageText(FhirMessage fhirMessage) {
    Codec<String, String> decoder = utf8.fuse(base64);

    return decoder.encode(fhirMessage.bodyToJson());
  }

  String _base64TxtDecode(txt) {
    Codec<String, String> decoder = utf8.fuse(base64);

    return decoder.decode(txt);
  }
}
