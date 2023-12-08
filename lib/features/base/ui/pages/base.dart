import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:lime_locator/features/base/ui/widgets/floating_nav_bar.dart';
import 'package:lime_locator/shared/shared.dart';

@RoutePage()
class BasePage extends StatelessWidget {
  const BasePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [
        EntitiesLocationsRoute(),
        DrivingRoute(),
        SafetyRoute(),
        ChatRoute(),
      ],
      transitionBuilder: (context, child, animation) {
        return FadeTransition(opacity: animation, child: child);
      },
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        return FloatingNavBar(tabsRouter: tabsRouter, child: child);
      },
    );
  }
}
