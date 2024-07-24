import 'dart:io';
import 'abstract_messenger.dart';
import 'package:evoleen_fhir_events/src/fhir_event_processor/abstract_action_executor.dart';
import 'package:evoleen_fhir_events/src/fhir_event_processor/abstract_fhir_event_processor.dart';
import 'package:evoleen_fhir_events/src/fhir_event_processor/abstract_post_processor.dart';
import 'package:evoleen_fhir_events/src/fhir_event_processor/azure_event_processor.dart';
import 'package:evoleen_fhir_events/src/fhir_message_client/abstract_fhir_message_client.dart';
import 'package:evoleen_fhir_events/src/fhir_message_client/azure_message_client.dart';
import 'package:evoleen_fhir_events/src/validators/abstract_event_validator.dart';

class Messenger implements MessengerAbstract {
  final AbstractFhirEventProcessor _eventProcessor;

  Messenger(this._eventProcessor);

  factory Messenger.setupWithAzure({
    required String connectionString,
    required queueName,
    required List<AbstractEventValidator> eventValidators,
    required List<AbstractActionExecutor> actionExecutors,
    List<AbstractPostProcessor>? postProcessors,
    int? messageVisibilityTimeout,
  }) {
    AbstractFhirMessageClient messageClient = AzureMessageClient(
      connectionString: connectionString,
      queueName: queueName,
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
      {required Function(Object e) processExceptionHandler,
      Duration? sleepDuration}) async {
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
