abstract class MessangerAbstract {
  Future<void> listen({required Function(Object e) processExceptionHandler, Duration? sleepDuration});
}
