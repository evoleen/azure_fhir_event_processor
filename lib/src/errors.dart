class MessageValidatorException implements Exception {
  final String message;

  const MessageValidatorException(this.message);

  @override
  String toString() => message;
}
