import 'package:evoleen_fhir_events/src/fhir_event_processor/abstract_post_processor.dart';
import 'package:evoleen_fhir_events/src/fhir_message_client/abstract_fhir_message_client.dart';
import 'package:evoleen_fhir_events/src/fhir_message_client/models/fhir_message.dart';

class RemoveMessagePostProcessor implements AbstractPostProcessor {
  @override
  Future<void> apply({
    required FhirMessage fhirMessage,
    required AbstractFhirMessageClient messageClient,
  }) async {
    await messageClient.removeMessage(fhirMessage: fhirMessage);
  }
}
