import '../validators/abstract_event_validator.dart';
import 'abstract_action_executor.dart';

abstract class FhirEventProcessorAbstract {
  Future<void> processOne();
  Future<bool> shouldSleep();
  void addValidator(EventValidatorAbstract eventValidator);
  void addActionExecutor(ActionExecutorAbstract actionExecutor);
}
