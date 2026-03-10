// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fhir_message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FhirMessage {
  String get id;
  String get insertionTime;
  String get expirationTime;
  int get dequeueCount;
  String get popReceipt;
  @JsonKey(fromJson: _fhirEventFromJson, toJson: _fhirEventToJson)
  FhirEvent get fhirEvent;

  /// Create a copy of FhirMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FhirMessageCopyWith<FhirMessage> get copyWith =>
      _$FhirMessageCopyWithImpl<FhirMessage>(this as FhirMessage, _$identity);

  /// Serializes this FhirMessage to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FhirMessage &&
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

  @override
  String toString() {
    return 'FhirMessage(id: $id, insertionTime: $insertionTime, expirationTime: $expirationTime, dequeueCount: $dequeueCount, popReceipt: $popReceipt, fhirEvent: $fhirEvent)';
  }
}

/// @nodoc
abstract mixin class $FhirMessageCopyWith<$Res> {
  factory $FhirMessageCopyWith(
          FhirMessage value, $Res Function(FhirMessage) _then) =
      _$FhirMessageCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String insertionTime,
      String expirationTime,
      int dequeueCount,
      String popReceipt,
      @JsonKey(fromJson: _fhirEventFromJson, toJson: _fhirEventToJson)
      FhirEvent fhirEvent});
}

/// @nodoc
class _$FhirMessageCopyWithImpl<$Res> implements $FhirMessageCopyWith<$Res> {
  _$FhirMessageCopyWithImpl(this._self, this._then);

  final FhirMessage _self;
  final $Res Function(FhirMessage) _then;

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
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      insertionTime: null == insertionTime
          ? _self.insertionTime
          : insertionTime // ignore: cast_nullable_to_non_nullable
              as String,
      expirationTime: null == expirationTime
          ? _self.expirationTime
          : expirationTime // ignore: cast_nullable_to_non_nullable
              as String,
      dequeueCount: null == dequeueCount
          ? _self.dequeueCount
          : dequeueCount // ignore: cast_nullable_to_non_nullable
              as int,
      popReceipt: null == popReceipt
          ? _self.popReceipt
          : popReceipt // ignore: cast_nullable_to_non_nullable
              as String,
      fhirEvent: null == fhirEvent
          ? _self.fhirEvent
          : fhirEvent // ignore: cast_nullable_to_non_nullable
              as FhirEvent,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _FhirMessage implements FhirMessage {
  const _FhirMessage(
      {required this.id,
      required this.insertionTime,
      required this.expirationTime,
      required this.dequeueCount,
      required this.popReceipt,
      @JsonKey(fromJson: _fhirEventFromJson, toJson: _fhirEventToJson)
      required this.fhirEvent});
  factory _FhirMessage.fromJson(Map<String, dynamic> json) =>
      _$FhirMessageFromJson(json);

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
  @JsonKey(fromJson: _fhirEventFromJson, toJson: _fhirEventToJson)
  final FhirEvent fhirEvent;

  /// Create a copy of FhirMessage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FhirMessageCopyWith<_FhirMessage> get copyWith =>
      __$FhirMessageCopyWithImpl<_FhirMessage>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$FhirMessageToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FhirMessage &&
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

  @override
  String toString() {
    return 'FhirMessage(id: $id, insertionTime: $insertionTime, expirationTime: $expirationTime, dequeueCount: $dequeueCount, popReceipt: $popReceipt, fhirEvent: $fhirEvent)';
  }
}

/// @nodoc
abstract mixin class _$FhirMessageCopyWith<$Res>
    implements $FhirMessageCopyWith<$Res> {
  factory _$FhirMessageCopyWith(
          _FhirMessage value, $Res Function(_FhirMessage) _then) =
      __$FhirMessageCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String insertionTime,
      String expirationTime,
      int dequeueCount,
      String popReceipt,
      @JsonKey(fromJson: _fhirEventFromJson, toJson: _fhirEventToJson)
      FhirEvent fhirEvent});
}

/// @nodoc
class __$FhirMessageCopyWithImpl<$Res> implements _$FhirMessageCopyWith<$Res> {
  __$FhirMessageCopyWithImpl(this._self, this._then);

  final _FhirMessage _self;
  final $Res Function(_FhirMessage) _then;

  /// Create a copy of FhirMessage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? insertionTime = null,
    Object? expirationTime = null,
    Object? dequeueCount = null,
    Object? popReceipt = null,
    Object? fhirEvent = null,
  }) {
    return _then(_FhirMessage(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      insertionTime: null == insertionTime
          ? _self.insertionTime
          : insertionTime // ignore: cast_nullable_to_non_nullable
              as String,
      expirationTime: null == expirationTime
          ? _self.expirationTime
          : expirationTime // ignore: cast_nullable_to_non_nullable
              as String,
      dequeueCount: null == dequeueCount
          ? _self.dequeueCount
          : dequeueCount // ignore: cast_nullable_to_non_nullable
              as int,
      popReceipt: null == popReceipt
          ? _self.popReceipt
          : popReceipt // ignore: cast_nullable_to_non_nullable
              as String,
      fhirEvent: null == fhirEvent
          ? _self.fhirEvent
          : fhirEvent // ignore: cast_nullable_to_non_nullable
              as FhirEvent,
    ));
  }
}

// dart format on
