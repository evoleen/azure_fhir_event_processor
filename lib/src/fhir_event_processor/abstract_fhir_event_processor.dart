import 'package:evoleen_fhir_events/src/validators/abstract_event_validator.dart';
import 'package:evoleen_fhir_events/src/fhir_event_processor/abstract_action_executor.dart';
import 'package:evoleen_fhir_events/src/fhir_event_processor/abstract_post_processor.dart';

abstract class FhirEventProcessorAbstract {
  Future<void> processOne();
  Future<bool> shouldSleep();
  void addValidator(EventValidatorAbstract eventValidator);
  void addActionExecutor(ActionExecutorAbstract actionExecutor);
  void addPostProcessor(PostProcessorAbstract postProcessor);
}
