import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lime_locator/features/location_history/data/models/location_model/location_model.dart';

part 'entity_model.freezed.dart';
part 'entity_model.g.dart';

@freezed
class EntityModel with _$EntityModel {
  factory EntityModel({
    String? entityType,
    String? entityName,
    String? entityAvatar,
    LocationModel? currentLocation,
    DateTime? createdAt,
    String? id,
  }) = _EntityModel;

  factory EntityModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$EntityModelFromJson(json);
}
