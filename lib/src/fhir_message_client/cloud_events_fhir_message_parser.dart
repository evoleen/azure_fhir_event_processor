import 'dart:convert';

import 'package:azure_fhir_event_processor/azure_fhir_event_processor.dart';

/// Parses Azure Healthcare APIs / Event Grid style CloudEvents JSON
/// into [FhirMessage].
class CloudEventsFhirMessageParser implements AbstractFhirMessageParser {
  @override
  FhirMessage parse(String rawBody, QueueMessageMetadata metadata) {
    final event = FhirEvent.fromCloudEventsJson(
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
