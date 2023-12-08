import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:lime_locator/features/base/base.dart';
import 'package:lime_locator/features/chat/chat.dart';
import 'package:lime_locator/features/driving/driving.dart';
import 'package:lime_locator/features/entity/entity.dart';
import 'package:lime_locator/features/location_history/location_history.dart';
import 'package:lime_locator/features/safety/safety.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: BaseRoute.page,
          initial: true,
          children: [
            AutoRoute(page: EntitiesLocationsRoute.page),
            AutoRoute(page: DrivingRoute.page),
            AutoRoute(page: SafetyRoute.page),
            AutoRoute(page: ChatRoute.page),
          ],
        ),
        AutoRoute(page: ProfileRoute.page),
      ];
}
