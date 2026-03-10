import 'package:azure_fhir_event_processor/azure_fhir_event_processor.dart';

/// Parses a raw queue message body into a [FhirMessage] using queue metadata.
///
/// Implementations support different wire formats (e.g. CloudEvents vs
/// Fire Arrow MESSAGE channel subscription notification).
abstract class AbstractFhirMessageParser {
  /// Parses [rawBody] (already decoded if the queue used base64) and
  /// [metadata] into a [FhirMessage].
  FhirMessage parse(String rawBody, QueueMessageMetadata metadata);
}
