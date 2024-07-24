import 'package:evoleen_fhir_events/src/fhir_message_client/abstract_fhir_message_client.dart';
import 'package:evoleen_fhir_events/src/fhir_message_client/models/fhir_message.dart';

abstract class EventValidatorAbstract {
  void validate({required FhirMessage fhirMessage});
  Future<HandlerResult> handleException({
    required FhirMessage fhirMessage,
    required FhirMessageClientAbstract messageClient,
  });
}

class HandlerResult {
  late final bool _hasToRethrow;

  HandlerResult({bool? hasToRethrow}) {
    _hasToRethrow = hasToRethrow ?? true;
  }

  factory HandlerResult.shouldRethrow() {
    return HandlerResult(hasToRethrow: true);
  }

  bool get hasToRethrow => _hasToRethrow;
}
