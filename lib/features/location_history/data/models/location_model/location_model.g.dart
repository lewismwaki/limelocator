// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LocationModelImpl _$$LocationModelImplFromJson(Map<String, dynamic> json) =>
    _$LocationModelImpl(
      lastUpdated: json['lastUpdated'] == null
          ? null
          : DateTime.parse(json['lastUpdated'] as String),
      latitude: json['latitude'] as String?,
      longitude: json['longitude'] as String?,
      placeId: json['placeId'] as String?,
      address: json['address'] as String?,
      id: json['id'] as String?,
      entityId: json['entityId'] as String?,
    );

Map<String, dynamic> _$$LocationModelImplToJson(_$LocationModelImpl instance) =>
    <String, dynamic>{
      'lastUpdated': instance.lastUpdated?.toIso8601String(),
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'placeId': instance.placeId,
      'address': instance.address,
      'id': instance.id,
      'entityId': instance.entityId,
    };
