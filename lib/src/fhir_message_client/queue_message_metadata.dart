/// How the queue message body is encoded (e.g. Base64 vs plain text).
enum QueueMessageEncoding {
  /// Body is Base64-encoded (e.g. Azure Event Grid / Healthcare APIs).
  base64,

  /// Body is plain JSON (e.g. Fire Arrow MESSAGE channel).
  none,
}

/// Metadata from an Azure Storage Queue message (id, popReceipt, etc.).
class QueueMessageMetadata {
  const QueueMessageMetadata({
    required this.id,
    required this.popReceipt,
    required this.insertionTime,
    required this.expirationTime,
    required this.dequeueCount,
  });

  final String id;
  final String popReceipt;
  final String insertionTime;
  final String expirationTime;
  final int dequeueCount;
}
