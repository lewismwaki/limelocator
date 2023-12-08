import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lime_locator/constants/constants.dart';
import 'package:shimmer/shimmer.dart';

class EntityListTileLoading extends StatelessWidget {
  const EntityListTileLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: colorScheme.onPrimaryContainer.withOpacity(.5),
      highlightColor: primaryColor.withOpacity(.5),
      child: ListTile(
        dense: true,
        contentPadding: EdgeInsets.zero,
        leading: const CircleAvatar(
          radius: 24,
          backgroundImage: NetworkImage(''),
        ),
        title: Container(
          width: Random().nextInt(120) + 60,
          height: 16,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        subtitle: Container(
          width: Random().nextInt(120) + 60,
          height: 14,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
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
      ),
    );
  }
}
