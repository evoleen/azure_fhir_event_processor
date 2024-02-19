import 'models/fhir_message.dart';

abstract class FhirMessageClientAbstract {
  Future<List<FhirMessage>> consumeMessages({required int messagesCount});
  Future<void> removeMessage({required FhirMessage fhirMessage});
  Future<bool> queueIsNotEmpty();
}

enum FhirEventType {
  resourceDeleted("Microsoft.HealthcareApis.FhirResourceDeleted"),
  resourceCreated("Microsoft.HealthcareApis.FhirResourceCreated"),
  resourceUpdated("Microsoft.HealthcareApis.FhirResourceUpdated");

  final String name;

  const FhirEventType(this.name);
}
