import 'package:json_annotation/json_annotation.dart';

import '../fhir_event_type.dart';

/// Converts between [FhirEventType] and JSON strings for both wire formats:
/// - Azure Healthcare APIs: Microsoft.HealthcareApis.FhirResource*
/// - Fire Arrow MESSAGE channel: CREATE, UPDATE, DELETE, MANUALLY_TRIGGERED
class FhirEventTypeConverter implements JsonConverter<FhirEventType, String> {
  const FhirEventTypeConverter();

  static const _cloudEventsCreated =
      'Microsoft.HealthcareApis.FhirResourceCreated';
  static const _cloudEventsUpdated =
      'Microsoft.HealthcareApis.FhirResourceUpdated';
  static const _cloudEventsDeleted =
      'Microsoft.HealthcareApis.FhirResourceDeleted';

  @override
  FhirEventType fromJson(String json) {
    switch (json) {
      case _cloudEventsCreated:
      case 'CREATE':
        return FhirEventType.resourceCreated;
      case _cloudEventsUpdated:
      case 'UPDATE':
        return FhirEventType.resourceUpdated;
      case _cloudEventsDeleted:
      case 'DELETE':
        return FhirEventType.resourceDeleted;
      case 'MANUALLY_TRIGGERED':
        return FhirEventType.manuallyTriggered;
      default:
        throw ArgumentError('Unknown FhirEventType: $json');
    }
  }

  @override
  String toJson(FhirEventType object) {
    switch (object) {
      case FhirEventType.resourceCreated:
        return _cloudEventsCreated;
      case FhirEventType.resourceUpdated:
        return _cloudEventsUpdated;
      case FhirEventType.resourceDeleted:
        return _cloudEventsDeleted;
      case FhirEventType.manuallyTriggered:
        return 'MANUALLY_TRIGGERED';
    }
  }
}
