import 'package:evoleen_fhir_events/evoleen_fhir_events.dart';

class TmpValidator implements EventValidatorAbstract {
  @override
  void validate({required FhirMessage fhirMessage}) {
    // All is good, we don't throw an exception
  }

  @override
  Future<HandlerResult> handleException({
    required FhirMessage fhirMessage,
    required FhirMessageClientAbstract messageClient,
  }) {
    return Future.value(HandlerResult(hasToRethrow: false));
  }
}

class ValidatorPass implements EventValidatorAbstract {
  @override
  void validate({required FhirMessage fhirMessage}) {
    // All is good, we don't throw an exception
  }

  @override
  Future<HandlerResult> handleException({
    required FhirMessage fhirMessage,
    required FhirMessageClientAbstract messageClient,
  }) {
    return Future.value(HandlerResult(hasToRethrow: false));
  }
}

class ValidatorFail implements EventValidatorAbstract {
  @override
  void validate({required FhirMessage fhirMessage}) {
    throw MessageValidatorException("Test validator fails");
  }

  @override
  Future<HandlerResult> handleException({
    required FhirMessage fhirMessage,
    required FhirMessageClientAbstract messageClient,
  }) {
    return Future.value(HandlerResult.shouldRethrow());
  }
}

class DeleteActionExecutor implements ActionExecutorAbstract {
  @override
  FhirEventType get type => FhirEventType.resourceDeleted;

  @override
  Future<void> execute({required FhirEvent fhirEvent}) async {}
}

class UpdateActionExecutor implements ActionExecutorAbstract {
  @override
  FhirEventType get type => FhirEventType.resourceUpdated;

  @override
  Future<void> execute({required FhirEvent fhirEvent}) async {}
}

class CreateActionExecutor implements ActionExecutorAbstract {
  @override
  Future<void> execute({required FhirEvent fhirEvent}) {
    return Future<void>.value();
  }

  @override
  FhirEventType get type => FhirEventType.resourceCreated;
}

class TmpPostProcessor implements PostProcessorAbstract {
  @override
  Future<void> apply({
    required FhirMessage fhirMessage,
    required FhirMessageClientAbstract messageClient,
  }) {
    return Future<void>.value();
  }
}

FhirMessage getFhirMessageMock({required fhirEventType}) {
  final FhirEventBody fhirEventBody = FhirEventBody(
    resourceFhirId: "9f4e6650-e585-4b33-9aff-f6049b7f7b94",
    resourceType: "Patient",
    resourceFhirAccount: "evoleenworkspace-evoleen-data.fhir.azurehealthcareapis.com",
    resourceVersionId: 2,
  );
  final FhirEvent fhirEvent = FhirEvent(
    id: "f80bf449-2084-0c5b-a66b-872bef7f592c",
    topic:
        "/subscriptions/949f4f90-da65-47c3-8694-92bda0294259/resourceGroups/evoleen-dev-resource-group/providers/Microsoft.HealthcareApis/workspaces/evoleenworkspace",
    subject: "evoleenworkspace-evoleen-data.fhir.azurehealthcareapis.com/Patient/9f4e6650-e585-4b33-9aff-f6049b7f7b94",
    eventType: fhirEventType,
    dataVersion: "2",
    metadataVersion: "1",
    eventTime: "2024-02-22T14:35:24.9530912Z",
    body: fhirEventBody,
  );

  return FhirMessage(
    id: "12-212-abc",
    insertationTime: "time as string",
    expirationTime: "time as string",
    dequeueCount: 0,
    popReceipt: 'aa-bb',
    fhirEvent: fhirEvent,
  );
}
