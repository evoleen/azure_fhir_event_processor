import 'models/fhir_message.dart';

abstract class FhirMessageClientAbstract {
  // String get poisonQueueName;
  Future<List<FhirMessage>> consumeMessages({required int messagesCount});
  Future<void> removeMessage({required FhirMessage fhirMessage});
  Future<bool> queueIsNotEmpty();
  Future<void> sanitizeMessage({required FhirMessage fhirPoisonedMessage});
}

enum FhirEventType {
  resourceDeleted("Microsoft.HealthcareApis.FhirResourceDeleted"),
  resourceCreated("Microsoft.HealthcareApis.FhirResourceCreated"),
  resourceUpdated("Microsoft.HealthcareApis.FhirResourceUpdated");

  final String name;

  const FhirEventType(this.name);
}
