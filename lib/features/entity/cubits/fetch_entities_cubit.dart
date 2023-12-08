import 'package:bloc/bloc.dart';
import 'package:lime_locator/features/entity/cubits/fetch_entities_state.dart';
import 'package:lime_locator/features/entity/data/services/entity_service.dart';

class FetchEntitiesCubit extends Cubit<FetchEntitiesState> {
  FetchEntitiesCubit({
    required this.entityService,
  }) : super(const FetchEntitiesState.initial());

  final EntityService entityService;

  Future<void> fetchEntities() async {
    emit(const FetchEntitiesState.loading());
    emit(await FetchEntitiesState.guard(entityService.getEntities));
  }
}
