// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ahds_fhir_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AhdsFhirEvent {
  String get id;
  @FhirEventTypeConverter()
  FhirEventType get eventType;
  String? get topic;
  String? get subject;
  AhdsEventData? get data;
  String? get dataVersion;
  String? get metadataVersion;
  String? get eventTime;

  /// Create a copy of AhdsFhirEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AhdsFhirEventCopyWith<AhdsFhirEvent> get copyWith =>
      _$AhdsFhirEventCopyWithImpl<AhdsFhirEvent>(
          this as AhdsFhirEvent, _$identity);

  /// Serializes this AhdsFhirEvent to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AhdsFhirEvent &&
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
                other.eventTime == eventTime));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, eventType, topic, subject,
      data, dataVersion, metadataVersion, eventTime);

  @override
  String toString() {
    return 'AhdsFhirEvent(id: $id, eventType: $eventType, topic: $topic, subject: $subject, data: $data, dataVersion: $dataVersion, metadataVersion: $metadataVersion, eventTime: $eventTime)';
  }
}

/// @nodoc
abstract mixin class $AhdsFhirEventCopyWith<$Res> {
  factory $AhdsFhirEventCopyWith(
          AhdsFhirEvent value, $Res Function(AhdsFhirEvent) _then) =
      _$AhdsFhirEventCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      @FhirEventTypeConverter() FhirEventType eventType,
      String? topic,
      String? subject,
      AhdsEventData? data,
      String? dataVersion,
      String? metadataVersion,
      String? eventTime});

  $AhdsEventDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$AhdsFhirEventCopyWithImpl<$Res>
    implements $AhdsFhirEventCopyWith<$Res> {
  _$AhdsFhirEventCopyWithImpl(this._self, this._then);

  final AhdsFhirEvent _self;
  final $Res Function(AhdsFhirEvent) _then;

  /// Create a copy of AhdsFhirEvent
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
              as AhdsEventData?,
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
    ));
  }

  /// Create a copy of AhdsFhirEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AhdsEventDataCopyWith<$Res>? get data {
    if (_self.data == null) {
      return null;
    }

    return $AhdsEventDataCopyWith<$Res>(_self.data!, (value) {
      return _then(_self.copyWith(data: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _AhdsFhirEvent extends AhdsFhirEvent {
  const _AhdsFhirEvent(
      {required this.id,
      @FhirEventTypeConverter() required this.eventType,
      this.topic,
      this.subject,
      this.data,
      this.dataVersion,
      this.metadataVersion,
      this.eventTime})
      : super._();
  factory _AhdsFhirEvent.fromJson(Map<String, dynamic> json) =>
      _$AhdsFhirEventFromJson(json);

  @override
  final String id;
  @override
  @FhirEventTypeConverter()
  final FhirEventType eventType;
  @override
  final String? topic;
  @override
  final String? subject;
  @override
  final AhdsEventData? data;
  @override
  final String? dataVersion;
  @override
  final String? metadataVersion;
  @override
  final String? eventTime;

  /// Create a copy of AhdsFhirEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AhdsFhirEventCopyWith<_AhdsFhirEvent> get copyWith =>
      __$AhdsFhirEventCopyWithImpl<_AhdsFhirEvent>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AhdsFhirEventToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AhdsFhirEvent &&
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
                other.eventTime == eventTime));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, eventType, topic, subject,
      data, dataVersion, metadataVersion, eventTime);

  @override
  String toString() {
    return 'AhdsFhirEvent(id: $id, eventType: $eventType, topic: $topic, subject: $subject, data: $data, dataVersion: $dataVersion, metadataVersion: $metadataVersion, eventTime: $eventTime)';
  }
}

/// @nodoc
abstract mixin class _$AhdsFhirEventCopyWith<$Res>
    implements $AhdsFhirEventCopyWith<$Res> {
  factory _$AhdsFhirEventCopyWith(
          _AhdsFhirEvent value, $Res Function(_AhdsFhirEvent) _then) =
      __$AhdsFhirEventCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      @FhirEventTypeConverter() FhirEventType eventType,
      String? topic,
      String? subject,
      AhdsEventData? data,
      String? dataVersion,
      String? metadataVersion,
      String? eventTime});

  @override
  $AhdsEventDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$AhdsFhirEventCopyWithImpl<$Res>
    implements _$AhdsFhirEventCopyWith<$Res> {
  __$AhdsFhirEventCopyWithImpl(this._self, this._then);

  final _AhdsFhirEvent _self;
  final $Res Function(_AhdsFhirEvent) _then;

  /// Create a copy of AhdsFhirEvent
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
  }) {
    return _then(_AhdsFhirEvent(
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
              as AhdsEventData?,
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
    ));
  }

  /// Create a copy of AhdsFhirEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AhdsEventDataCopyWith<$Res>? get data {
    if (_self.data == null) {
      return null;
    }

    return $AhdsEventDataCopyWith<$Res>(_self.data!, (value) {
      return _then(_self.copyWith(data: value));
    });
  }
}

// dart format on
