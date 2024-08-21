import 'dart:io';
import 'package:azure_fhir_event_processor/azure_fhir_event_processor.dart';

class Messenger implements MessengerAbstract {
  final AbstractFhirEventProcessor _eventProcessor;

  Messenger(this._eventProcessor);

  factory Messenger.setupWithAzure({
    required String connectionString,
    required queueName,
    String? poisonQueueName,
    int? poisonedMessageTtl,
    required List<AbstractEventValidator> eventValidators,
    required List<AbstractActionExecutor> actionExecutors,
    List<AbstractPostProcessor>? postProcessors,
    int? messageVisibilityTimeout,
  }) {
    AbstractFhirMessageClient messageClient = AzureMessageClient(
      connectionString: connectionString,
      queueName: queueName,
      poisonQueueName: poisonQueueName,
      poisonedMessageTtl: poisonedMessageTtl,
      messageVisibilityTimeout: messageVisibilityTimeout,
    );

    AbstractFhirEventProcessor eventProcessor =
        AzureEventProcessor(messageClient: messageClient);
    for (final eventValidator in eventValidators) {
      eventProcessor.addValidator(eventValidator);
    }
    for (final executor in actionExecutors) {
      eventProcessor.addActionExecutor(executor);
    }
    for (final postProcessor in (postProcessors ?? [])) {
      eventProcessor.addPostProcessor(postProcessor);
    }

    return Messenger(eventProcessor);
  }

  @override
  Future<void> listen(
      {required Function(Object e, StackTrace? st) processExceptionHandler,
      Duration? sleepDuration}) async {
    final finalSleepDuration = sleepDuration ?? Duration(seconds: 20);

    while (true) {
      try {
        await _eventProcessor.processOne();
        final bool shouldSleep = await _eventProcessor.shouldSleep();

        if (shouldSleep) {
          sleep(finalSleepDuration);
        }
      } catch (e, st) {
        processExceptionHandler(e, st);
      }
    }
  }
}
