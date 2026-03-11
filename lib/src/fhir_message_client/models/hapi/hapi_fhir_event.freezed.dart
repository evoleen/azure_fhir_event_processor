// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hapi_fhir_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HapiFhirEvent {
  @JsonKey(name: 'notificationId', defaultValue: '')
  String get id;
  @FhirEventTypeConverter()
  FhirEventType get eventType;
  String? get subscriptionId;
  @JsonKey(name: 'timestamp')
  @_StringOrNumConverter()
  String? get subscriptionTimestamp;
  @JsonKey(name: 'resourceType')
  String? get subscriptionResourceType;
  @JsonKey(name: 'resourceId')
  @_StringOrNumConverter()
  String? get subscriptionResourceId;
  @JsonKey(name: 'resourceVersionId')
  @_StringOrNumConverter()
  String? get subscriptionResourceVersionId;
  String? get payload;
  String? get payloadContentType;
  String? get criteria;

  /// Create a copy of HapiFhirEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $HapiFhirEventCopyWith<HapiFhirEvent> get copyWith =>
      _$HapiFhirEventCopyWithImpl<HapiFhirEvent>(
          this as HapiFhirEvent, _$identity);

  /// Serializes this HapiFhirEvent to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is HapiFhirEvent &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.eventType, eventType) ||
                other.eventType == eventType) &&
            (identical(other.subscriptionId, subscriptionId) ||
                other.subscriptionId == subscriptionId) &&
            (identical(other.subscriptionTimestamp, subscriptionTimestamp) ||
                other.subscriptionTimestamp == subscriptionTimestamp) &&
            (identical(
                    other.subscriptionResourceType, subscriptionResourceType) ||
                other.subscriptionResourceType == subscriptionResourceType) &&
            (identical(other.subscriptionResourceId, subscriptionResourceId) ||
                other.subscriptionResourceId == subscriptionResourceId) &&
            (identical(other.subscriptionResourceVersionId,
                    subscriptionResourceVersionId) ||
                other.subscriptionResourceVersionId ==
                    subscriptionResourceVersionId) &&
            (identical(other.payload, payload) || other.payload == payload) &&
            (identical(other.payloadContentType, payloadContentType) ||
                other.payloadContentType == payloadContentType) &&
            (identical(other.criteria, criteria) ||
                other.criteria == criteria));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      eventType,
      subscriptionId,
      subscriptionTimestamp,
      subscriptionResourceType,
      subscriptionResourceId,
      subscriptionResourceVersionId,
      payload,
      payloadContentType,
      criteria);

  @override
  String toString() {
    return 'HapiFhirEvent(id: $id, eventType: $eventType, subscriptionId: $subscriptionId, subscriptionTimestamp: $subscriptionTimestamp, subscriptionResourceType: $subscriptionResourceType, subscriptionResourceId: $subscriptionResourceId, subscriptionResourceVersionId: $subscriptionResourceVersionId, payload: $payload, payloadContentType: $payloadContentType, criteria: $criteria)';
  }
}

/// @nodoc
abstract mixin class $HapiFhirEventCopyWith<$Res> {
  factory $HapiFhirEventCopyWith(
          HapiFhirEvent value, $Res Function(HapiFhirEvent) _then) =
      _$HapiFhirEventCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'notificationId', defaultValue: '') String id,
      @FhirEventTypeConverter() FhirEventType eventType,
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
      String? criteria});
}

