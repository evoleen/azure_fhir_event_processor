import '../fhir_message_client/abstract_fhir_message_client.dart';
import '../fhir_message_client/models/fhir_event.dart';

abstract class ActionExecutorAbstract {
  Future<void> execute({required FhirEvent fhirEvent});
  FhirEventType get type;
}
