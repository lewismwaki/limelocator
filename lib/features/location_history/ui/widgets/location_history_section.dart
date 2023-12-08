//locationHistory
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:lime_locator/features/entity/data/models/entity_model/entity_model.dart';
import 'package:lime_locator/features/location_history/cubit/fetch_location_history_cubit.dart';
import 'package:lime_locator/features/location_history/ui/widgets/location_history_section_loading.dart';
import 'package:lime_locator/shared/widgets/error_section.dart';

class LocationHistorySection extends StatefulWidget {
  const LocationHistorySection({
    required this.entity,
    super.key,
  });

  final EntityModel entity;

  @override
  State<LocationHistorySection> createState() => _LocationHistorySectionState();
}

class _LocationHistorySectionState extends State<LocationHistorySection> {
  final locationsExpandableController = ExpandableController(
    initialExpanded: true,
  );

  @override
  void initState() {
    locationsExpandableController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final isExpanded = locationsExpandableController.expanded;
    final pastLocationsState = context.watch<FetchLocationHistoryCubit>().state;

    return ExpandableNotifier(
      controller: locationsExpandableController,
      child: ExpandablePanel(
        expanded: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(16),
              bottomRight: Radius.circular(16),
            ),
          ),
          child: pastLocationsState.when(
            error: (e, s) => ErrorSection(
              onRetry: () {
                context.read<FetchLocationHistoryCubit>().fetchLocationHistory(
                      entityId: int.parse(widget.entity.id!),
                    );
              },
            ),
            loading: LocationHistorySectionLoading.new,
            initial: () => const SizedBox.shrink(),
            data: (locationHistoryModels) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
                child: ListView.separated(
                  separatorBuilder: (_, index) => const SizedBox(height: 10),
                  itemCount: locationHistoryModels.length,
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    final locationHistoryModel = locationHistoryModels[index];
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          locationHistoryModel.address ?? 'n/a',
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          locationHistoryModel.lastUpdated == null
                              ? 'n/a'
                              : DateFormat('hh:mm')
                                  .format(locationHistoryModel.lastUpdated!),
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              );
            },
          ),
        ),
        theme: const ExpandableThemeData(
          inkWellBorderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
          useInkWell: true,
          iconPadding: EdgeInsets.all(10),
          tapHeaderToExpand: true,
          tapBodyToExpand: false,
          tapBodyToCollapse: false,
          hasIcon: false,
        ),
        collapsed: const SizedBox.shrink(),
        //header
        header: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: isExpanded
                ? const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  )
                : BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),
            child: Column(
              children: [
                //title
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Last updates',
                      style: TextStyle(
                        fontSize: 22,
                        fontFamily: 'SplineSans',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    OutlinedButton(
                      onPressed: locationsExpandableController.toggle,
                      child: AnimatedRotation(
                        turns: isExpanded ? 0.5 : 0.0,
                        duration: const Duration(milliseconds: 300),
                        child: const Icon(
                          Icons.keyboard_arrow_down,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
