import 'package:bloc/bloc.dart';
import 'package:lime_locator/features/location_history/location_history.dart';

class FetchLocationHistoryCubit extends Cubit<FetchLocationHistoryState> {
  FetchLocationHistoryCubit({
    required this.locationHistoryService,
  }) : super(const FetchLocationHistoryState.initial());

  final LocationHistoryService locationHistoryService;

  Future<void> fetchLocationHistory({required int entityId}) async {
    emit(const FetchLocationHistoryState.loading());
    emit(
      await FetchLocationHistoryState.guard(
        () => locationHistoryService.getLocationHistory(entityId: entityId),
      ),
    );
  }
}
