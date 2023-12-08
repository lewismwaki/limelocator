import 'package:lime_locator/features/entity/data/models/entity_model/entity_model.dart';
import 'package:lime_locator/shared/services/services.dart';

class EntityService {
  EntityService({required this.dio});

  final DioService dio;

  Future<List<EntityModel>> getEntities() async {
    final response = await dio.request(
      'https://65702fb109586eff6640dc31.mockapi.io/api/entity',
      RequestType.get,
    );

    final jsonList = response.data as List<dynamic>;

    final entityModels = jsonList
        .map(
          (json) => EntityModel.fromJson(json as Map<String, dynamic>),
        )
        .toList();

    return entityModels;
  }
}
