import 'package:azure_fhir_event_processor/azure_fhir_event_processor.dart';

abstract class AbstractPostProcessor {
  Future<void> apply({
    required FhirMessage fhirMessage,
    required AbstractFhirMessageClient messageClient,
  });
}
