import 'package:azure_fhir_event_processor/azure_fhir_event_processor.dart';

class AzureEventProcessor implements AbstractFhirEventProcessor {
  late AbstractFhirMessageClient _messageClient;
  final List<AbstractEventValidator> _validators = [];
  final List<AbstractActionExecutor> _actionExecutors = [];
  final List<AbstractPostProcessor> _postProcessors = [];

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
  void addActionExecutor(AbstractActionExecutor actionExecutor) {
    _actionExecutors.add(actionExecutor);
  }

  @override
  void addValidator(AbstractEventValidator eventValidator) {
    _validators.add(eventValidator);
  }

  @override
  void addPostProcessor(AbstractPostProcessor postProcessor) {
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
      await executor.execute(fhirEvent: fhirMessage.fhirEvent);
    }
  }

  Future<void> _postProcessing(FhirMessage fhirMessage) async {
    for (final postProcessor in _postProcessors) {
      await postProcessor.apply(
          fhirMessage: fhirMessage, messageClient: _messageClient);
    }
  }
}
