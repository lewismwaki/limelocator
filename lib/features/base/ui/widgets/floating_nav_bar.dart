import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:lime_locator/constants/constants.dart';
import 'package:lime_locator/features/base/models/nav_item.dart';
import 'package:lime_locator/features/base/ui/widgets/nav_item_button.dart';

class FloatingNavBar extends StatelessWidget {
  FloatingNavBar({
    required this.tabsRouter,
    required this.child,
    super.key,
  });

  final TabsRouter tabsRouter;
  final Widget child;

  final navItems = [
    NavItem(icon: Icons.map, label: 'Location'),
    NavItem(icon: Icons.route, label: 'Driving'),
    NavItem(icon: Icons.shield_outlined, label: 'Safety'),
    NavItem(icon: Icons.chat_outlined, label: 'Chat'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Container(
          height: 72,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                blurRadius: 10,
                blurStyle: BlurStyle.outer,
                color: colorScheme.outlineVariant.withOpacity(.2),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: navItems
                  .asMap()
                  .entries
                  .map(
                    (e) => NavItemButton(
                      navItem: e.value,
                      isSelected: e.key == tabsRouter.activeIndex,
                      onTap: () {
                        tabsRouter.setActiveIndex(e.key);
                      },
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
      ),
      body: child,
    );
  }
}
