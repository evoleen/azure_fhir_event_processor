// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ahds_fhir_event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AhdsFhirEvent _$AhdsFhirEventFromJson(Map<String, dynamic> json) =>
    _AhdsFhirEvent(
      id: json['id'] as String,
      eventType: const AhdsFhirEventTypeConverter()
          .fromJson(json['eventType'] as String),
      topic: json['topic'] as String?,
      subject: json['subject'] as String?,
      data: json['data'] == null
          ? null
          : AhdsEventData.fromJson(json['data'] as Map<String, dynamic>),
      dataVersion: json['dataVersion'] as String?,
      metadataVersion: json['metadataVersion'] as String?,
      eventTime: json['eventTime'] as String?,
    );

Map<String, dynamic> _$AhdsFhirEventToJson(_AhdsFhirEvent instance) =>
    <String, dynamic>{
      'id': instance.id,
      'eventType':
          const AhdsFhirEventTypeConverter().toJson(instance.eventType),
      'topic': instance.topic,
      'subject': instance.subject,
      'data': instance.data?.toJson(),
      'dataVersion': instance.dataVersion,
      'metadataVersion': instance.metadataVersion,
      'eventTime': instance.eventTime,
    };
