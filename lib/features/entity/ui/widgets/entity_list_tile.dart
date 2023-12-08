import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lime_locator/constants/constants.dart';
import 'package:lime_locator/features/entity/data/models/entity_model/entity_model.dart';
import 'package:lime_locator/features/location_history/cubit/fetch_location_history_cubit.dart';
import 'package:lime_locator/shared/utils/router.dart';
import 'package:timeago/timeago.dart' as timeago;

class EntityListTile extends StatelessWidget {
  const EntityListTile({required this.entity, super.key});
  final EntityModel entity;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      onTap: () {
        context.read<FetchLocationHistoryCubit>().fetchLocationHistory(
              entityId: int.parse(entity.id!),
            );
        context.router.push(ProfileRoute(entity: entity));
      },
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(
        radius: 24,
        backgroundImage: NetworkImage(entity.entityAvatar ?? 'n/a'),
      ),
      title: Text(
        entity.entityName ?? 'n/a',
        style: const TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 16,
          color: primaryBlack,
        ),
      ),
      subtitle: Text(
        entity.currentLocation?.address ?? 'n/a',
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: primaryBlack,
        ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (entity.entityType == 'person')
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                padding: EdgeInsets.zero,
                shape: const CircleBorder(),
                backgroundColor: Colors.transparent,
              ),
              child: const Icon(
                Icons.video_call,
              ),
            )
          else
            Text(
              entity.currentLocation == null
                  ? 'n/a'
                  : timeago.format(entity.currentLocation!.lastUpdated!),
              style: const TextStyle(fontSize: 14),
            ),
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
              shape: const CircleBorder(),
            ),
            child: const Icon(
              Icons.send_outlined,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }
}
