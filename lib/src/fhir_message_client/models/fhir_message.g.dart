// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fhir_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FhirMessage _$FhirMessageFromJson(Map<String, dynamic> json) => _FhirMessage(
      id: json['id'] as String,
      insertionTime: json['insertionTime'] as String,
      expirationTime: json['expirationTime'] as String,
      dequeueCount: (json['dequeueCount'] as num).toInt(),
      popReceipt: json['popReceipt'] as String,
      fhirEvent: _fhirEventFromJson(json['fhirEvent']),
    );

Map<String, dynamic> _$FhirMessageToJson(_FhirMessage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'insertionTime': instance.insertionTime,
      'expirationTime': instance.expirationTime,
      'dequeueCount': instance.dequeueCount,
      'popReceipt': instance.popReceipt,
      'fhirEvent': _fhirEventToJson(instance.fhirEvent),
    };
