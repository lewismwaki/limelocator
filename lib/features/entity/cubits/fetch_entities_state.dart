import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lime_locator/features/entity/data/models/entity_model/entity_model.dart';

part 'fetch_entities_state.freezed.dart';

extension FetchEntitiesGetters on FetchEntitiesState {
  bool get isInitial => this is _$FetchEntitiesStateInitial;
  bool get isLoading => this is _$FetchEntitiesStateLoading;
  bool get hasData => this is _$FetchEntitiesStateData;
  bool get hasError => this is _$FetchEntitiesStateError;
}

@freezed
abstract class FetchEntitiesState with _$FetchEntitiesState {
  const factory FetchEntitiesState.initial() = _$FetchEntitiesStateInitial;

  const factory FetchEntitiesState.loading() = _$FetchEntitiesStateLoading;

  const factory FetchEntitiesState.data({
    required List<EntityModel> entities,
  }) = _$FetchEntitiesStateData;

  const factory FetchEntitiesState.error({
    required Object error,
    required StackTrace stack,
  }) = _$FetchEntitiesStateError;

  static Future<FetchEntitiesState> guard(
    Future<List<EntityModel>> Function() request,
  ) async {
    try {
      return FetchEntitiesState.data(entities: await request());
    } catch (err, stack) {
      return FetchEntitiesState.error(error: err, stack: stack);
    }
  }
}
