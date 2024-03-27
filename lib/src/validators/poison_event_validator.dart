import '../errors.dart';
import '../fhir_message_client/abstract_fhir_message_client.dart';
import '../fhir_message_client/models/fhir_message.dart';
import 'abstract_event_validator.dart';

class PoisonEventValidator implements EventValidatorAbstract {
  late final int _dequeuCount;

  PoisonEventValidator({int? dequeueCount}) {
    _dequeuCount = dequeueCount ?? 10;
  }

  @override
  void validate({required FhirMessage fhirMessage}) {
    if (fhirMessage.dequeueCount >= _dequeuCount) {
      throw MessageValidatorException("Message ${fhirMessage.id} might be poisoned");
    }
  }

  @override
  Future<HandlerResult> handleException({
    required FhirMessage fhirMessage,
    required FhirMessageClientAbstract messageClient,
  }) async {
    await messageClient.sanitizeMessage(fhirPoisonedMessage: fhirMessage);

    return HandlerResult();
  }
}
