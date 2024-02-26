import 'package:evoleen_fhir_events/evoleen_fhir_events.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'event_processor_test.mocks.dart';
import 'mocks.dart';

@GenerateMocks([
  AzureMessageClient,
  TmpValidator,
  DeleteActionExecutor,
  UpdateActionExecutor,
  CreateActionExecutor,
  TmpPostProcessor,
])
void main() {
  late MockAzureMessageClient mockAzureMessageClient;
  late AzureEventProcessor azureEventProcessor;
  final FhirMessage fhirMessage = getFhirMessageMock(
    fhirEventType: "Microsoft.HealthcareApis.FhirResourceDeleted",
  );
  final FhirMessage fhirMessageCreate = getFhirMessageMock(
    fhirEventType: "Microsoft.HealthcareApis.FhirResourceCreated",
  );

  group('Test Azure event processor', () {
    setUp(() {
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

    test('it can use action executor for delete event type', () async {
      when(mockAzureMessageClient.consumeMessages(messagesCount: 1)).thenAnswer(
        (realInvocation) async {
          List<FhirMessage> fhirMessages = [];
          fhirMessages.add(fhirMessage);

          return fhirMessages;
        },
      );

      final mockDeleteActionExecutor = MockDeleteActionExecutor();
      when(mockDeleteActionExecutor.type).thenReturn(FhirEventType.resourceDeleted);
      when(mockDeleteActionExecutor.execute(fhirEvent: fhirMessage.fhirEvent)).thenAnswer((realInvocation) async {});

      azureEventProcessor.addActionExecutor(mockDeleteActionExecutor);
      await azureEventProcessor.processOne();

      verify(mockDeleteActionExecutor.execute(fhirEvent: fhirMessage.fhirEvent)).called(1);
    });

    test('it can use action executor for create event type', () async {
      // reset(mockAzureMessageClient);
      when(mockAzureMessageClient.consumeMessages(messagesCount: 1)).thenAnswer(
        (realInvocation) async {
          List<FhirMessage> fhirMessages = [];
          fhirMessages.add(fhirMessageCreate);

          return fhirMessages;
        },
      );

      final mockCreateActionExecutor = MockCreateActionExecutor();
      when(mockCreateActionExecutor.type).thenReturn(FhirEventType.resourceCreated);
      when(mockCreateActionExecutor.execute(fhirEvent: fhirMessageCreate.fhirEvent))
          .thenAnswer((realInvocation) async {});

      azureEventProcessor.addActionExecutor(mockCreateActionExecutor);
      await azureEventProcessor.processOne();

      verify(mockCreateActionExecutor.execute(fhirEvent: fhirMessageCreate.fhirEvent)).called(1);
    });

    test('it can use post processors', () async {
      when(mockAzureMessageClient.consumeMessages(messagesCount: 1)).thenAnswer(
        (realInvocation) async {
          List<FhirMessage> fhirMessages = [];
          fhirMessages.add(fhirMessage);

          return fhirMessages;
        },
      );

      final tmpPostProcessor = MockTmpPostProcessor();
      when(tmpPostProcessor.apply(fhirMessage: fhirMessage, messageClient: mockAzureMessageClient))
          .thenAnswer((realInvocation) async {});
      azureEventProcessor.addPostProcessor(tmpPostProcessor);

      await azureEventProcessor.processOne();

      verify(tmpPostProcessor.apply(fhirMessage: fhirMessage, messageClient: mockAzureMessageClient)).called(1);
    });
  });
}
