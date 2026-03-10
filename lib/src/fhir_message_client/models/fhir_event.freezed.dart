// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fhir_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FhirEvent {
  String get id;
  @FhirEventTypeConverter()
  FhirEventType get eventType; // CloudEvents (Azure Healthcare APIs) fields
  String? get topic;
  String? get subject;
  FhirEventData? get data;
  String? get dataVersion;
  String? get metadataVersion;
  String? get eventTime; // Fire Arrow MESSAGE channel subscription fields
  String? get subscriptionId;
  String? get subscriptionTimestamp;
  String? get subscriptionResourceType;
  String? get subscriptionResourceId;
  String? get subscriptionResourceVersionId;
  String? get payload;
  String? get payloadContentType;
  String? get criteria;

  /// Create a copy of FhirEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FhirEventCopyWith<FhirEvent> get copyWith =>
      _$FhirEventCopyWithImpl<FhirEvent>(this as FhirEvent, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FhirEvent &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.eventType, eventType) ||
                other.eventType == eventType) &&
            (identical(other.topic, topic) || other.topic == topic) &&
            (identical(other.subject, subject) || other.subject == subject) &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.dataVersion, dataVersion) ||
                other.dataVersion == dataVersion) &&
            (identical(other.metadataVersion, metadataVersion) ||
                other.metadataVersion == metadataVersion) &&
            (identical(other.eventTime, eventTime) ||
                other.eventTime == eventTime) &&
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

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      eventType,
      topic,
      subject,
      data,
      dataVersion,
      metadataVersion,
      eventTime,
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
    return 'FhirEvent(id: $id, eventType: $eventType, topic: $topic, subject: $subject, data: $data, dataVersion: $dataVersion, metadataVersion: $metadataVersion, eventTime: $eventTime, subscriptionId: $subscriptionId, subscriptionTimestamp: $subscriptionTimestamp, subscriptionResourceType: $subscriptionResourceType, subscriptionResourceId: $subscriptionResourceId, subscriptionResourceVersionId: $subscriptionResourceVersionId, payload: $payload, payloadContentType: $payloadContentType, criteria: $criteria)';
  }
}

/// @nodoc
abstract mixin class $FhirEventCopyWith<$Res> {
  factory $FhirEventCopyWith(FhirEvent value, $Res Function(FhirEvent) _then) =
      _$FhirEventCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      @FhirEventTypeConverter() FhirEventType eventType,
      String? topic,
      String? subject,
      FhirEventData? data,
      String? dataVersion,
      String? metadataVersion,
      String? eventTime,
      String? subscriptionId,
      String? subscriptionTimestamp,
      String? subscriptionResourceType,
      String? subscriptionResourceId,
      String? subscriptionResourceVersionId,
      String? payload,
      String? payloadContentType,
      String? criteria});

  $FhirEventDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$FhirEventCopyWithImpl<$Res> implements $FhirEventCopyWith<$Res> {
  _$FhirEventCopyWithImpl(this._self, this._then);

  final FhirEvent _self;
  final $Res Function(FhirEvent) _then;

  /// Create a copy of FhirEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? eventType = null,
    Object? topic = freezed,
    Object? subject = freezed,
    Object? data = freezed,
    Object? dataVersion = freezed,
    Object? metadataVersion = freezed,
    Object? eventTime = freezed,
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
      topic: freezed == topic
          ? _self.topic
          : topic // ignore: cast_nullable_to_non_nullable
              as String?,
      subject: freezed == subject
          ? _self.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as FhirEventData?,
      dataVersion: freezed == dataVersion
          ? _self.dataVersion
          : dataVersion // ignore: cast_nullable_to_non_nullable
              as String?,
      metadataVersion: freezed == metadataVersion
          ? _self.metadataVersion
          : metadataVersion // ignore: cast_nullable_to_non_nullable
              as String?,
      eventTime: freezed == eventTime
          ? _self.eventTime
          : eventTime // ignore: cast_nullable_to_non_nullable
              as String?,
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

  /// Create a copy of FhirEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FhirEventDataCopyWith<$Res>? get data {
    if (_self.data == null) {
      return null;
    }

    return $FhirEventDataCopyWith<$Res>(_self.data!, (value) {
      return _then(_self.copyWith(data: value));
    });
  }
}

/// @nodoc

class _FhirEvent extends FhirEvent {
  const _FhirEvent(
      {required this.id,
      @FhirEventTypeConverter() required this.eventType,
      this.topic,
      this.subject,
      this.data,
      this.dataVersion,
      this.metadataVersion,
      this.eventTime,
      this.subscriptionId,
      this.subscriptionTimestamp,
      this.subscriptionResourceType,
      this.subscriptionResourceId,
      this.subscriptionResourceVersionId,
      this.payload,
      this.payloadContentType,
      this.criteria})
      : super._();

