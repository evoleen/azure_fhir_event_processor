import '../fhir_message_client/abstract_fhir_message_client.dart';
import '../fhir_message_client/models/fhir_message.dart';

abstract class PostProcessorAbstract {
  Future<void> apply({
    required FhirMessage fhirMessage,
    required FhirMessageClientAbstract messageClient,
  });
}
