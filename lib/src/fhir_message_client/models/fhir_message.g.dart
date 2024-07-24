// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fhir_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FhirMessageImpl _$$FhirMessageImplFromJson(Map<String, dynamic> json) =>
    _$FhirMessageImpl(
      id: json['id'] as String,
      insertionTime: json['insertionTime'] as String,
      expirationTime: json['expirationTime'] as String,
      dequeueCount: (json['dequeueCount'] as num).toInt(),
      popReceipt: json['popReceipt'] as String,
      fhirEvent: FhirEvent.fromJson(json['fhirEvent'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$FhirMessageImplToJson(_$FhirMessageImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'insertionTime': instance.insertionTime,
      'expirationTime': instance.expirationTime,
      'dequeueCount': instance.dequeueCount,
      'popReceipt': instance.popReceipt,
      'fhirEvent': instance.fhirEvent.toJson(),
    };
