// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'entity_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

EntityModel _$EntityModelFromJson(Map<String, dynamic> json) {
  return _EntityModel.fromJson(json);
}

/// @nodoc
mixin _$EntityModel {
  String? get entityType => throw _privateConstructorUsedError;
  String? get entityName => throw _privateConstructorUsedError;
  String? get entityAvatar => throw _privateConstructorUsedError;
  LocationModel? get currentLocation => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  String? get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EntityModelCopyWith<EntityModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EntityModelCopyWith<$Res> {
  factory $EntityModelCopyWith(
          EntityModel value, $Res Function(EntityModel) then) =
      _$EntityModelCopyWithImpl<$Res, EntityModel>;
  @useResult
  $Res call(
      {String? entityType,
      String? entityName,
      String? entityAvatar,
      LocationModel? currentLocation,
      DateTime? createdAt,
      String? id});

  $LocationModelCopyWith<$Res>? get currentLocation;
}

/// @nodoc
class _$EntityModelCopyWithImpl<$Res, $Val extends EntityModel>
    implements $EntityModelCopyWith<$Res> {
  _$EntityModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? entityType = freezed,
    Object? entityName = freezed,
    Object? entityAvatar = freezed,
    Object? currentLocation = freezed,
    Object? createdAt = freezed,
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      entityType: freezed == entityType
          ? _value.entityType
          : entityType // ignore: cast_nullable_to_non_nullable
              as String?,
      entityName: freezed == entityName
          ? _value.entityName
          : entityName // ignore: cast_nullable_to_non_nullable
              as String?,
      entityAvatar: freezed == entityAvatar
          ? _value.entityAvatar
          : entityAvatar // ignore: cast_nullable_to_non_nullable
              as String?,
      currentLocation: freezed == currentLocation
          ? _value.currentLocation
          : currentLocation // ignore: cast_nullable_to_non_nullable
              as LocationModel?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $LocationModelCopyWith<$Res>? get currentLocation {
    if (_value.currentLocation == null) {
      return null;
    }

    return $LocationModelCopyWith<$Res>(_value.currentLocation!, (value) {
      return _then(_value.copyWith(currentLocation: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$EntityModelImplCopyWith<$Res>
    implements $EntityModelCopyWith<$Res> {
  factory _$$EntityModelImplCopyWith(
          _$EntityModelImpl value, $Res Function(_$EntityModelImpl) then) =
      __$$EntityModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? entityType,
      String? entityName,
      String? entityAvatar,
      LocationModel? currentLocation,
      DateTime? createdAt,
      String? id});

  @override
  $LocationModelCopyWith<$Res>? get currentLocation;
}

/// @nodoc
class __$$EntityModelImplCopyWithImpl<$Res>
    extends _$EntityModelCopyWithImpl<$Res, _$EntityModelImpl>
    implements _$$EntityModelImplCopyWith<$Res> {
  __$$EntityModelImplCopyWithImpl(
      _$EntityModelImpl _value, $Res Function(_$EntityModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? entityType = freezed,
    Object? entityName = freezed,
    Object? entityAvatar = freezed,
    Object? currentLocation = freezed,
    Object? createdAt = freezed,
    Object? id = freezed,
  }) {
    return _then(_$EntityModelImpl(
      entityType: freezed == entityType
          ? _value.entityType
          : entityType // ignore: cast_nullable_to_non_nullable
              as String?,
      entityName: freezed == entityName
          ? _value.entityName
          : entityName // ignore: cast_nullable_to_non_nullable
              as String?,
      entityAvatar: freezed == entityAvatar
          ? _value.entityAvatar
          : entityAvatar // ignore: cast_nullable_to_non_nullable
              as String?,
      currentLocation: freezed == currentLocation
          ? _value.currentLocation
          : currentLocation // ignore: cast_nullable_to_non_nullable
              as LocationModel?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EntityModelImpl implements _EntityModel {
  _$EntityModelImpl(
      {this.entityType,
      this.entityName,
      this.entityAvatar,
      this.currentLocation,
      this.createdAt,
      this.id});

  factory _$EntityModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$EntityModelImplFromJson(json);

  @override
  final String? entityType;
  @override
  final String? entityName;
  @override
  final String? entityAvatar;
  @override
  final LocationModel? currentLocation;
  @override
  final DateTime? createdAt;
  @override
  final String? id;

  @override
  String toString() {
    return 'EntityModel(entityType: $entityType, entityName: $entityName, entityAvatar: $entityAvatar, currentLocation: $currentLocation, createdAt: $createdAt, id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EntityModelImpl &&
            (identical(other.entityType, entityType) ||
                other.entityType == entityType) &&
            (identical(other.entityName, entityName) ||
                other.entityName == entityName) &&
            (identical(other.entityAvatar, entityAvatar) ||
                other.entityAvatar == entityAvatar) &&
            (identical(other.currentLocation, currentLocation) ||
                other.currentLocation == currentLocation) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, entityType, entityName,
      entityAvatar, currentLocation, createdAt, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EntityModelImplCopyWith<_$EntityModelImpl> get copyWith =>
      __$$EntityModelImplCopyWithImpl<_$EntityModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EntityModelImplToJson(
      this,
    );
  }
}

abstract class _EntityModel implements EntityModel {
  factory _EntityModel(
      {final String? entityType,
      final String? entityName,
      final String? entityAvatar,
      final LocationModel? currentLocation,
      final DateTime? createdAt,
      final String? id}) = _$EntityModelImpl;

  factory _EntityModel.fromJson(Map<String, dynamic> json) =
      _$EntityModelImpl.fromJson;

  @override
  String? get entityType;
  @override
  String? get entityName;
  @override
  String? get entityAvatar;
  @override
  LocationModel? get currentLocation;
  @override
  DateTime? get createdAt;
  @override
  String? get id;
  @override
  @JsonKey(ignore: true)
  _$$EntityModelImplCopyWith<_$EntityModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
