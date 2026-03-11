import 'package:azure_fhir_event_processor/azure_fhir_event_processor.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'fhir_message.freezed.dart';
part 'fhir_message.g.dart';

@freezed
abstract class FhirMessage with _$FhirMessage {
  const factory FhirMessage({
    required String id,
    required String insertionTime,
    required String expirationTime,
    required int dequeueCount,
    required String popReceipt,
    @JsonKey(fromJson: _fhirEventFromJson, toJson: _fhirEventToJson)
    required FhirEvent fhirEvent,
  }) = _FhirMessage;

  factory FhirMessage.fromJson(Map<String, Object?> json) =>
      _$FhirMessageFromJson(json);
}

FhirEvent _fhirEventFromJson(Object? json) =>
    FhirEvent.parseFhirEvent(json as Map<String, Object?>);

Map<String, dynamic> _fhirEventToJson(FhirEvent event) => event.toJson();
