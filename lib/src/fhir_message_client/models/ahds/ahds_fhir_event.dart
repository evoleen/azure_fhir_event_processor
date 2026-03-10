import 'package:freezed_annotation/freezed_annotation.dart';

import '../../fhir_event_type.dart';
import 'ahds_event_data.dart';
import '../fhir_event.dart';
import '../fhir_event_type_converter.dart';

part 'ahds_fhir_event.freezed.dart';
part 'ahds_fhir_event.g.dart';

/// FHIR event from **Azure Health Data Services (AHDS)** Event Grid
/// (CloudEvents envelope). Exposes only AHDS-specific fields.
@freezed
abstract class AhdsFhirEvent extends FhirEvent with _$AhdsFhirEvent {
  const AhdsFhirEvent._();

  const factory AhdsFhirEvent({
    required String id,
    @FhirEventTypeConverter() required FhirEventType eventType,
    String? topic,
    String? subject,
    AhdsEventData? data,
    String? dataVersion,
    String? metadataVersion,
    String? eventTime,
  }) = _AhdsFhirEvent;

  factory AhdsFhirEvent.fromJson(Map<String, Object?> json) =>
      _$AhdsFhirEventFromJson(json);

  @override
  String get resourceType => data?.resourceType ?? '';

  @override
  String get resourceId => data?.resourceFhirId ?? '';

  @override
  String? get resourceVersionId => data?.resourceVersionId.toString();
}
