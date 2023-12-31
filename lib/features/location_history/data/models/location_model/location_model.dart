import 'package:freezed_annotation/freezed_annotation.dart';

part 'location_model.freezed.dart';
part 'location_model.g.dart';

@freezed
class LocationModel with _$LocationModel {
  factory LocationModel({
    DateTime? lastUpdated,
    String? latitude,
    String? longitude,
    String? placeId,
    String? address,
    String? id,
    String? entityId,
  }) = _LocationModel;

  factory LocationModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$LocationModelFromJson(json);
}
