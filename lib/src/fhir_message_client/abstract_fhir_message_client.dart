import 'package:azure_fhir_event_processor/azure_fhir_event_processor.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

abstract class AbstractFhirMessageClient {
  Future<List<FhirMessage>> consumeMessages({required int messagesCount});
  Future<void> removeMessage({required FhirMessage fhirMessage});
  Future<bool> queueIsNotEmpty();
  Future<void> sanitizeMessage({required FhirMessage fhirPoisonedMessage});
}

enum FhirEventType {
  @JsonValue("Microsoft.HealthcareApis.FhirResourceDeleted")
  resourceDeleted,
  @JsonValue("Microsoft.HealthcareApis.FhirResourceCreated")
  resourceCreated,
  @JsonValue("Microsoft.HealthcareApis.FhirResourceUpdated")
  resourceUpdated;
}
