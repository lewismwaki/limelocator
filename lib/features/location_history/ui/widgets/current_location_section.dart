import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lime_locator/features/entity/data/models/entity_model/entity_model.dart';
import 'package:timeago/timeago.dart' as timeago;

class CurrentLocationSection extends StatelessWidget {
  const CurrentLocationSection({
    required this.entity,
    super.key,
  });

  final EntityModel entity;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          children: [
            //title
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Now is',
                  style: TextStyle(
                    fontSize: 22,
                    fontFamily: 'SplineSans',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Icon(Icons.location_on_outlined),
              ],
            ),

            const SizedBox(height: 8),

            //currentLocation
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${entity.currentLocation?.address}',
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
                Text(
                  entity.currentLocation == null ? 'n/a' : 'Since ${DateFormat('hh:mm a').format(entity.currentLocation!.lastUpdated!)}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 4),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Home',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  entity.currentLocation == null ? 'n/a' : 'Updated ${timeago.format(entity.currentLocation!.lastUpdated!)}',
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