/// @nodoc
class _$HapiFhirEventCopyWithImpl<$Res>
    implements $HapiFhirEventCopyWith<$Res> {
  _$HapiFhirEventCopyWithImpl(this._self, this._then);

  final HapiFhirEvent _self;
  final $Res Function(HapiFhirEvent) _then;

  /// Create a copy of HapiFhirEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? eventType = null,
    Object? subscriptionId = freezed,
    Object? subscriptionTimestamp = freezed,
    Object? subscriptionResourceType = freezed,
    Object? subscriptionResourceId = freezed,
    Object? subscriptionResourceVersionId = freezed,
    Object? payload = freezed,
    Object? payloadContentType = freezed,
    Object? criteria = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      eventType: null == eventType
          ? _self.eventType
          : eventType // ignore: cast_nullable_to_non_nullable
              as FhirEventType,
      subscriptionId: freezed == subscriptionId
          ? _self.subscriptionId
          : subscriptionId // ignore: cast_nullable_to_non_nullable
              as String?,
      subscriptionTimestamp: freezed == subscriptionTimestamp
          ? _self.subscriptionTimestamp
          : subscriptionTimestamp // ignore: cast_nullable_to_non_nullable
              as String?,
      subscriptionResourceType: freezed == subscriptionResourceType
          ? _self.subscriptionResourceType
          : subscriptionResourceType // ignore: cast_nullable_to_non_nullable
              as String?,
      subscriptionResourceId: freezed == subscriptionResourceId
          ? _self.subscriptionResourceId
          : subscriptionResourceId // ignore: cast_nullable_to_non_nullable
              as String?,
      subscriptionResourceVersionId: freezed == subscriptionResourceVersionId
          ? _self.subscriptionResourceVersionId
          : subscriptionResourceVersionId // ignore: cast_nullable_to_non_nullable
              as String?,
      payload: freezed == payload
          ? _self.payload
          : payload // ignore: cast_nullable_to_non_nullable
              as String?,
      payloadContentType: freezed == payloadContentType
          ? _self.payloadContentType
          : payloadContentType // ignore: cast_nullable_to_non_nullable
              as String?,
      criteria: freezed == criteria
          ? _self.criteria
          : criteria // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _HapiFhirEvent extends HapiFhirEvent {
  const _HapiFhirEvent(
      {@JsonKey(name: 'notificationId', defaultValue: '') required this.id,
      @FhirEventTypeConverter() required this.eventType,
      this.subscriptionId,
      @JsonKey(name: 'timestamp')
      @_StringOrNumConverter()
      this.subscriptionTimestamp,
      @JsonKey(name: 'resourceType') this.subscriptionResourceType,
      @JsonKey(name: 'resourceId')
      @_StringOrNumConverter()
      this.subscriptionResourceId,
      @JsonKey(name: 'resourceVersionId')
      @_StringOrNumConverter()
      this.subscriptionResourceVersionId,
      this.payload,
      this.payloadContentType,
      this.criteria})
      : super._();
  factory _HapiFhirEvent.fromJson(Map<String, dynamic> json) =>
      _$HapiFhirEventFromJson(json);

  @override
  @JsonKey(name: 'notificationId', defaultValue: '')
  final String id;
  @override
  @FhirEventTypeConverter()
  final FhirEventType eventType;
  @override
  final String? subscriptionId;
  @override
  @JsonKey(name: 'timestamp')
  @_StringOrNumConverter()
  final String? subscriptionTimestamp;
  @override
  @JsonKey(name: 'resourceType')
  final String? subscriptionResourceType;
  @override
  @JsonKey(name: 'resourceId')
  @_StringOrNumConverter()
  final String? subscriptionResourceId;
  @override
  @JsonKey(name: 'resourceVersionId')
  @_StringOrNumConverter()
  final String? subscriptionResourceVersionId;
  @override
  final String? payload;
  @override
  final String? payloadContentType;
  @override
  final String? criteria;

  /// Create a copy of HapiFhirEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$HapiFhirEventCopyWith<_HapiFhirEvent> get copyWith =>
      __$HapiFhirEventCopyWithImpl<_HapiFhirEvent>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$HapiFhirEventToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _HapiFhirEvent &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.eventType, eventType) ||
                other.eventType == eventType) &&
            (identical(other.subscriptionId, subscriptionId) ||
                other.subscriptionId == subscriptionId) &&
            (identical(other.subscriptionTimestamp, subscriptionTimestamp) ||
                other.subscriptionTimestamp == subscriptionTimestamp) &&
            (identical(
                    other.subscriptionResourceType, subscriptionResourceType) ||
                other.subscriptionResourceType == subscriptionResourceType) &&
            (identical(other.subscriptionResourceId, subscriptionResourceId) ||
                other.subscriptionResourceId == subscriptionResourceId) &&
            (identical(other.subscriptionResourceVersionId,
                    subscriptionResourceVersionId) ||
                other.subscriptionResourceVersionId ==
                    subscriptionResourceVersionId) &&
            (identical(other.payload, payload) || other.payload == payload) &&
            (identical(other.payloadContentType, payloadContentType) ||
                other.payloadContentType == payloadContentType) &&
            (identical(other.criteria, criteria) ||
                other.criteria == criteria));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      eventType,
      subscriptionId,
      subscriptionTimestamp,
      subscriptionResourceType,
      subscriptionResourceId,
      subscriptionResourceVersionId,
      payload,
      payloadContentType,
      criteria);

  @override
  String toString() {
    return 'HapiFhirEvent(id: $id, eventType: $eventType, subscriptionId: $subscriptionId, subscriptionTimestamp: $subscriptionTimestamp, subscriptionResourceType: $subscriptionResourceType, subscriptionResourceId: $subscriptionResourceId, subscriptionResourceVersionId: $subscriptionResourceVersionId, payload: $payload, payloadContentType: $payloadContentType, criteria: $criteria)';
  }
}

