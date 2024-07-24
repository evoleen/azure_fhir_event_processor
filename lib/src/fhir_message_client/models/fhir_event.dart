import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:evoleen_fhir_events/src/fhir_message_client/models/fhir_event_body.dart';

part 'fhir_event.freezed.dart';
part 'fhir_event.g.dart';

@freezed
class FhirEvent with _$FhirEvent {
  const factory FhirEvent({
    required String id,
    required String topic,
    required String subject,
    required FhirEventData data,
    required String eventType,
    required String dataVersion,
    required String metadataVersion,
    required String eventTime,
  }) = _FhirEvent;

  factory FhirEvent.fromJson(Map<String, Object?> json) =>
      _$FhirEventFromJson(json);
}
