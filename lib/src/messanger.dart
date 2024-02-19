import 'dart:io';
import 'fhir_event_processor/abstract_action_executor.dart';
import 'fhir_event_processor/abstract_fhir_event_processor.dart';
import 'fhir_event_processor/azure_event_processor.dart';
import 'fhir_message_client/abstract_fhir_message_client.dart';
import 'fhir_message_client/azure_message_client.dart';
import 'validators/abstract_event_validator.dart';

class Messanger {
  final FhirEventProcessorAbstract _eventProcessor;

  Messanger(this._eventProcessor);

  factory Messanger.withAzure({
    required String connectionString,
    required queueName,
    required List<EventValidatorAbstract> eventValidators,
    required List<ActionExecutorAbstract> actionExecutors,
    int? msgVisibilityTimeout,
  }) {
    FhirMessageClientAbstract messageClient = AzureMessageClient(
      connectionString: connectionString,
      queueName: queueName,
      msgVisibilityTimeout: msgVisibilityTimeout,
    );

    FhirEventProcessorAbstract eventProcessor = AzureEventProcessor(messageClient: messageClient);
    for (final eventValidator in eventValidators) {
      eventProcessor.addValidator(eventValidator);
    }
    for (final executor in actionExecutors) {
      eventProcessor.addActionExecutor(executor);
    }

    return Messanger(eventProcessor);
  }

  Future<void> listen({required Function(Object e) processExceptionHandler, Duration? sleepDuration}) async {
    final finalSleepDuration = sleepDuration ?? Duration(seconds: 20);

    while (true) {
      try {
        await _eventProcessor.processOne();
        final bool shouldSleep = await _eventProcessor.shouldSleep();

        if (shouldSleep) {
          sleep(finalSleepDuration);
        }
      } catch (e) {
        processExceptionHandler(e);
      }
    }
  }
}
