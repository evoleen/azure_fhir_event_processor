import 'package:azure_fhir_event_processor/azure_fhir_event_processor.dart';

class PoisonEventValidator implements AbstractEventValidator {
  late final int _dequeueCount;

  PoisonEventValidator({int? dequeueCount}) {
    _dequeueCount = dequeueCount ?? 10;
  }

  @override
  void validate({required FhirMessage fhirMessage}) {
    if (fhirMessage.dequeueCount >= _dequeueCount) {
      throw MessageValidatorException(
          "Message ${fhirMessage.id} might be poisoned");
    }
  }

  @override
  Future<HandlerResult> handleException({
    required FhirMessage fhirMessage,
    required AbstractFhirMessageClient messageClient,
  }) async {
    await messageClient.sanitizeMessage(fhirPoisonedMessage: fhirMessage);

    return HandlerResult(hasToRethrow: false);
  }
}
