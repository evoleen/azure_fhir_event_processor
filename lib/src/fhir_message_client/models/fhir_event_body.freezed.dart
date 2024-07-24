// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fhir_event_body.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FhirEventBody _$FhirEventBodyFromJson(Map<String, dynamic> json) {
  return _FhirEventBody.fromJson(json);
}

/// @nodoc
mixin _$FhirEventBody {
  String get resourceFhirId => throw _privateConstructorUsedError;
  String get resourceType => throw _privateConstructorUsedError;
  String get resourceFhirAccount => throw _privateConstructorUsedError;
  int get resourceVersionId => throw _privateConstructorUsedError;

  /// Serializes this FhirEventBody to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FhirEventBody
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FhirEventBodyCopyWith<FhirEventBody> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FhirEventBodyCopyWith<$Res> {
  factory $FhirEventBodyCopyWith(
          FhirEventBody value, $Res Function(FhirEventBody) then) =
      _$FhirEventBodyCopyWithImpl<$Res, FhirEventBody>;
  @useResult
  $Res call(
      {String resourceFhirId,
      String resourceType,
      String resourceFhirAccount,
      int resourceVersionId});
}

/// @nodoc
class _$FhirEventBodyCopyWithImpl<$Res, $Val extends FhirEventBody>
    implements $FhirEventBodyCopyWith<$Res> {
  _$FhirEventBodyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FhirEventBody
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? resourceFhirId = null,
    Object? resourceType = null,
    Object? resourceFhirAccount = null,
    Object? resourceVersionId = null,
  }) {
    return _then(_value.copyWith(
      resourceFhirId: null == resourceFhirId
          ? _value.resourceFhirId
          : resourceFhirId // ignore: cast_nullable_to_non_nullable
              as String,
      resourceType: null == resourceType
          ? _value.resourceType
          : resourceType // ignore: cast_nullable_to_non_nullable
              as String,
      resourceFhirAccount: null == resourceFhirAccount
          ? _value.resourceFhirAccount
          : resourceFhirAccount // ignore: cast_nullable_to_non_nullable
              as String,
      resourceVersionId: null == resourceVersionId
          ? _value.resourceVersionId
          : resourceVersionId // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FhirEventBodyImplCopyWith<$Res>
    implements $FhirEventBodyCopyWith<$Res> {
  factory _$$FhirEventBodyImplCopyWith(
          _$FhirEventBodyImpl value, $Res Function(_$FhirEventBodyImpl) then) =
      __$$FhirEventBodyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String resourceFhirId,
      String resourceType,
      String resourceFhirAccount,
      int resourceVersionId});
}

/// @nodoc
class __$$FhirEventBodyImplCopyWithImpl<$Res>
    extends _$FhirEventBodyCopyWithImpl<$Res, _$FhirEventBodyImpl>
    implements _$$FhirEventBodyImplCopyWith<$Res> {
  __$$FhirEventBodyImplCopyWithImpl(
      _$FhirEventBodyImpl _value, $Res Function(_$FhirEventBodyImpl) _then)
      : super(_value, _then);

  /// Create a copy of FhirEventBody
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? resourceFhirId = null,
    Object? resourceType = null,
    Object? resourceFhirAccount = null,
    Object? resourceVersionId = null,
  }) {
    return _then(_$FhirEventBodyImpl(
      resourceFhirId: null == resourceFhirId
          ? _value.resourceFhirId
          : resourceFhirId // ignore: cast_nullable_to_non_nullable
              as String,
      resourceType: null == resourceType
          ? _value.resourceType
          : resourceType // ignore: cast_nullable_to_non_nullable
              as String,
      resourceFhirAccount: null == resourceFhirAccount
          ? _value.resourceFhirAccount
          : resourceFhirAccount // ignore: cast_nullable_to_non_nullable
              as String,
      resourceVersionId: null == resourceVersionId
          ? _value.resourceVersionId
          : resourceVersionId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FhirEventBodyImpl implements _FhirEventBody {
  const _$FhirEventBodyImpl(
      {required this.resourceFhirId,
      required this.resourceType,
      required this.resourceFhirAccount,
      required this.resourceVersionId});

  factory _$FhirEventBodyImpl.fromJson(Map<String, dynamic> json) =>
      _$$FhirEventBodyImplFromJson(json);

  @override
  final String resourceFhirId;
  @override
  final String resourceType;
  @override
  final String resourceFhirAccount;
  @override
  final int resourceVersionId;

  @override
  String toString() {
    return 'FhirEventBody(resourceFhirId: $resourceFhirId, resourceType: $resourceType, resourceFhirAccount: $resourceFhirAccount, resourceVersionId: $resourceVersionId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FhirEventBodyImpl &&
            (identical(other.resourceFhirId, resourceFhirId) ||
                other.resourceFhirId == resourceFhirId) &&
            (identical(other.resourceType, resourceType) ||
                other.resourceType == resourceType) &&
            (identical(other.resourceFhirAccount, resourceFhirAccount) ||
                other.resourceFhirAccount == resourceFhirAccount) &&
            (identical(other.resourceVersionId, resourceVersionId) ||
                other.resourceVersionId == resourceVersionId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, resourceFhirId, resourceType,
      resourceFhirAccount, resourceVersionId);

  /// Create a copy of FhirEventBody
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FhirEventBodyImplCopyWith<_$FhirEventBodyImpl> get copyWith =>
      __$$FhirEventBodyImplCopyWithImpl<_$FhirEventBodyImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FhirEventBodyImplToJson(
      this,
    );
  }
}

abstract class _FhirEventBody implements FhirEventBody {
  const factory _FhirEventBody(
      {required final String resourceFhirId,
      required final String resourceType,
      required final String resourceFhirAccount,
      required final int resourceVersionId}) = _$FhirEventBodyImpl;

  factory _FhirEventBody.fromJson(Map<String, dynamic> json) =
      _$FhirEventBodyImpl.fromJson;

  @override
  String get resourceFhirId;
  @override
  String get resourceType;
  @override
  String get resourceFhirAccount;
  @override
  int get resourceVersionId;

  /// Create a copy of FhirEventBody
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FhirEventBodyImplCopyWith<_$FhirEventBodyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
