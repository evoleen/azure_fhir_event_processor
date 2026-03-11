import 'dart:convert';

import 'package:azure_fhir_event_processor/azure_fhir_event_processor.dart';

/// Parses queue messages produced by **HAPI FHIR** (e.g. Fire Arrow) when
/// using the MESSAGE channel with Azure Storage Queue delivery.
///
/// Message body: plain JSON subscription notification (notificationId,
/// subscriptionId, eventType, resourceType, resourceId, payload, …).
/// Use this parser when the queue is fed by HAPI/Fire Arrow MESSAGE channel
/// subscriptions, not by Azure Health Data Services Event Grid.
///
/// See [MESSAGE_CHANNEL_SUBSCRIPTIONS_AZURE_QUEUE.md] for the wire format.
class HapiSubscriptionNotificationMessageParser
    implements AbstractFhirMessageParser {
  @override
  FhirMessage parse(String rawBody, QueueMessageMetadata metadata) {
    final event = HapiFhirEvent.fromSubscriptionJson(
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
