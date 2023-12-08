import 'package:flutter/material.dart';
import 'package:lime_locator/shared/shared.dart';

class MapAppBar extends StatelessWidget {
  const MapAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 16,
      left: 16,
      right: 16,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ShadowedIconButton(
            iconData: Icons.search_outlined,
            onPressed: () {},
          ),
          ShadowedIconButton(
            iconData: Icons.settings_outlined,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
