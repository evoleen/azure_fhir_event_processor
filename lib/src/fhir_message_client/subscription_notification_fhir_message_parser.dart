import 'dart:convert';

import 'package:azure_fhir_event_processor/azure_fhir_event_processor.dart';

/// Parses Fire Arrow MESSAGE channel subscription notification JSON
/// (plain JSON, no Base64) into [FhirMessage].
///
/// See [MESSAGE_CHANNEL_SUBSCRIPTIONS_AZURE_QUEUE.md] for the wire format.
class SubscriptionNotificationFhirMessageParser
    implements AbstractFhirMessageParser {
  @override
  FhirMessage parse(String rawBody, QueueMessageMetadata metadata) {
    final event = FhirEvent.fromSubscriptionJson(
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
