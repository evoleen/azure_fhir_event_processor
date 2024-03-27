import 'package:azstore/azstore.dart';
import 'fhir_event.dart';

class FhirMessage {
  final String id;
  final String insertationTime;
  final String expirationTime;
  final int dequeueCount;
  final String popReceipt;
  final FhirEvent fhirEvent;

  FhirMessage({
    required this.id,
    required this.insertationTime,
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
      insertationTime: message.insertionTime ?? "",
      expirationTime: message.expirationTime ?? "",
      dequeueCount: int.parse(message.dequeueCount ?? ""),
      fhirEvent: fhirEvent,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "popReceipt": popReceipt,
      "insertationTime": insertationTime,
      "expirationTime": expirationTime,
      "dequeueCount": dequeueCount,
      "fhirEvent": fhirEvent.toJson(),
    };
  }

  copyWith({
    String? expirationTime,
    String? insertationTime,
    int? dequeueCount,
    FhirEvent? fhirEvent,
  }) {
    return FhirMessage(
      id: id,
      insertationTime: expirationTime ?? this.expirationTime,
      expirationTime: insertationTime ?? this.insertationTime,
      dequeueCount: dequeueCount ?? this.dequeueCount,
      popReceipt: popReceipt,
      fhirEvent: fhirEvent ?? this.fhirEvent,
    );
  }
}
