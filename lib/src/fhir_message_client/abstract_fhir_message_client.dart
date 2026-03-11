import 'package:azure_fhir_event_processor/azure_fhir_event_processor.dart';

export 'fhir_event_type.dart';

abstract class AbstractFhirMessageClient {
  Future<List<FhirMessage>> consumeMessages({required int messagesCount});
  Future<void> removeMessage({required FhirMessage fhirMessage});
  Future<bool> queueIsNotEmpty();
  Future<void> sanitizeMessage({required FhirMessage fhirPoisonedMessage});
}
