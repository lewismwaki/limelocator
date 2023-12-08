// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    BaseRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const BasePage(),
      );
    },
    ChatRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ChatPage(),
      );
    },
    DrivingRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const DrivingPage(),
      );
    },
    EntitiesLocationsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const EntitiesLocationsPage(),
      );
    },
    ProfileRoute.name: (routeData) {
      final args = routeData.argsAs<ProfileRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ProfilePage(
          entity: args.entity,
          key: args.key,
        ),
      );
    },
    SafetyRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SafetyPage(),
      );
    },
  };
}

/// generated route for
/// [BasePage]
class BaseRoute extends PageRouteInfo<void> {
  const BaseRoute({List<PageRouteInfo>? children})
      : super(
          BaseRoute.name,
          initialChildren: children,
        );

  static const String name = 'BaseRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ChatPage]
class ChatRoute extends PageRouteInfo<void> {
  const ChatRoute({List<PageRouteInfo>? children})
      : super(
          ChatRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChatRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [DrivingPage]
class DrivingRoute extends PageRouteInfo<void> {
  const DrivingRoute({List<PageRouteInfo>? children})
      : super(
          DrivingRoute.name,
          initialChildren: children,
        );

  static const String name = 'DrivingRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [EntitiesLocationsPage]
class EntitiesLocationsRoute extends PageRouteInfo<void> {
  const EntitiesLocationsRoute({List<PageRouteInfo>? children})
      : super(
          EntitiesLocationsRoute.name,
          initialChildren: children,
        );

  static const String name = 'EntitiesLocationsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ProfilePage]
class ProfileRoute extends PageRouteInfo<ProfileRouteArgs> {
  ProfileRoute({
    required EntityModel entity,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          ProfileRoute.name,
          args: ProfileRouteArgs(
            entity: entity,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const PageInfo<ProfileRouteArgs> page =
      PageInfo<ProfileRouteArgs>(name);
}

class ProfileRouteArgs {
  const ProfileRouteArgs({
    required this.entity,
    this.key,
  });

  final EntityModel entity;

  final Key? key;

  @override
  String toString() {
    return 'ProfileRouteArgs{entity: $entity, key: $key}';
  }
}

/// generated route for
/// [SafetyPage]
class SafetyRoute extends PageRouteInfo<void> {
  const SafetyRoute({List<PageRouteInfo>? children})
      : super(
          SafetyRoute.name,
          initialChildren: children,
        );

  static const String name = 'SafetyRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
