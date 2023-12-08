import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:lime_locator/constants/constants.dart';
import 'package:lime_locator/features/entity/entity.dart';
import 'package:lime_locator/shared/utils/enums.dart';
import 'package:lime_locator/shared/widgets/error_section.dart';

class EntitiesSection extends StatefulHookWidget {
  const EntitiesSection({super.key});

  @override
  State<EntitiesSection> createState() => _EntitiesSectionState();
}

class _EntitiesSectionState extends State<EntitiesSection> {
  @override
  void initState() {
    context.read<FetchEntitiesCubit>().fetchEntities();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final entityFiler = useState(EntityFilter.all);

    return Positioned(
      bottom: 0,
      child: SizedBox(
        height: 200,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Container(
            width: double.infinity,
            alignment: Alignment.center,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: primaryColor,
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  //filters
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          ...EntityFilter.values.asMap().entries.map(
                            (e) {
                              final isSelected = entityFiler.value == e.value;
                              return Padding(
                                padding: const EdgeInsets.only(right: 8),
                                child: FilterChip(
                                  selected: isSelected,
                                  label: Text(e.value.name.capitalizeFirst()),
                                  pressElevation: 0,
                                  showCheckmark: false,
                                  side: BorderSide.none,
                                  padding: EdgeInsets.zero,
                                  labelPadding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                  ),
                                  color: const MaterialStatePropertyAll(
                                    accentColor,
                                  ),
                                  labelStyle: TextStyle(
                                    color: primaryBlack,
                                    fontSize: 14,
                                    fontWeight: isSelected
                                        ? FontWeight.w700
                                        : FontWeight.w400,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  onSelected: (val) {
                                    entityFiler.value = e.value;
                                  },
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 24,
                        height: 24,
                        child: OutlinedButton(
                          onPressed: () {},
                          child: const Icon(
                            Icons.more_horiz,
                            size: 24,
                          ),
                        ),
                      ),
                    ],
                  ),

                  //entities
                  context.watch<FetchEntitiesCubit>().state.when(
                        initial: SizedBox.shrink,
                        loading: () {
                          return Expanded(
                            child: ListView.builder(
                              itemCount: 4,
                              shrinkWrap: true,
                              padding: EdgeInsets.zero,
                              itemBuilder: (BuildContext context, int index) {
                                return const EntityListTileLoading();
                              },
                            ),
                          );
                        },
                        data: (entities) {
                          return Expanded(
                            child: ListView.builder(
                              itemCount: 4,
                              shrinkWrap: true,
                              padding: EdgeInsets.zero,
                              itemBuilder: (BuildContext context, int index) {
                                final entity = entities[index];
                                return EntityListTile(entity: entity);
                              },
                            ),
                          );
                        },
                        error: (e, s) {
                          return ErrorSection(
                            onRetry: () {
                              context
                                  .read<FetchEntitiesCubit>()
                                  .fetchEntities();
                            },
                          );
                        },
                      ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
