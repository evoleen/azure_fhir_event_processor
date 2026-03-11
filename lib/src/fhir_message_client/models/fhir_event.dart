import 'package:fhir_r4/fhir_r4.dart';

import '../fhir_event_type.dart';
import 'ahds/ahds_fhir_event.dart';
import 'hapi/hapi_fhir_event.dart';

/// Common base for FHIR subscription events from either AHDS (Event Grid)
/// or HAPI (MESSAGE channel). Use [AhdsFhirEvent] or [HapiFhirEvent] for
/// format-specific fields.
abstract class FhirEvent {
  const FhirEvent();

  String get id;
  FhirEventType get eventType;

  /// Resource type (e.g. "Patient", "CarePlan").
  String get resourceType;

  /// Resource id (e.g. "Patient/123" or logical id).
  String get resourceId;

  /// Resource version id as string, if available.
  String? get resourceVersionId;

  /// Parsed FHIR R4 resource from payload; only non-null for [HapiFhirEvent]
  /// when the message includes full resource JSON.
  Resource? get payloadResource => null;

  /// Serializes this event to JSON (AHDS or HAPI shape).
  Map<String, dynamic> toJson();

  /// Detects AHDS vs HAPI format and returns the matching subclass.
  static FhirEvent parseFhirEvent(Map<String, Object?> json) {
    if (json.containsKey('notificationId') &&
        json.containsKey('subscriptionId')) {
      return HapiFhirEvent.fromSubscriptionJson(json);
    }
    return AhdsFhirEvent.fromJson(json);
  }
}
