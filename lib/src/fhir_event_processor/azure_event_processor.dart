import '../errors.dart';
import '../fhir_message_client/abstract_fhir_message_client.dart';
import '../fhir_message_client/models/fhir_message.dart';
import '../validators/abstract_event_validator.dart';
import 'abstract_action_executor.dart';
import 'abstract_fhir_event_processor.dart';

class AzureEventProcessor implements FhirEventProcessorAbstract {
  late FhirMessageClientAbstract _messageClient;
  final List<EventValidatorAbstract> _validators = [];
  final List<ActionExecutorAbstract> _actionExecutors = [];

  AzureEventProcessor({required messageClient}) {
    _messageClient = messageClient;
  }

  @override
  Future<void> processOne() async {
    if (_actionExecutors.isEmpty) {
      throw Exception('No action executors are provided');
    }

    List<FhirMessage> fhirMessages = await _messageClient.consumeMessages(messagesCount: 1);
    if (fhirMessages.isEmpty) return;

    FhirMessage fhirMessage = fhirMessages.first;
    await _validate(fhirMessage);
    await _executeActions(fhirMessage);

    // await _messageClient.removeMessage(fhirMessage: fhirMessage);
  }

  @override
  Future<bool> shouldSleep() async {
    final bool isNotEmpty = await _messageClient.queueIsNotEmpty();

    return isNotEmpty == false;
  }

  @override
  void addActionExecutor(ActionExecutorAbstract actionExecutor) {
    _actionExecutors.add(actionExecutor);
  }

  @override
  void addValidator(EventValidatorAbstract eventValidator) {
    _validators.add(eventValidator);
  }

  Future<void> _validate(FhirMessage fhirMessage) async {
    for (final validator in _validators) {
      try {
        validator.validate(fhirMessage: fhirMessage);
      } on MessageValidatorException {
        HandlerResult handlerResult = await validator.handleException(
          fhirMessage: fhirMessage,
          messageClient: _messageClient,
        );

        if (handlerResult.hasToRethrow) {
          rethrow;
        }
      }
    }
  }

  Future<void> _executeActions(FhirMessage fhirMessage) async {
    for (final executor in _actionExecutors) {
      if (executor.type.name == fhirMessage.body.eventType) {
        await executor.execute(fhirEvent: fhirMessage.body);
      }
    }
  }
}
