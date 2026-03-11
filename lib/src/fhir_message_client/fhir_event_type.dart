/// Unified event type for both Azure Healthcare APIs and Fire Arrow MESSAGE
/// channel (CREATE, UPDATE, DELETE, MANUALLY_TRIGGERED).
enum FhirEventType {
  resourceDeleted,
  resourceCreated,
  resourceUpdated,
  manuallyTriggered,
}
