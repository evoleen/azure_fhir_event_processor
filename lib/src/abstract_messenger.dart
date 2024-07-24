abstract class MessengerAbstract {
  Future<void> listen(
      {required Function(Object e) processExceptionHandler,
      Duration? sleepDuration});
}
