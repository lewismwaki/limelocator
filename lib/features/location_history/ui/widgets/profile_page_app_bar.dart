import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:lime_locator/constants/theme.dart';
import 'package:lime_locator/features/entity/data/models/entity_model/entity_model.dart';

class ProfilePageAppBar extends StatelessWidget {
  const ProfilePageAppBar({
    required this.isAppBarBlurred,
    required this.entity,
    super.key,
  });

  final bool isAppBarBlurred;
  final EntityModel entity;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: const BoxDecoration(),
        child: BackdropFilter(
          filter: isAppBarBlurred
              ? ImageFilter.blur(sigmaX: 8, sigmaY: 8)
              : ImageFilter.blur(),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //back
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 10,
                          blurStyle: BlurStyle.outer,
                          color: colorScheme.outlineVariant.withOpacity(.8),
                        ),
                      ],
                    ),
                    child: IconButton(
                      style: IconButton.styleFrom(
                        backgroundColor: Colors.white,
                        elevation: 8,
                        padding: EdgeInsets.zero,
                      ),
                      icon: const Icon(Icons.keyboard_arrow_left),
                      onPressed: () {
                        context.router.pop();
                      },
                    ),
                  ),
                ),

                //name
                Text(
                  entity.entityName ?? 'n/a',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                //call
                TextButton(
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    shape: const CircleBorder(),
                  ),
                  child: const Icon(Icons.send, size: 20),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
