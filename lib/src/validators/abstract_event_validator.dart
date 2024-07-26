import 'package:azure_fhir_event_processor/azure_fhir_event_processor.dart';

abstract class AbstractEventValidator {
  void validate({required FhirMessage fhirMessage});
  Future<HandlerResult> handleException({
    required FhirMessage fhirMessage,
    required AbstractFhirMessageClient messageClient,
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
