import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lime_locator/constants/constants.dart';
import 'package:lime_locator/features/entity/entity.dart';
import 'package:lime_locator/features/location_history/location_history.dart';
import 'package:lime_locator/shared/shared.dart';

class LimeLocator extends StatelessWidget {
  LimeLocator({super.key});

  final appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    final dio = DioService();

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FetchEntitiesCubit(
            entityService: EntityService(dio: dio),
          ),
        ),
        BlocProvider(
          create: (context) => FetchLocationHistoryCubit(
            locationHistoryService: LocationHistoryService(dio: dio),
          ),
        ),
      ],
      child: MaterialApp.router(
        theme: themeData,
        debugShowCheckedModeBanner: false,
        routerConfig: appRouter.config(),
      ),
    );
  }
}
