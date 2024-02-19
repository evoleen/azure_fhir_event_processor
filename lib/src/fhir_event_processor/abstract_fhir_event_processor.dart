import '../validators/abstract_event_validator.dart';
import 'abstract_action_executor.dart';
import 'abstract_post_processor.dart';

abstract class FhirEventProcessorAbstract {
  Future<void> processOne();
  Future<bool> shouldSleep();
  void addValidator(EventValidatorAbstract eventValidator);
  void addActionExecutor(ActionExecutorAbstract actionExecutor);
  void addPostProcessor(PostProcessorAbstract postProcessor);
}
