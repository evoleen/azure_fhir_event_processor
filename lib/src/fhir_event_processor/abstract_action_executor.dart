import 'package:azure_fhir_event_processor/src/fhir_message_client/models/fhir_event.dart';

abstract class AbstractActionExecutor {
  Future<void> execute({required FhirEvent fhirEvent});
}
