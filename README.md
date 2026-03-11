# Azure FHIR Event Processor

A small base package to help implementing queue workers for FHIR events.
- Can subscribe to Azure Storage Queues
- Deserializes event data from Event Grid format
- **Supports Fire Arrow MESSAGE channel** (plain JSON subscription notifications)
- **Optional parsed FHIR payload** via [fhir_r4](https://pub.dev/packages/fhir_r4) when the message includes the full resource
- Support for message validators (for example to automatically drop queue items that have been processed too often)
- Support for post-message hooks

The goal of the package is to simplify the creation of Dart workers that subscribe to FHIR event queues.

**→ [Client app usage (both queue formats + payload)](USAGE.md)**
