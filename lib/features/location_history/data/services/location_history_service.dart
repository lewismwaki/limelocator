import 'package:lime_locator/features/location_history/data/models/location_model/location_model.dart';
import 'package:lime_locator/shared/services/services.dart';

class LocationHistoryService {
  LocationHistoryService({required this.dio});

  final DioService dio;

  Future<List<LocationModel>> getLocationHistory({
    required int entityId,
  }) async {
    final response = await dio.request(
      'https://65702fb109586eff6640dc31.mockapi.io/api/entity/$entityId/previousLocations',
      RequestType.get,
    );

    final jsonList = response.data as List<dynamic>;

    final locationHistoryModels = jsonList
        .map(
          (json) => LocationModel.fromJson(json as Map<String, dynamic>),
        )
        .toList();

    return locationHistoryModels;
  }
}
