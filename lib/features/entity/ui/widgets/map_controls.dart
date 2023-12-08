import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lime_locator/shared/widgets/shadowed_icon_button.dart';

class MapControls extends StatelessWidget {
  const MapControls({
    required this.mapControllerVal,
    super.key,
  });

  final ValueNotifier<GoogleMapController?> mapControllerVal;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 288,
      child: Column(
        children: [
          //zoom in
          ShadowedIconButton(
            iconData: Icons.add,
            onPressed: () async {
              var zoom = await mapControllerVal.value?.getZoomLevel() ?? 0;
              zoom = zoom + 2;
              await mapControllerVal.value?.animateCamera(
                CameraUpdate.zoomIn(),
              );
            },
            padding: const EdgeInsets.only(left: 16),
          ),

          const SizedBox(height: 10),

          //zoom out
          ShadowedIconButton(
            iconData: Icons.remove,
            onPressed: () async {
              var zoom = await mapControllerVal.value?.getZoomLevel() ?? 0;
              zoom = zoom - 2;
              if (zoom < 0) zoom = 0;
              await mapControllerVal.value?.animateCamera(
                CameraUpdate.zoomOut(),
              );
            },
            padding: const EdgeInsets.only(left: 16),
          ),

          const SizedBox(height: 10),
          //location
          ShadowedIconButton(
            iconData: Icons.send_outlined,
            onPressed: () {},
            padding: const EdgeInsets.only(left: 16),
          ),
        ],
      ),
    );
  }
}
