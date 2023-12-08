import 'dart:async';
import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lime_locator/features/entity/cubits/cubits.dart';
import 'package:lime_locator/features/entity/data/models/entity_model/entity_model.dart';
import 'package:lime_locator/shared/shared.dart';

class EntitiesMap extends StatefulHookWidget {
  const EntitiesMap({
    required this.mapControllerVal,
    super.key,
  });

  final ValueNotifier<GoogleMapController?> mapControllerVal;

  @override
  State createState() => EntitiesMapState();
}

class EntitiesMapState extends State<EntitiesMap> {
  Set<Marker> locationMarkers = {};

  //init and set custom styles
  Future<void> onMapCreated(GoogleMapController controller) async {
    widget.mapControllerVal.value = controller;
    final mapStyles = await rootBundle.loadString('assets/json/map.json');
    await controller.setMapStyle(mapStyles);
  }

  //setCustomMarker
  Future<void> customMarkerFromAvatar(EntityModel entity) async {
    final markerId = MarkerId(entity.id!);

    final bytes = await getBytesFromImage(entity.entityAvatar!);
    final randomLong = 35 + Random().nextDouble() * (38 - 35);
    final randomLat = 1.6 + Random().nextDouble() * (2 - -1.6);

    final marker = Marker(
      markerId: markerId,
      position: LatLng(randomLat, randomLong),
      icon: BitmapDescriptor.fromBytes(bytes),
      infoWindow: InfoWindow(
        title: entity.entityName,
        onTap: () {
          context.router.push(ProfileRoute(entity: entity));
        },
      ),
    );

    setState(() {
      locationMarkers.add(marker);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<FetchEntitiesCubit, FetchEntitiesState>(
      listener: (context, state) {
        state.whenOrNull(
          data: (entities) {
            for (final e in entities) {
              customMarkerFromAvatar(e);
            }
          },
        );
      },
      child: GoogleMap(
        myLocationEnabled: true,
        initialCameraPosition: const CameraPosition(
          zoom: 8,
          target: LatLng(1.3, 36.8),
        ),
        liteModeEnabled: true,
        mapToolbarEnabled: false,
        markers: locationMarkers,
        onMapCreated: onMapCreated,
      ),
    );
  }
}
