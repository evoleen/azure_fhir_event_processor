import 'package:azstore/azstore.dart';
import 'package:evoleen_fhir_events/src/fhir_message_client/models/fhir_event.dart';

class FhirMessage {
  final String id;
  final String insertionTime;
  final String expirationTime;
  final int dequeueCount;
  final String popReceipt;
  final FhirEvent fhirEvent;

  FhirMessage({
    required this.id,
    required this.insertionTime,
    required this.expirationTime,
    required this.dequeueCount,
    required this.popReceipt,
    required this.fhirEvent,
  });

  static FhirMessage fromAzureQMessage(AzureQMessage message) {
    FhirEvent fhirEvent = FhirEvent.fromJsonStr(message.messageText);

    return FhirMessage(
      id: message.messageId ?? "",
      popReceipt: message.popReceipt ?? "",
      insertionTime: message.insertionTime ?? "",
      expirationTime: message.expirationTime ?? "",
      dequeueCount: int.parse(message.dequeueCount ?? ""),
      fhirEvent: fhirEvent,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "popReceipt": popReceipt,
      "insertationTime": insertionTime,
      "expirationTime": expirationTime,
      "dequeueCount": dequeueCount,
      "fhirEvent": fhirEvent.toJson(),
    };
  }

  copyWith({
    String? expirationTime,
    String? insertionTime,
    int? dequeueCount,
    FhirEvent? fhirEvent,
  }) {
    return FhirMessage(
      id: id,
      insertionTime: expirationTime ?? this.expirationTime,
      expirationTime: insertionTime ?? this.insertionTime,
      dequeueCount: dequeueCount ?? this.dequeueCount,
      popReceipt: popReceipt,
      fhirEvent: fhirEvent ?? this.fhirEvent,
    );
  }
}
