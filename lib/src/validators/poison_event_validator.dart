import 'package:evoleen_fhir_events/src/errors.dart';
import 'package:evoleen_fhir_events/src/fhir_message_client/abstract_fhir_message_client.dart';
import 'package:evoleen_fhir_events/src/fhir_message_client/models/fhir_message.dart';
import 'package:evoleen_fhir_events/src/validators/abstract_event_validator.dart';

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

    return HandlerResult();
  }
}
