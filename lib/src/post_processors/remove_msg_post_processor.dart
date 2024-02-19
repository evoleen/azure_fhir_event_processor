import '../fhir_event_processor/abstract_post_processor.dart';
import '../fhir_message_client/abstract_fhir_message_client.dart';
import '../fhir_message_client/models/fhir_message.dart';

class RemoveMsgPostProcessor implements PostProcessorAbstract {
  @override
  Future<void> apply({
    required FhirMessage fhirMessage,
    required FhirMessageClientAbstract messageClient,
  }) async {
    await messageClient.removeMessage(fhirMessage: fhirMessage);
  }
}
