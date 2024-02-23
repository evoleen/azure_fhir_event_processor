import 'package:evoleen_fhir_events/evoleen_fhir_events.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'event_processor_test.mocks.dart';

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

@GenerateMocks([AzureMessageClient, TmpValidator])
void main() {
  late MockAzureMessageClient mockAzureMessageClient;
  late AzureEventProcessor azureEventProcessor;
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
    eventType: "Microsoft.HealthcareApis.FhirResourceDeleted",
    dataVersion: "2",
    metadataVersion: "1",
    eventTime: "2024-02-22T14:35:24.9530912Z",
    body: fhirEventBody,
  );
  final FhirMessage fhirMessage = FhirMessage(
    id: "12-212-abc",
    insertationTime: "time as string",
    expirationTime: "time as string",
    dequeueCount: 0,
    popReceipt: 'aa-bb',
    fhirEvent: fhirEvent,
  );

  group('Test Azure event processor', () {
    setUpAll(() {
      mockAzureMessageClient = MockAzureMessageClient();
      azureEventProcessor = AzureEventProcessor(messageClient: mockAzureMessageClient);
    });

    test('it can use validators and pass', () async {
      when(mockAzureMessageClient.consumeMessages(messagesCount: 1)).thenAnswer(
        (realInvocation) async {
          List<FhirMessage> fhirMessages = [];
          fhirMessages.add(fhirMessage);

          return fhirMessages;
        },
      );

      final ValidatorPass validatorPass = ValidatorPass();
      azureEventProcessor.addValidator(validatorPass);
      await azureEventProcessor.processOne();
      expect('No exception from validator', 'No exception from validator');
    });

    test('it can use validators and fail', () async {
      when(mockAzureMessageClient.consumeMessages(messagesCount: 1)).thenAnswer(
        (realInvocation) async {
          List<FhirMessage> fhirMessages = [];
          fhirMessages.add(fhirMessage);

          return fhirMessages;
        },
      );

      final ValidatorFail validatorFail = ValidatorFail();
      azureEventProcessor.addValidator(validatorFail);

      try {
        await azureEventProcessor.processOne();
      } catch (e) {
        expect(e, isA<MessageValidatorException>());
      }
    });

    test('it will not process if no messages', () async {
      // reset(mockAzureMessageClient);
      when(mockAzureMessageClient.consumeMessages(messagesCount: 1)).thenAnswer(
        (realInvocation) async {
          return List.empty();
        },
      );

      final MockTmpValidator tmpValidator = MockTmpValidator();
      azureEventProcessor.addValidator(tmpValidator);

      await azureEventProcessor.processOne();
      verifyNever(tmpValidator.validate(fhirMessage: fhirMessage));
      verifyNever(tmpValidator.handleException(fhirMessage: fhirMessage, messageClient: mockAzureMessageClient));
    });
  });
}
