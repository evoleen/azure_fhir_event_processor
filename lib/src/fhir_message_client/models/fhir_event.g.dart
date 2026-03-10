// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fhir_event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FhirEvent _$FhirEventFromJson(Map<String, dynamic> json) => _FhirEvent(
      id: json['id'] as String,
      eventType: const FhirEventTypeConverter().fromJson(json['eventType'] as String),
      topic: json['topic'] as String?,
      subject: json['subject'] as String?,
      data: json['data'] == null
          ? null
          : FhirEventData.fromJson(json['data'] as Map<String, dynamic>),
      dataVersion: json['dataVersion'] as String?,
      metadataVersion: json['metadataVersion'] as String?,
      eventTime: json['eventTime'] as String?,
      subscriptionId: json['subscriptionId'] as String?,
      subscriptionTimestamp: json['subscriptionTimestamp'] as String?,
      subscriptionResourceType: json['subscriptionResourceType'] as String?,
      subscriptionResourceId: json['subscriptionResourceId'] as String?,
      subscriptionResourceVersionId:
          json['subscriptionResourceVersionId'] as String?,
      payload: json['payload'] as String?,
      payloadContentType: json['payloadContentType'] as String?,
      criteria: json['criteria'] as String?,
    );

Map<String, dynamic> _$FhirEventToJson(_FhirEvent instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'eventType': const FhirEventTypeConverter().toJson(instance.eventType),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('topic', instance.topic);
  writeNotNull('subject', instance.subject);
  writeNotNull('data', instance.data?.toJson());
  writeNotNull('dataVersion', instance.dataVersion);
  writeNotNull('metadataVersion', instance.metadataVersion);
  writeNotNull('eventTime', instance.eventTime);
  writeNotNull('subscriptionId', instance.subscriptionId);
  writeNotNull('subscriptionTimestamp', instance.subscriptionTimestamp);
  writeNotNull('subscriptionResourceType', instance.subscriptionResourceType);
  writeNotNull('subscriptionResourceId', instance.subscriptionResourceId);
  writeNotNull(
      'subscriptionResourceVersionId', instance.subscriptionResourceVersionId);
  writeNotNull('payload', instance.payload);
  writeNotNull('payloadContentType', instance.payloadContentType);
  writeNotNull('criteria', instance.criteria);
  return val;
}
