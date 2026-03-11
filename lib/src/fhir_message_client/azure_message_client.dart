import 'dart:convert';

import 'package:azstore/azstore.dart';
import 'package:azure_fhir_event_processor/azure_fhir_event_processor.dart';

class AzureMessageClient implements AbstractFhirMessageClient {
  AzureMessageClient({
    required connectionString,
    required String queueName,
    String? poisonQueueName,
    int? messageVisibilityTimeout,
    int? poisonedMessageTtl,
    AzureStorage? azureStorage,
    QueueMessageEncoding messageEncoding = QueueMessageEncoding.base64,
    AbstractFhirMessageParser? parser,
  })  : _connectionString = connectionString,
        _queueName = queueName,
        _poisonQueueName = poisonQueueName ?? 'poisoned-messages',
        _poisonedMessageTtl = poisonedMessageTtl ?? -1,
        _msgVisibilityTimeout = messageVisibilityTimeout ?? 30,
        _messageEncoding = messageEncoding,
        _parser = parser ?? AhdsEventGridMessageParser() {
    _storage = azureStorage ?? AzureStorage.parse(_connectionString);
  }

  late final String _connectionString;
  late final AzureStorage _storage;
  late final String _queueName;
  late final String _poisonQueueName;
  late final int _msgVisibilityTimeout;
  late final int _poisonedMessageTtl;
  late final QueueMessageEncoding _messageEncoding;
  late final AbstractFhirMessageParser _parser;

  @override
  Future<void> sanitizeMessage(
      {required FhirMessage fhirPoisonedMessage}) async {
    final message = _serializeToFhirMessage(fhirPoisonedMessage);
    // Azure Put Message wraps the body in XML; raw JSON can contain <, >, &
    // and invalidate the document. When encoding is base64, message is already
    // base64 (XML-safe); otherwise base64-encode once for the poison queue.
    final xmlSafeBody = _messageEncoding == QueueMessageEncoding.base64
        ? message
        : base64.encode(utf8.encode(message));
    await _storage.putQMessage(
      qName: _poisonQueueName,
      message: xmlSafeBody,
      messagettl: _poisonedMessageTtl,
    );
    await removeMessage(fhirMessage: fhirPoisonedMessage);
  }

  @override
  Future<bool> queueIsNotEmpty() async {
    final messages = await _storage.peekQmessages(
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
  Future<List<FhirMessage>> consumeMessages({required int messagesCount}) async {
    final messages = await _storage.getQmessages(
      qName: _queueName,
      numOfmessages: messagesCount,
      visibilitytimeout: _msgVisibilityTimeout,
    );
    if (messages.isEmpty) return List.empty();

    final result = <FhirMessage>[];
    for (final azureMessage in messages) {
      result.add(_deserializeToFhirMessage(azureMessage));
    }
    return result;
  }

  FhirMessage _deserializeToFhirMessage(AzureQMessage azureMessage) {
    var body = azureMessage.messageText ?? '';
    if (_messageEncoding == QueueMessageEncoding.base64) {
      body = utf8.decode(base64.decode(body));
    }
    final metadata = QueueMessageMetadata(
      id: azureMessage.messageId ?? '',
      popReceipt: azureMessage.popReceipt ?? '',
      insertionTime: azureMessage.insertionTime ?? '',
      expirationTime: azureMessage.expirationTime ?? '',
      dequeueCount: int.tryParse(azureMessage.dequeueCount ?? '') ?? 0,
    );
    return _parser.parse(body, metadata);
  }

  String _serializeToFhirMessage(FhirMessage fhirMessage) {
    final jsonStr = jsonEncode(fhirMessage.toJson());
    if (_messageEncoding == QueueMessageEncoding.base64) {
      return base64.encode(utf8.encode(jsonStr));
    }
    return jsonStr;
  }
}
