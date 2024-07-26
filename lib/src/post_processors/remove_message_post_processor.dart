import 'package:azure_fhir_event_processor/azure_fhir_event_processor.dart';

class RemoveMessagePostProcessor implements AbstractPostProcessor {
  @override
  Future<void> apply({
    required FhirMessage fhirMessage,
    required AbstractFhirMessageClient messageClient,
  }) async {
    await messageClient.removeMessage(fhirMessage: fhirMessage);
  }
}
