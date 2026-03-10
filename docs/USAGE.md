# Client app usage

This document shows how to use the package with the **Messenger** API (recommended) for both queue formats and the optional FHIR payload parsing.

---

## 1. AHDS queue (Azure Health Data Services / Event Grid)

Use when your queue receives **Base64-encoded** CloudEvents from **Azure Health Data Services (AHDS)** via Event Grid. Default: no parser or encoding changes needed (uses `AhdsEventGridMessageParser` and Base64).

```dart
import 'package:azure_fhir_event_processor/azure_fhir_event_processor.dart';

final messenger = Messenger.setupWithAzure(
  connectionString: env.azureStorageConnectionString,
  queueName: env.azureStorageQueueName,
  poisonQueueName: 'poisoned-messages',
  poisonedMessageTtl: 604800,
  messageVisibilityTimeout: 180,
  eventValidators: [PoisonEventValidator()],
  actionExecutors: [
    PatientReportGenerationExecutor(),
    PatientEmailReportSenderExecutor(),
  ],
  postProcessors: [RemoveMessagePostProcessor()],  // or your own (e.g. delete after process)
);

talker.info('Starting queue listener.');

await messenger.listen(
  processExceptionHandler: processException,
  sleepDuration: getRandomDurationInMilliseconds(basicMilliseconds: 3000),
);
```

---

## 2. HAPI queue (HAPI FHIR / Fire Arrow MESSAGE channel)

Use when your queue receives **plain JSON** subscription notifications from **HAPI FHIR** (e.g. Fire Arrow) MESSAGE channel (see [MESSAGE_CHANNEL_SUBSCRIPTIONS_AZURE_QUEUE.md](MESSAGE_CHANNEL_SUBSCRIPTIONS_AZURE_QUEUE.md)). Add two arguments: `messageEncoding: QueueMessageEncoding.none` and `parser: HapiSubscriptionNotificationMessageParser()`.

```dart
import 'package:azure_fhir_event_processor/azure_fhir_event_processor.dart';

final messenger = Messenger.setupWithAzure(
  connectionString: env.azureStorageConnectionString,
  queueName: env.azureStorageQueueName,  // e.g. fhir-subscription-events
  poisonQueueName: 'poisoned-messages',
  poisonedMessageTtl: 604800,
  messageVisibilityTimeout: 180,
  messageEncoding: QueueMessageEncoding.none,   // plain JSON, no Base64
  parser: HapiSubscriptionNotificationMessageParser(),
  eventValidators: [PoisonEventValidator()],
  actionExecutors: [
    PatientReportGenerationExecutor(),
    PatientEmailReportSenderExecutor(),
  ],
  postProcessors: [RemoveMessagePostProcessor()],
);

await messenger.listen(
  processExceptionHandler: processException,
  sleepDuration: getRandomDurationInMilliseconds(basicMilliseconds: 3000),
);
```

Executors receive `FhirEvent` (the abstract base). The runtime type is `AhdsFhirEvent` or `HapiFhirEvent`, so you only see the common fields (`eventType`, `resourceType`, `resourceId`, `resourceVersionId`, `payloadResource`) unless you cast: e.g. `if (fhirEvent is HapiFhirEvent) { ... hapiEvent.subscriptionId ... }`.

**Why `eventTypes` and `resourceTypes` are still needed:** The processor uses them to decide *which* executor runs for each message. HAPI messages are normalized to the same `FhirEventType` (e.g. CREATE → `resourceCreated`) and the same `resourceType` string (e.g. `"CarePlan"` from the notification), so the same filtering applies. If you omit them or use `['*']`, that executor would run for every message; with `resourceTypes: ['CarePlan']` it runs only when the message is for a CarePlan.

---

## 3. Using the parsed FHIR payload in an executor

When the server sends the full FHIR resource in the message (`include-full-resource: true`), you can get a typed R4 resource via **`fhirEvent.payloadResource`**. Add `fhir_r4` to your app’s `pubspec.yaml` if you use it:

```yaml
dependencies:
  azure_fhir_event_processor: ^1.0.1
  fhir_r4: ^0.5.1
```

Example executor (e.g. CarePlan) that uses the payload when present:

```dart
import 'package:azure_fhir_event_processor/azure_fhir_event_processor.dart';
import 'package:fhir_r4/fhir_r4.dart';

class PatientReportGenerationExecutor implements AbstractActionExecutor {
  @override
  List<FhirEventType> get eventTypes => [
        FhirEventType.resourceCreated,
        FhirEventType.resourceUpdated,
      ];

  @override
  List<String> get resourceTypes => ['CarePlan'];

  @override
  Future<void> execute({required FhirEvent fhirEvent}) async {
    // Canonical fields (always available for both queue formats)
    final resourceType = fhirEvent.resourceType;
    final resourceId = fhirEvent.resourceId;

    // When the message includes the full resource (HAPI with include-full-resource: true)
    final resource = fhirEvent.payloadResource;
    if (resource != null && resource is CarePlan) {
      // Use typed CarePlan from fhir_r4
      // e.g. resource.title?.valueString, resource.activity, etc.
      await generateReportFromCarePlan(resource);
    } else {
      // No payload (e.g. metadata-only or AHDS queue) — fetch by resourceId if needed
      await generateReportFromId(resourceType, resourceId);
    }
  }
}
```

Summary:

- **`fhirEvent.payloadResource`** (on base `FhirEvent`) – parsed `Resource?` from [fhir_r4](https://pub.dev/packages/fhir_r4); non-null only for `HapiFhirEvent` when payload is JSON and parsing succeeds. Use `resource is CarePlan`, `resource is Patient`, etc.
- For HAPI-only fields (e.g. `payload`, `payloadContentType`, `subscriptionId`), cast: `if (fhirEvent is HapiFhirEvent) { ... }`. For AHDS-only fields (`topic`, `subject`, `data`), cast to `AhdsFhirEvent`.

---

## 4. Low-level API (optional)

If you prefer to wire the processor yourself instead of using `Messenger`:

```dart
// AHDS (Azure Health Data Services) Event Grid — default
final messageClient = AzureMessageClient(
  connectionString: connectionString,
  queueName: queueName,
  messageVisibilityTimeout: 180,
  // messageEncoding: QueueMessageEncoding.base64 (default)
  // parser: AhdsEventGridMessageParser() (default)
);

// HAPI FHIR MESSAGE channel (e.g. Fire Arrow)
final messageClient = AzureMessageClient(
  connectionString: connectionString,
  queueName: queueName,
  messageVisibilityTimeout: 180,
  messageEncoding: QueueMessageEncoding.none,
  parser: HapiSubscriptionNotificationMessageParser(),
);

final processor = AzureEventProcessor(messageClient: messageClient);
processor.addValidator(PoisonEventValidator());
processor.addActionExecutor(PatientReportGenerationExecutor());
processor.addPostProcessor(RemoveMessagePostProcessor());

while (true) {
  await processor.processOne();
  if (await processor.shouldSleep()) {
    await Future<void>.delayed(Duration(seconds: 3));
  }
}
```
