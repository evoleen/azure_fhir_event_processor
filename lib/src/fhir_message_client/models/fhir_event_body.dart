import 'package:freezed_annotation/freezed_annotation.dart';

part 'fhir_event_body.freezed.dart';
part 'fhir_event_body.g.dart';

@freezed
class FhirEventBody with _$FhirEventBody {
  const factory FhirEventBody({
    required String resourceFhirId,
    required String resourceType,
    required String resourceFhirAccount,
    required int resourceVersionId,
  }) = _FhirEventBody;

  factory FhirEventBody.fromJson(Map<String, Object?> json) =>
      _$FhirEventBodyFromJson(json);
}
