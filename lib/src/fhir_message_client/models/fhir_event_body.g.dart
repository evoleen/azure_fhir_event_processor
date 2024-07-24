// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fhir_event_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FhirEventDataImpl _$$FhirEventDataImplFromJson(Map<String, dynamic> json) =>
    _$FhirEventDataImpl(
      resourceFhirId: json['resourceFhirId'] as String,
      resourceType: json['resourceType'] as String,
      resourceFhirAccount: json['resourceFhirAccount'] as String,
      resourceVersionId: (json['resourceVersionId'] as num).toInt(),
    );

Map<String, dynamic> _$$FhirEventDataImplToJson(_$FhirEventDataImpl instance) =>
    <String, dynamic>{
      'resourceFhirId': instance.resourceFhirId,
      'resourceType': instance.resourceType,
      'resourceFhirAccount': instance.resourceFhirAccount,
      'resourceVersionId': instance.resourceVersionId,
    };
