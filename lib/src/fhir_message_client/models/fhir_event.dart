import 'package:fhir_r4/fhir_r4.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../fhir_event_type.dart';
import 'fhir_event_body.dart';
import 'fhir_event_type_converter.dart';

part 'fhir_event.freezed.dart';
part 'fhir_event.g.dart';

@freezed
abstract class FhirEvent with _$FhirEvent {
  const FhirEvent._();

  const factory FhirEvent({
    required String id,
    @FhirEventTypeConverter() required FhirEventType eventType,
    // CloudEvents (Azure Healthcare APIs) fields
    String? topic,
    String? subject,
    FhirEventData? data,
    String? dataVersion,
    String? metadataVersion,
    String? eventTime,
    // Fire Arrow MESSAGE channel subscription fields
    String? subscriptionId,
    String? subscriptionTimestamp,
    String? subscriptionResourceType,
    String? subscriptionResourceId,
    String? subscriptionResourceVersionId,
    String? payload,
    String? payloadContentType,
    String? criteria,
  }) = _FhirEvent;

  /// Canonical resource type (from data or subscription payload).
  String get resourceType =>
      data?.resourceType ?? subscriptionResourceType ?? '';

  /// Canonical resource id (from data.resourceFhirId or subscription resourceId).
  String get resourceId =>
      data?.resourceFhirId ?? subscriptionResourceId ?? '';

  /// Canonical resource version id as string (from data or subscription).
  String? get resourceVersionId => data != null
      ? data!.resourceVersionId.toString()
      : subscriptionResourceVersionId;

  /// Parsed FHIR R4 resource from [payload], when present and JSON.
  /// Returns null if [payload] is null, content type is not JSON, or parsing fails.
  /// Use [fhir_r4](https://pub.dev/packages/fhir_r4) types (e.g. `resource is Patient`) to work with the result.
  Resource? get payloadResource {
    final p = payload;
    if (p == null || p.isEmpty) return null;
    final ct = payloadContentType?.toLowerCase() ?? '';
    if (ct != 'application/fhir+json' && ct != 'application/json') {
      return null;
    }
    try {
      return Resource.fromJsonString(p);
    } catch (_) {
      return null;
    }
  }

  /// Serializes this event to JSON (implementation in generated code).
  Map<String, dynamic> toJson() => _$FhirEventToJson(this as _FhirEvent);

  factory FhirEvent.fromJson(Map<String, Object?> json) {
    if (_isSubscriptionFormat(json)) {
      return FhirEvent.fromSubscriptionJson(json);
    }
    return FhirEvent.fromCloudEventsJson(json);
  }

  /// Parses Azure Healthcare APIs / Event Grid CloudEvents JSON only.
  factory FhirEvent.fromCloudEventsJson(Map<String, Object?> json) =>
      _$FhirEventFromJson(json);

  static bool _isSubscriptionFormat(Map<String, Object?> json) =>
      json.containsKey('notificationId') &&
      json.containsKey('subscriptionId');

  /// Parses Fire Arrow MESSAGE channel subscription notification format.
  factory FhirEvent.fromSubscriptionJson(Map<String, Object?> json) {
    final eventTypeRaw = json['eventType'];
    final eventType = eventTypeRaw is String
        ? const FhirEventTypeConverter().fromJson(eventTypeRaw)
        : FhirEventType.resourceCreated;
    return FhirEvent(
      id: json['notificationId'] as String? ?? '',
      eventType: eventType,
      subscriptionId: json['subscriptionId'] as String?,
      subscriptionTimestamp: json['timestamp'] as String?,
      subscriptionResourceType: json['resourceType'] as String?,
      subscriptionResourceId: json['resourceId'] as String?,
      subscriptionResourceVersionId:
          json['resourceVersionId'] as String?,
      payload: json['payload'] as String?,
      payloadContentType: json['payloadContentType'] as String?,
      criteria: json['criteria'] as String?,
    );
  }
}