  @override
  final String id;
  @override
  @FhirEventTypeConverter()
  final FhirEventType eventType;
// CloudEvents (Azure Healthcare APIs) fields
  @override
  final String? topic;
  @override
  final String? subject;
  @override
  final FhirEventData? data;
  @override
  final String? dataVersion;
  @override
  final String? metadataVersion;
  @override
  final String? eventTime;
// Fire Arrow MESSAGE channel subscription fields
  @override
  final String? subscriptionId;
  @override
  final String? subscriptionTimestamp;
  @override
  final String? subscriptionResourceType;
  @override
  final String? subscriptionResourceId;
  @override
  final String? subscriptionResourceVersionId;
  @override
  final String? payload;
  @override
  final String? payloadContentType;
  @override
  final String? criteria;

  /// Create a copy of FhirEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FhirEventCopyWith<_FhirEvent> get copyWith =>
      __$FhirEventCopyWithImpl<_FhirEvent>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FhirEvent &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.eventType, eventType) ||
                other.eventType == eventType) &&
            (identical(other.topic, topic) || other.topic == topic) &&
            (identical(other.subject, subject) || other.subject == subject) &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.dataVersion, dataVersion) ||
                other.dataVersion == dataVersion) &&
            (identical(other.metadataVersion, metadataVersion) ||
                other.metadataVersion == metadataVersion) &&
            (identical(other.eventTime, eventTime) ||
                other.eventTime == eventTime) &&
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

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      eventType,
      topic,
      subject,
      data,
      dataVersion,
      metadataVersion,
      eventTime,
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
    return 'FhirEvent(id: $id, eventType: $eventType, topic: $topic, subject: $subject, data: $data, dataVersion: $dataVersion, metadataVersion: $metadataVersion, eventTime: $eventTime, subscriptionId: $subscriptionId, subscriptionTimestamp: $subscriptionTimestamp, subscriptionResourceType: $subscriptionResourceType, subscriptionResourceId: $subscriptionResourceId, subscriptionResourceVersionId: $subscriptionResourceVersionId, payload: $payload, payloadContentType: $payloadContentType, criteria: $criteria)';
  }
}

/// @nodoc
abstract mixin class _$FhirEventCopyWith<$Res>
    implements $FhirEventCopyWith<$Res> {
  factory _$FhirEventCopyWith(
          _FhirEvent value, $Res Function(_FhirEvent) _then) =
      __$FhirEventCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      @FhirEventTypeConverter() FhirEventType eventType,
      String? topic,
      String? subject,
      FhirEventData? data,
      String? dataVersion,
      String? metadataVersion,
      String? eventTime,
      String? subscriptionId,
      String? subscriptionTimestamp,
      String? subscriptionResourceType,
      String? subscriptionResourceId,
      String? subscriptionResourceVersionId,
      String? payload,
      String? payloadContentType,
      String? criteria});

  @override
  $FhirEventDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$FhirEventCopyWithImpl<$Res> implements _$FhirEventCopyWith<$Res> {
  __$FhirEventCopyWithImpl(this._self, this._then);

  final _FhirEvent _self;
  final $Res Function(_FhirEvent) _then;

  /// Create a copy of FhirEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? eventType = null,
    Object? topic = freezed,
    Object? subject = freezed,
    Object? data = freezed,
    Object? dataVersion = freezed,
    Object? metadataVersion = freezed,
    Object? eventTime = freezed,
    Object? subscriptionId = freezed,
    Object? subscriptionTimestamp = freezed,
    Object? subscriptionResourceType = freezed,
    Object? subscriptionResourceId = freezed,
    Object? subscriptionResourceVersionId = freezed,
    Object? payload = freezed,
    Object? payloadContentType = freezed,
    Object? criteria = freezed,
  }) {
    return _then(_FhirEvent(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      eventType: null == eventType
          ? _self.eventType
          : eventType // ignore: cast_nullable_to_non_nullable
              as FhirEventType,
      topic: freezed == topic
          ? _self.topic
          : topic // ignore: cast_nullable_to_non_nullable
              as String?,
      subject: freezed == subject
          ? _self.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as FhirEventData?,
      dataVersion: freezed == dataVersion
          ? _self.dataVersion
          : dataVersion // ignore: cast_nullable_to_non_nullable
              as String?,
      metadataVersion: freezed == metadataVersion
          ? _self.metadataVersion
          : metadataVersion // ignore: cast_nullable_to_non_nullable
              as String?,
      eventTime: freezed == eventTime
          ? _self.eventTime
          : eventTime // ignore: cast_nullable_to_non_nullable
              as String?,
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

  /// Create a copy of FhirEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FhirEventDataCopyWith<$Res>? get data {
    if (_self.data == null) {
      return null;
    }

    return $FhirEventDataCopyWith<$Res>(_self.data!, (value) {
      return _then(_self.copyWith(data: value));
    });
  }
}

// dart format on
