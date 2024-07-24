import 'package:evoleen_fhir_events/src/fhir_message_client/abstract_fhir_message_client.dart';
import 'package:evoleen_fhir_events/src/fhir_message_client/models/fhir_event.dart';

abstract class ActionExecutorAbstract {
  FhirEventType get type;
  Future<void> execute({required FhirEvent fhirEvent});
}
