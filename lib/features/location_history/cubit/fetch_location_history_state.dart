import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lime_locator/features/location_history/data/models/location_model/location_model.dart';

part 'fetch_location_history_state.freezed.dart';

extension FetchLocationHistoryGetters on FetchLocationHistoryState {
  bool get isInitial => this is _$FetchLocationHistoryStateInitial;
  bool get isLoading => this is _$FetchLocationHistoryStateLoading;
  bool get hasData => this is _$FetchLocationHistoryStateData;
  bool get hasError => this is _$FetchLocationHistoryStateError;
}

@freezed
abstract class FetchLocationHistoryState with _$FetchLocationHistoryState {
  const factory FetchLocationHistoryState.initial() =
      _$FetchLocationHistoryStateInitial;

  const factory FetchLocationHistoryState.loading() =
      _$FetchLocationHistoryStateLoading;

  const factory FetchLocationHistoryState.data({
    required List<LocationModel> locationHistoryModels,
  }) = _$FetchLocationHistoryStateData;

  const factory FetchLocationHistoryState.error({
    required Object error,
    required StackTrace stack,
  }) = _$FetchLocationHistoryStateError;

  static Future<FetchLocationHistoryState> guard(
    Future<List<LocationModel>> Function() request,
  ) async {
    try {
      return FetchLocationHistoryState.data(
        locationHistoryModels: await request(),
      );
    } catch (err, stack) {
      return FetchLocationHistoryState.error(error: err, stack: stack);
    }
  }
}
