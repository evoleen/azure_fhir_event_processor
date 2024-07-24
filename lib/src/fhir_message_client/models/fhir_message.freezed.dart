// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fhir_message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FhirMessage _$FhirMessageFromJson(Map<String, dynamic> json) {
  return _FhirMessage.fromJson(json);
}

/// @nodoc
mixin _$FhirMessage {
  String get id => throw _privateConstructorUsedError;
  String get insertionTime => throw _privateConstructorUsedError;
  String get expirationTime => throw _privateConstructorUsedError;
  int get dequeueCount => throw _privateConstructorUsedError;
  String get popReceipt => throw _privateConstructorUsedError;
  FhirEvent get fhirEvent => throw _privateConstructorUsedError;

  /// Serializes this FhirMessage to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FhirMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FhirMessageCopyWith<FhirMessage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FhirMessageCopyWith<$Res> {
  factory $FhirMessageCopyWith(
          FhirMessage value, $Res Function(FhirMessage) then) =
      _$FhirMessageCopyWithImpl<$Res, FhirMessage>;
  @useResult
  $Res call(
      {String id,
      String insertionTime,
      String expirationTime,
      int dequeueCount,
      String popReceipt,
      FhirEvent fhirEvent});

  $FhirEventCopyWith<$Res> get fhirEvent;
}

/// @nodoc
class _$FhirMessageCopyWithImpl<$Res, $Val extends FhirMessage>
    implements $FhirMessageCopyWith<$Res> {
  _$FhirMessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FhirMessage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? insertionTime = null,
    Object? expirationTime = null,
    Object? dequeueCount = null,
    Object? popReceipt = null,
    Object? fhirEvent = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      insertionTime: null == insertionTime
          ? _value.insertionTime
          : insertionTime // ignore: cast_nullable_to_non_nullable
              as String,
      expirationTime: null == expirationTime
          ? _value.expirationTime
          : expirationTime // ignore: cast_nullable_to_non_nullable
              as String,
      dequeueCount: null == dequeueCount
          ? _value.dequeueCount
          : dequeueCount // ignore: cast_nullable_to_non_nullable
              as int,
      popReceipt: null == popReceipt
          ? _value.popReceipt
          : popReceipt // ignore: cast_nullable_to_non_nullable
              as String,
      fhirEvent: null == fhirEvent
          ? _value.fhirEvent
          : fhirEvent // ignore: cast_nullable_to_non_nullable
              as FhirEvent,
    ) as $Val);
  }

  /// Create a copy of FhirMessage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FhirEventCopyWith<$Res> get fhirEvent {
    return $FhirEventCopyWith<$Res>(_value.fhirEvent, (value) {
      return _then(_value.copyWith(fhirEvent: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FhirMessageImplCopyWith<$Res>
    implements $FhirMessageCopyWith<$Res> {
  factory _$$FhirMessageImplCopyWith(
          _$FhirMessageImpl value, $Res Function(_$FhirMessageImpl) then) =
      __$$FhirMessageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String insertionTime,
      String expirationTime,
      int dequeueCount,
      String popReceipt,
      FhirEvent fhirEvent});

  @override
  $FhirEventCopyWith<$Res> get fhirEvent;
}

/// @nodoc
class __$$FhirMessageImplCopyWithImpl<$Res>
    extends _$FhirMessageCopyWithImpl<$Res, _$FhirMessageImpl>
    implements _$$FhirMessageImplCopyWith<$Res> {
  __$$FhirMessageImplCopyWithImpl(
      _$FhirMessageImpl _value, $Res Function(_$FhirMessageImpl) _then)
      : super(_value, _then);

  /// Create a copy of FhirMessage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? insertionTime = null,
    Object? expirationTime = null,
    Object? dequeueCount = null,
    Object? popReceipt = null,
    Object? fhirEvent = null,
  }) {
    return _then(_$FhirMessageImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      insertionTime: null == insertionTime
          ? _value.insertionTime
          : insertionTime // ignore: cast_nullable_to_non_nullable
              as String,
      expirationTime: null == expirationTime
          ? _value.expirationTime
          : expirationTime // ignore: cast_nullable_to_non_nullable
              as String,
      dequeueCount: null == dequeueCount
          ? _value.dequeueCount
          : dequeueCount // ignore: cast_nullable_to_non_nullable
              as int,
      popReceipt: null == popReceipt
          ? _value.popReceipt
          : popReceipt // ignore: cast_nullable_to_non_nullable
              as String,
      fhirEvent: null == fhirEvent
          ? _value.fhirEvent
          : fhirEvent // ignore: cast_nullable_to_non_nullable
              as FhirEvent,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FhirMessageImpl implements _FhirMessage {
  const _$FhirMessageImpl(
      {required this.id,
      required this.insertionTime,
      required this.expirationTime,
      required this.dequeueCount,
      required this.popReceipt,
      required this.fhirEvent});

  factory _$FhirMessageImpl.fromJson(Map<String, dynamic> json) =>
      _$$FhirMessageImplFromJson(json);

  @override
  final String id;
  @override
  final String insertionTime;
  @override
  final String expirationTime;
  @override
  final int dequeueCount;
  @override
  final String popReceipt;
  @override
  final FhirEvent fhirEvent;

  @override
  String toString() {
    return 'FhirMessage(id: $id, insertionTime: $insertionTime, expirationTime: $expirationTime, dequeueCount: $dequeueCount, popReceipt: $popReceipt, fhirEvent: $fhirEvent)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FhirMessageImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.insertionTime, insertionTime) ||
                other.insertionTime == insertionTime) &&
            (identical(other.expirationTime, expirationTime) ||
                other.expirationTime == expirationTime) &&
            (identical(other.dequeueCount, dequeueCount) ||
                other.dequeueCount == dequeueCount) &&
            (identical(other.popReceipt, popReceipt) ||
                other.popReceipt == popReceipt) &&
            (identical(other.fhirEvent, fhirEvent) ||
                other.fhirEvent == fhirEvent));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, insertionTime,
      expirationTime, dequeueCount, popReceipt, fhirEvent);

  /// Create a copy of FhirMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FhirMessageImplCopyWith<_$FhirMessageImpl> get copyWith =>
      __$$FhirMessageImplCopyWithImpl<_$FhirMessageImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FhirMessageImplToJson(
      this,
    );
  }
}

abstract class _FhirMessage implements FhirMessage {
  const factory _FhirMessage(
      {required final String id,
      required final String insertionTime,
      required final String expirationTime,
      required final int dequeueCount,
      required final String popReceipt,
      required final FhirEvent fhirEvent}) = _$FhirMessageImpl;

  factory _FhirMessage.fromJson(Map<String, dynamic> json) =
      _$FhirMessageImpl.fromJson;

  @override
  String get id;
  @override
  String get insertionTime;
  @override
  String get expirationTime;
  @override
  int get dequeueCount;
  @override
  String get popReceipt;
  @override
  FhirEvent get fhirEvent;

  /// Create a copy of FhirMessage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FhirMessageImplCopyWith<_$FhirMessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
