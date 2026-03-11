import 'package:json_annotation/json_annotation.dart';

import '../fhir_event_type.dart';

/// Converts [FhirEventType] to/from AHDS (Azure Health Data Services) Event Grid
/// CloudEvents JSON strings (Microsoft.HealthcareApis.FhirResource*). Use on
/// [AhdsFhirEvent]. [fromJson] also accepts HAPI MESSAGE channel values
/// (CREATE, UPDATE, DELETE, MANUALLY_TRIGGERED).
class AhdsFhirEventTypeConverter implements JsonConverter<FhirEventType, String> {
  const AhdsFhirEventTypeConverter();

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

/// Converts [FhirEventType] to/from HAPI MESSAGE channel JSON strings
/// (CREATE, UPDATE, DELETE, MANUALLY_TRIGGERED). Use on [HapiFhirEvent] so
/// [toJson] emits HAPI-native values instead of AHDS CloudEvents strings.
class HapiFhirEventTypeConverter implements JsonConverter<FhirEventType, String> {
  const HapiFhirEventTypeConverter();

  @override
  FhirEventType fromJson(String json) =>
      const AhdsFhirEventTypeConverter().fromJson(json);

  @override
  String toJson(FhirEventType object) {
    switch (object) {
      case FhirEventType.resourceCreated:
        return 'CREATE';
      case FhirEventType.resourceUpdated:
        return 'UPDATE';
      case FhirEventType.resourceDeleted:
        return 'DELETE';
      case FhirEventType.manuallyTriggered:
        return 'MANUALLY_TRIGGERED';
    }
  }
}
