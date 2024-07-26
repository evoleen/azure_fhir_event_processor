import 'package:azure_fhir_event_processor/azure_fhir_event_processor.dart';

abstract class AbstractActionExecutor {
  /// The list of event types this executor will handle
  List<FhirEventType> get eventTypes;

  /// The list of resource types this executor will handle. Equivalent to
  /// FHIR entity names, such as "Patient" or "CarePlan". If the executor
  /// shall be called for any resourceType, the list must only have a
  /// single element '*'.
  List<String> get resourceTypes;

  Future<void> execute({required FhirEvent fhirEvent});
}
