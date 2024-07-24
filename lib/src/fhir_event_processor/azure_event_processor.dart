import 'package:evoleen_fhir_events/src/fhir_event_processor/abstract_post_processor.dart';

import 'package:evoleen_fhir_events/src/errors.dart';
import 'package:evoleen_fhir_events/src/fhir_message_client/abstract_fhir_message_client.dart';
import 'package:evoleen_fhir_events/src/fhir_message_client/models/fhir_message.dart';
import 'package:evoleen_fhir_events/src/validators/abstract_event_validator.dart';
import 'package:evoleen_fhir_events/src/fhir_event_processor/abstract_action_executor.dart';
import 'package:evoleen_fhir_events/src/fhir_event_processor/abstract_fhir_event_processor.dart';

class AzureEventProcessor implements FhirEventProcessorAbstract {
  late FhirMessageClientAbstract _messageClient;
  final List<EventValidatorAbstract> _validators = [];
  final List<ActionExecutorAbstract> _actionExecutors = [];
  final List<PostProcessorAbstract> _postProcessors = [];

  AzureEventProcessor({required messageClient}) {
    _messageClient = messageClient;
  }

  @override
  Future<void> processOne({required}) async {
    List<FhirMessage> fhirMessages =
        await _messageClient.consumeMessages(messagesCount: 1);
    if (fhirMessages.isEmpty) return;
    FhirMessage fhirMessage = fhirMessages.first;

    await _validate(fhirMessage);
    await _executeActions(fhirMessage);
    await _postProcessing(fhirMessage);
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

  @override
  void addPostProcessor(PostProcessorAbstract postProcessor) {
    _postProcessors.add(postProcessor);
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
      if (executor.type.name == fhirMessage.fhirEvent.eventType) {
        await executor.execute(fhirEvent: fhirMessage.fhirEvent);
      }
    }
  }

  Future<void> _postProcessing(FhirMessage fhirMessage) async {
    for (final postProcessor in _postProcessors) {
      await postProcessor.apply(
          fhirMessage: fhirMessage, messageClient: _messageClient);
    }
  }
}
