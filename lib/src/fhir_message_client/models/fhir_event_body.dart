import 'package:freezed_annotation/freezed_annotation.dart';

part 'fhir_event_body.freezed.dart';
part 'fhir_event_body.g.dart';

@freezed
class FhirEventData with _$FhirEventData {
  const factory FhirEventData({
    required String resourceFhirId,
    required String resourceType,
    required String resourceFhirAccount,
    required int resourceVersionId,
  }) = _FhirEventData;

  factory FhirEventData.fromJson(Map<String, Object?> json) =>
      _$FhirEventDataFromJson(json);
}
