// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ahds_event_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AhdsEventData {
  String get resourceFhirId;
  String get resourceType;
  String get resourceFhirAccount;
  int get resourceVersionId;

  /// Create a copy of AhdsEventData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AhdsEventDataCopyWith<AhdsEventData> get copyWith =>
      _$AhdsEventDataCopyWithImpl<AhdsEventData>(
          this as AhdsEventData, _$identity);

  /// Serializes this AhdsEventData to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AhdsEventData &&
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

  @override
  String toString() {
    return 'AhdsEventData(resourceFhirId: $resourceFhirId, resourceType: $resourceType, resourceFhirAccount: $resourceFhirAccount, resourceVersionId: $resourceVersionId)';
  }
}

/// @nodoc
abstract mixin class $AhdsEventDataCopyWith<$Res> {
  factory $AhdsEventDataCopyWith(
          AhdsEventData value, $Res Function(AhdsEventData) _then) =
      _$AhdsEventDataCopyWithImpl;
  @useResult
  $Res call(
      {String resourceFhirId,
      String resourceType,
      String resourceFhirAccount,
      int resourceVersionId});
}

/// @nodoc
class _$AhdsEventDataCopyWithImpl<$Res>
    implements $AhdsEventDataCopyWith<$Res> {
  _$AhdsEventDataCopyWithImpl(this._self, this._then);

  final AhdsEventData _self;
  final $Res Function(AhdsEventData) _then;

  /// Create a copy of AhdsEventData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? resourceFhirId = null,
    Object? resourceType = null,
    Object? resourceFhirAccount = null,
    Object? resourceVersionId = null,
  }) {
    return _then(_self.copyWith(
      resourceFhirId: null == resourceFhirId
          ? _self.resourceFhirId
          : resourceFhirId // ignore: cast_nullable_to_non_nullable
              as String,
      resourceType: null == resourceType
          ? _self.resourceType
          : resourceType // ignore: cast_nullable_to_non_nullable
              as String,
      resourceFhirAccount: null == resourceFhirAccount
          ? _self.resourceFhirAccount
          : resourceFhirAccount // ignore: cast_nullable_to_non_nullable
              as String,
      resourceVersionId: null == resourceVersionId
          ? _self.resourceVersionId
          : resourceVersionId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _AhdsEventData implements AhdsEventData {
  const _AhdsEventData(
      {required this.resourceFhirId,
      required this.resourceType,
      required this.resourceFhirAccount,
      required this.resourceVersionId});
  factory _AhdsEventData.fromJson(Map<String, dynamic> json) =>
      _$AhdsEventDataFromJson(json);

  @override
  final String resourceFhirId;
  @override
  final String resourceType;
  @override
  final String resourceFhirAccount;
  @override
  final int resourceVersionId;

  /// Create a copy of AhdsEventData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AhdsEventDataCopyWith<_AhdsEventData> get copyWith =>
      __$AhdsEventDataCopyWithImpl<_AhdsEventData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AhdsEventDataToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AhdsEventData &&
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

  @override
  String toString() {
    return 'AhdsEventData(resourceFhirId: $resourceFhirId, resourceType: $resourceType, resourceFhirAccount: $resourceFhirAccount, resourceVersionId: $resourceVersionId)';
  }
}

/// @nodoc
abstract mixin class _$AhdsEventDataCopyWith<$Res>
    implements $AhdsEventDataCopyWith<$Res> {
  factory _$AhdsEventDataCopyWith(
          _AhdsEventData value, $Res Function(_AhdsEventData) _then) =
      __$AhdsEventDataCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String resourceFhirId,
      String resourceType,
      String resourceFhirAccount,
      int resourceVersionId});
}

/// @nodoc
class __$AhdsEventDataCopyWithImpl<$Res>
    implements _$AhdsEventDataCopyWith<$Res> {
  __$AhdsEventDataCopyWithImpl(this._self, this._then);

  final _AhdsEventData _self;
  final $Res Function(_AhdsEventData) _then;

  /// Create a copy of AhdsEventData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? resourceFhirId = null,
    Object? resourceType = null,
    Object? resourceFhirAccount = null,
    Object? resourceVersionId = null,
  }) {
    return _then(_AhdsEventData(
      resourceFhirId: null == resourceFhirId
          ? _self.resourceFhirId
          : resourceFhirId // ignore: cast_nullable_to_non_nullable
              as String,
      resourceType: null == resourceType
          ? _self.resourceType
          : resourceType // ignore: cast_nullable_to_non_nullable
              as String,
      resourceFhirAccount: null == resourceFhirAccount
          ? _self.resourceFhirAccount
          : resourceFhirAccount // ignore: cast_nullable_to_non_nullable
              as String,
      resourceVersionId: null == resourceVersionId
          ? _self.resourceVersionId
          : resourceVersionId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