/// @nodoc
abstract mixin class _$HapiFhirEventCopyWith<$Res>
    implements $HapiFhirEventCopyWith<$Res> {
  factory _$HapiFhirEventCopyWith(
          _HapiFhirEvent value, $Res Function(_HapiFhirEvent) _then) =
      __$HapiFhirEventCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'notificationId', defaultValue: '') String id,
      @FhirEventTypeConverter() FhirEventType eventType,
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
      String? criteria});
}

/// @nodoc
class __$HapiFhirEventCopyWithImpl<$Res>
    implements _$HapiFhirEventCopyWith<$Res> {
  __$HapiFhirEventCopyWithImpl(this._self, this._then);

  final _HapiFhirEvent _self;
  final $Res Function(_HapiFhirEvent) _then;

  /// Create a copy of HapiFhirEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? eventType = null,
    Object? subscriptionId = freezed,
    Object? subscriptionTimestamp = freezed,
    Object? subscriptionResourceType = freezed,
    Object? subscriptionResourceId = freezed,
    Object? subscriptionResourceVersionId = freezed,
    Object? payload = freezed,
    Object? payloadContentType = freezed,
    Object? criteria = freezed,
  }) {
    return _then(_HapiFhirEvent(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      eventType: null == eventType
          ? _self.eventType
          : eventType // ignore: cast_nullable_to_non_nullable
              as FhirEventType,
      subscriptionId: freezed == subscriptionId
          ? _self.subscriptionId
          : subscriptionId // ignore: cast_nullable_to_non_nullable
              as String?,
      subscriptionTimestamp: freezed == subscriptionTimestamp
          ? _self.subscriptionTimestamp
          : subscriptionTimestamp // ignore: cast_nullable_to_non_nullable
              as String?,
      subscriptionResourceType: freezed == subscriptionResourceType
          ? _self.subscriptionResourceType
          : subscriptionResourceType // ignore: cast_nullable_to_non_nullable
              as String?,
      subscriptionResourceId: freezed == subscriptionResourceId
          ? _self.subscriptionResourceId
          : subscriptionResourceId // ignore: cast_nullable_to_non_nullable
              as String?,
      subscriptionResourceVersionId: freezed == subscriptionResourceVersionId
          ? _self.subscriptionResourceVersionId
          : subscriptionResourceVersionId // ignore: cast_nullable_to_non_nullable
              as String?,
      payload: freezed == payload
          ? _self.payload
          : payload // ignore: cast_nullable_to_non_nullable
              as String?,
      payloadContentType: freezed == payloadContentType
          ? _self.payloadContentType
          : payloadContentType // ignore: cast_nullable_to_non_nullable
              as String?,
      criteria: freezed == criteria
          ? _self.criteria
          : criteria // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
