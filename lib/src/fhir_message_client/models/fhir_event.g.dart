// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fhir_event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FhirEventImpl _$$FhirEventImplFromJson(Map<String, dynamic> json) =>
    _$FhirEventImpl(
      id: json['id'] as String,
      topic: json['topic'] as String,
      subject: json['subject'] as String,
      data: FhirEventData.fromJson(json['data'] as Map<String, dynamic>),
      eventType: $enumDecode(_$FhirEventTypeEnumMap, json['eventType']),
      dataVersion: json['dataVersion'] as String,
      metadataVersion: json['metadataVersion'] as String,
      eventTime: json['eventTime'] as String,
    );

Map<String, dynamic> _$$FhirEventImplToJson(_$FhirEventImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'topic': instance.topic,
      'subject': instance.subject,
      'data': instance.data.toJson(),
      'eventType': _$FhirEventTypeEnumMap[instance.eventType]!,
      'dataVersion': instance.dataVersion,
      'metadataVersion': instance.metadataVersion,
      'eventTime': instance.eventTime,
    };

const _$FhirEventTypeEnumMap = {
  FhirEventType.resourceDeleted: 'Microsoft.HealthcareApis.FhirResourceDeleted',
  FhirEventType.resourceCreated: 'Microsoft.HealthcareApis.FhirResourceCreated',
  FhirEventType.resourceUpdated: 'Microsoft.HealthcareApis.FhirResourceUpdated',
};
