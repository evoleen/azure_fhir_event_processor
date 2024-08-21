abstract class MessengerAbstract {
  Future<void> listen(
      {required Function(Object e, StackTrace? st) processExceptionHandler,
      Duration? sleepDuration});
}
