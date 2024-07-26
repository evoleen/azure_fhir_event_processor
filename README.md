# Azure FHIR Event Processor

A small base package to help implementing queue workers for FHIR events.
- Can subscribe to Azure Storage Queues
- Deserializes event data from Event Grid format
- Support for message validators (for example to automatically drop queue items that have been processed too often)
- Support for post-message hooks

The goal of the package is to simplify the creation of Dart workers that subscribe to FHIR event queues.
