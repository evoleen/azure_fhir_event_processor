// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hapi_fhir_event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_HapiFhirEvent _$HapiFhirEventFromJson(Map<String, dynamic> json) =>
    _HapiFhirEvent(
      id: json['notificationId'] as String? ?? '',
      eventType:
          const FhirEventTypeConverter().fromJson(json['eventType'] as String),
      subscriptionId: json['subscriptionId'] as String?,
      subscriptionTimestamp:
          const _StringOrNumConverter().fromJson(json['timestamp']),
      subscriptionResourceType: json['resourceType'] as String?,
      subscriptionResourceId: json['resourceId'] as String?,
      subscriptionResourceVersionId: json['resourceVersionId'] as String?,
      payload: json['payload'] as String?,
      payloadContentType: json['payloadContentType'] as String?,
      criteria: json['criteria'] as String?,
    );

Map<String, dynamic> _$HapiFhirEventToJson(_HapiFhirEvent instance) =>
    <String, dynamic>{
      'notificationId': instance.id,
      'eventType': const FhirEventTypeConverter().toJson(instance.eventType),
      'subscriptionId': instance.subscriptionId,
      'timestamp':
          const _StringOrNumConverter().toJson(instance.subscriptionTimestamp),
      'resourceType': instance.subscriptionResourceType,
      'resourceId': instance.subscriptionResourceId,
      'resourceVersionId': instance.subscriptionResourceVersionId,
      'payload': instance.payload,
      'payloadContentType': instance.payloadContentType,
      'criteria': instance.criteria,
    };
