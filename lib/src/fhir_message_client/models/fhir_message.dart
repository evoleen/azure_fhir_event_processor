import 'dart:convert';

import 'package:azstore/azstore.dart';
import 'fhir_event.dart';

// TODO: Think if we need to add here abstract/interface
class FhirMessage {
  final String id;
  final String insertationTime;
  final String expirationTime;
  final int dequeueCount;
  final String popReceipt;
  final FhirEvent body;

  FhirMessage({
    required this.id,
    required this.insertationTime,
    required this.expirationTime,
    required this.dequeueCount,
    required this.popReceipt,
    required this.body,
  });

  static FhirMessage fromAzureQMessage(AzureQMessage message) {
    FhirEvent fhirEvent = FhirEvent.fromJsonStr(message.messageText);

    return FhirMessage(
      id: message.messageId ?? "",
      popReceipt: message.popReceipt ?? "",
      insertationTime: message.insertionTime ?? "",
      expirationTime: message.expirationTime ?? "",
      dequeueCount: int.parse(message.dequeueCount ?? ""),
      body: fhirEvent,
    );
  }

  String bodyToJson() {
    return jsonEncode(body.toJson());
  }

  copyWith({
    String? expirationTime,
    String? insertationTime,
    int? dequeueCount,
    FhirEvent? body,
  }) {
    return FhirMessage(
      id: id,
      insertationTime: expirationTime ?? this.expirationTime,
      expirationTime: insertationTime ?? this.insertationTime,
      dequeueCount: dequeueCount ?? this.dequeueCount,
      popReceipt: popReceipt,
      body: body ?? this.body,
    );
  }
}
