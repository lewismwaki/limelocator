// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entity_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EntityModelImpl _$$EntityModelImplFromJson(Map<String, dynamic> json) =>
    _$EntityModelImpl(
      entityType: json['entityType'] as String?,
      entityName: json['entityName'] as String?,
      entityAvatar: json['entityAvatar'] as String?,
      currentLocation: json['currentLocation'] == null
          ? null
          : LocationModel.fromJson(
              json['currentLocation'] as Map<String, dynamic>,
            ),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      id: json['id'] as String?,
    );

Map<String, dynamic> _$$EntityModelImplToJson(_$EntityModelImpl instance) =>
    <String, dynamic>{
      'entityType': instance.entityType,
      'entityName': instance.entityName,
      'entityAvatar': instance.entityAvatar,
      'currentLocation': instance.currentLocation,
      'createdAt': instance.createdAt?.toIso8601String(),
      'id': instance.id,
    };
