import 'package:evoleen_fhir_events/src/fhir_message_client/models/fhir_event.dart';

abstract class AbstractActionExecutor {
  Future<void> execute({required FhirEvent fhirEvent});
}
