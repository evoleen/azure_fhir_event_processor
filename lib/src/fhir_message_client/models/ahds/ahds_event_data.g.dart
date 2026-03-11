// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ahds_event_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AhdsEventData _$AhdsEventDataFromJson(Map<String, dynamic> json) =>
    _AhdsEventData(
      resourceFhirId: json['resourceFhirId'] as String,
      resourceType: json['resourceType'] as String,
      resourceFhirAccount: json['resourceFhirAccount'] as String,
      resourceVersionId: (json['resourceVersionId'] as num).toInt(),
    );

Map<String, dynamic> _$AhdsEventDataToJson(_AhdsEventData instance) =>
    <String, dynamic>{
      'resourceFhirId': instance.resourceFhirId,
      'resourceType': instance.resourceType,
      'resourceFhirAccount': instance.resourceFhirAccount,
      'resourceVersionId': instance.resourceVersionId,
    };
