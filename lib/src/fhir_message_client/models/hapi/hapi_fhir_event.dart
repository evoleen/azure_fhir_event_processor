import 'package:fhir_r4/fhir_r4.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../fhir_event_type.dart';
import '../fhir_event.dart';
import '../fhir_event_type_converter.dart';

part 'hapi_fhir_event.freezed.dart';
part 'hapi_fhir_event.g.dart';

/// Coerces JSON value to [String?] (handles String, num, etc.).
class _StringOrNumConverter implements JsonConverter<String?, Object?> {
  const _StringOrNumConverter();

  @override
  String? fromJson(Object? json) {
    if (json == null) return null;
    if (json is String) return json;
    if (json is num) return json.toString();
    return json.toString();
  }

  @override
  Object? toJson(String? object) => object;
}

/// FHIR event from **HAPI FHIR** (e.g. Fire Arrow) MESSAGE channel
/// subscription notification. Exposes only HAPI-specific fields and
/// [payloadResource] when the message includes full resource JSON.
@freezed
abstract class HapiFhirEvent extends FhirEvent with _$HapiFhirEvent {
  const HapiFhirEvent._();

  const factory HapiFhirEvent({
    @JsonKey(name: 'notificationId', defaultValue: '') required String id,
    @FhirEventTypeConverter() required FhirEventType eventType,
    String? subscriptionId,
    @JsonKey(name: 'timestamp')
    @_StringOrNumConverter()
    String? subscriptionTimestamp,
    @JsonKey(name: 'resourceType') String? subscriptionResourceType,
    @JsonKey(name: 'resourceId')
    @_StringOrNumConverter()
    String? subscriptionResourceId,
    @JsonKey(name: 'resourceVersionId')
    @_StringOrNumConverter()
    String? subscriptionResourceVersionId,
    String? payload,
    String? payloadContentType,
    String? criteria,
  }) = _HapiFhirEvent;

  factory HapiFhirEvent.fromJson(Map<String, Object?> json) =>
      _$HapiFhirEventFromJson(json);

  /// Parses HAPI MESSAGE channel subscription notification JSON only.
  factory HapiFhirEvent.fromSubscriptionJson(Map<String, Object?> json) {
    final normalized = Map<String, Object?>.from(json);
    final et = normalized['eventType'];
    if (et == null || et is! String) {
      normalized['eventType'] = 'CREATE';
    }
    return HapiFhirEvent.fromJson(normalized);
  }

  @override
  String get resourceType => subscriptionResourceType ?? '';

  @override
  String get resourceId => subscriptionResourceId ?? '';

  @override
  String? get resourceVersionId => subscriptionResourceVersionId;

  @override
  Resource? get payloadResource {
    final p = payload;
    if (p == null || p.isEmpty) return null;
    final ct = payloadContentType?.toLowerCase().trim() ?? '';
    // MIME types may include parameters (e.g. "application/fhir+json; charset=utf-8")
    final baseContentType = ct.split(';').firstOrNull?.trim();
    if (baseContentType != 'application/fhir+json' &&
        baseContentType != 'application/json') {
      return null;
    }
    try {
      return Resource.fromJsonString(p);
    } catch (_) {
      return null;
    }
  }
}
