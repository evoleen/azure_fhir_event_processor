import 'package:evoleen_fhir_events/src/validators/abstract_event_validator.dart';
import 'package:evoleen_fhir_events/src/fhir_event_processor/abstract_action_executor.dart';
import 'package:evoleen_fhir_events/src/fhir_event_processor/abstract_post_processor.dart';

abstract class AbstractFhirEventProcessor {
  Future<void> processOne();
  Future<bool> shouldSleep();
  void addValidator(AbstractEventValidator eventValidator);
  void addActionExecutor(AbstractActionExecutor actionExecutor);
  void addPostProcessor(AbstractPostProcessor postProcessor);
}
