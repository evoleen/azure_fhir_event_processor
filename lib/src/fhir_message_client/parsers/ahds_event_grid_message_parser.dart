import 'dart:convert';

import 'package:azure_fhir_event_processor/azure_fhir_event_processor.dart';

/// Parses queue messages produced by **Azure Health Data Services (AHDS)** when
/// events are delivered via Event Grid to an Azure Storage Queue.
///
/// Message body: Base64-encoded CloudEvents JSON (id, topic, subject, data, eventType, …).
/// Use this parser when the queue is fed by an AHDS/Healthcare APIs Event Grid
/// subscription, not by HAPI/Fire Arrow MESSAGE channel.
class AhdsEventGridMessageParser implements AbstractFhirMessageParser {
  @override
  FhirMessage parse(String rawBody, QueueMessageMetadata metadata) {
    final event = AhdsFhirEvent.fromJson(
      json.decode(rawBody) as Map<String, Object?>,
    );
    return FhirMessage(
      id: metadata.id,
      popReceipt: metadata.popReceipt,
      insertionTime: metadata.insertionTime,
      expirationTime: metadata.expirationTime,
      dequeueCount: metadata.dequeueCount,
      fhirEvent: event,
    );
  }
}
