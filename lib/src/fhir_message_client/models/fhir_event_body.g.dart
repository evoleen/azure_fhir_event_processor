// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fhir_event_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FhirEventData _$FhirEventDataFromJson(Map<String, dynamic> json) =>
    _FhirEventData(
      resourceFhirId: json['resourceFhirId'] as String,
      resourceType: json['resourceType'] as String,
      resourceFhirAccount: json['resourceFhirAccount'] as String,
      resourceVersionId: (json['resourceVersionId'] as num).toInt(),
    );

Map<String, dynamic> _$FhirEventDataToJson(_FhirEventData instance) =>
    <String, dynamic>{
      'resourceFhirId': instance.resourceFhirId,
      'resourceType': instance.resourceType,
      'resourceFhirAccount': instance.resourceFhirAccount,
      'resourceVersionId': instance.resourceVersionId,
    };
