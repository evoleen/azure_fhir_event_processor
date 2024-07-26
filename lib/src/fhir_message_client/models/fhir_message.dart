import 'dart:convert';
import 'package:azstore/azstore.dart';
import 'package:azure_fhir_event_processor/azure_fhir_event_processor.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'fhir_message.freezed.dart';
part 'fhir_message.g.dart';

@freezed
class FhirMessage with _$FhirMessage {
  const factory FhirMessage({
    required String id,
    required String insertionTime,
    required String expirationTime,
    required int dequeueCount,
    required String popReceipt,
    required FhirEvent fhirEvent,
  }) = _FhirMessage;

  factory FhirMessage.fromJson(Map<String, Object?> json) =>
      _$FhirMessageFromJson(json);

  static FhirMessage fromAzureQMessage(AzureQMessage message) {
    FhirEvent fhirEvent =
        FhirEvent.fromJson(json.decode(message.messageText ?? ''));

    return FhirMessage(
      id: message.messageId ?? "",
      popReceipt: message.popReceipt ?? "",
      insertionTime: message.insertionTime ?? "",
      expirationTime: message.expirationTime ?? "",
      dequeueCount: int.parse(message.dequeueCount ?? ""),
      fhirEvent: fhirEvent,
    );
  }
}
