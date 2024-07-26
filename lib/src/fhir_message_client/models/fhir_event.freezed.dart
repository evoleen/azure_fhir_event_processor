// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fhir_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FhirEvent _$FhirEventFromJson(Map<String, dynamic> json) {
  return _FhirEvent.fromJson(json);
}

/// @nodoc
mixin _$FhirEvent {
  String get id => throw _privateConstructorUsedError;
  String get topic => throw _privateConstructorUsedError;
  String get subject => throw _privateConstructorUsedError;
  FhirEventData get data => throw _privateConstructorUsedError;
  FhirEventType get eventType => throw _privateConstructorUsedError;
  String get dataVersion => throw _privateConstructorUsedError;
  String get metadataVersion => throw _privateConstructorUsedError;
  String get eventTime => throw _privateConstructorUsedError;

  /// Serializes this FhirEvent to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FhirEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FhirEventCopyWith<FhirEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FhirEventCopyWith<$Res> {
  factory $FhirEventCopyWith(FhirEvent value, $Res Function(FhirEvent) then) =
      _$FhirEventCopyWithImpl<$Res, FhirEvent>;
  @useResult
  $Res call(
      {String id,
      String topic,
      String subject,
      FhirEventData data,
      FhirEventType eventType,
      String dataVersion,
      String metadataVersion,
      String eventTime});

  $FhirEventDataCopyWith<$Res> get data;
}

/// @nodoc
class _$FhirEventCopyWithImpl<$Res, $Val extends FhirEvent>
    implements $FhirEventCopyWith<$Res> {
  _$FhirEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FhirEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? topic = null,
    Object? subject = null,
    Object? data = null,
    Object? eventType = null,
    Object? dataVersion = null,
    Object? metadataVersion = null,
    Object? eventTime = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      topic: null == topic
          ? _value.topic
          : topic // ignore: cast_nullable_to_non_nullable
              as String,
      subject: null == subject
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as FhirEventData,
      eventType: null == eventType
          ? _value.eventType
          : eventType // ignore: cast_nullable_to_non_nullable
              as FhirEventType,
      dataVersion: null == dataVersion
          ? _value.dataVersion
          : dataVersion // ignore: cast_nullable_to_non_nullable
              as String,
      metadataVersion: null == metadataVersion
          ? _value.metadataVersion
          : metadataVersion // ignore: cast_nullable_to_non_nullable
              as String,
      eventTime: null == eventTime
          ? _value.eventTime
          : eventTime // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  /// Create a copy of FhirEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FhirEventDataCopyWith<$Res> get data {
    return $FhirEventDataCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FhirEventImplCopyWith<$Res>
    implements $FhirEventCopyWith<$Res> {
  factory _$$FhirEventImplCopyWith(
          _$FhirEventImpl value, $Res Function(_$FhirEventImpl) then) =
      __$$FhirEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String topic,
      String subject,
      FhirEventData data,
      FhirEventType eventType,
      String dataVersion,
      String metadataVersion,
      String eventTime});

  @override
  $FhirEventDataCopyWith<$Res> get data;
}

/// @nodoc
class __$$FhirEventImplCopyWithImpl<$Res>
    extends _$FhirEventCopyWithImpl<$Res, _$FhirEventImpl>
    implements _$$FhirEventImplCopyWith<$Res> {
  __$$FhirEventImplCopyWithImpl(
      _$FhirEventImpl _value, $Res Function(_$FhirEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of FhirEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? topic = null,
    Object? subject = null,
    Object? data = null,
    Object? eventType = null,
    Object? dataVersion = null,
    Object? metadataVersion = null,
    Object? eventTime = null,
  }) {
    return _then(_$FhirEventImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      topic: null == topic
          ? _value.topic
          : topic // ignore: cast_nullable_to_non_nullable
              as String,
      subject: null == subject
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as FhirEventData,
      eventType: null == eventType
          ? _value.eventType
          : eventType // ignore: cast_nullable_to_non_nullable
              as FhirEventType,
      dataVersion: null == dataVersion
          ? _value.dataVersion
          : dataVersion // ignore: cast_nullable_to_non_nullable
              as String,
      metadataVersion: null == metadataVersion
          ? _value.metadataVersion
          : metadataVersion // ignore: cast_nullable_to_non_nullable
              as String,
      eventTime: null == eventTime
          ? _value.eventTime
          : eventTime // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FhirEventImpl implements _FhirEvent {
  const _$FhirEventImpl(
      {required this.id,
      required this.topic,
      required this.subject,
      required this.data,
      required this.eventType,
      required this.dataVersion,
      required this.metadataVersion,
      required this.eventTime});

  factory _$FhirEventImpl.fromJson(Map<String, dynamic> json) =>
      _$$FhirEventImplFromJson(json);

  @override
  final String id;
  @override
  final String topic;
  @override
  final String subject;
  @override
  final FhirEventData data;
  @override
  final FhirEventType eventType;
  @override
  final String dataVersion;
  @override
  final String metadataVersion;
  @override
  final String eventTime;

  @override
  String toString() {
    return 'FhirEvent(id: $id, topic: $topic, subject: $subject, data: $data, eventType: $eventType, dataVersion: $dataVersion, metadataVersion: $metadataVersion, eventTime: $eventTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FhirEventImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.topic, topic) || other.topic == topic) &&
            (identical(other.subject, subject) || other.subject == subject) &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.eventType, eventType) ||
                other.eventType == eventType) &&
            (identical(other.dataVersion, dataVersion) ||
                other.dataVersion == dataVersion) &&
            (identical(other.metadataVersion, metadataVersion) ||
                other.metadataVersion == metadataVersion) &&
            (identical(other.eventTime, eventTime) ||
                other.eventTime == eventTime));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, topic, subject, data,
      eventType, dataVersion, metadataVersion, eventTime);

  /// Create a copy of FhirEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FhirEventImplCopyWith<_$FhirEventImpl> get copyWith =>
      __$$FhirEventImplCopyWithImpl<_$FhirEventImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FhirEventImplToJson(
      this,
    );
  }
}

abstract class _FhirEvent implements FhirEvent {
  const factory _FhirEvent(
      {required final String id,
      required final String topic,
      required final String subject,
      required final FhirEventData data,
      required final FhirEventType eventType,
      required final String dataVersion,
      required final String metadataVersion,
      required final String eventTime}) = _$FhirEventImpl;

  factory _FhirEvent.fromJson(Map<String, dynamic> json) =
      _$FhirEventImpl.fromJson;

  @override
  String get id;
  @override
  String get topic;
  @override
  String get subject;
  @override
  FhirEventData get data;
  @override
  FhirEventType get eventType;
  @override
  String get dataVersion;
  @override
  String get metadataVersion;
  @override
  String get eventTime;

  /// Create a copy of FhirEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FhirEventImplCopyWith<_$FhirEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
