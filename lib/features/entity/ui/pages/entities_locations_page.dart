import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lime_locator/constants/constants.dart';
import 'package:lime_locator/features/entity/entity.dart';

@RoutePage()
class EntitiesLocationsPage extends HookWidget {
  const EntitiesLocationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final mapControllerVal = useState<GoogleMapController?>(null);

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // map
            EntitiesMap(mapControllerVal: mapControllerVal),

            //entities
            const EntitiesSection(),

            //add new
            const AddNewSection(),

            //map controls
            MapControls(mapControllerVal: mapControllerVal),

            //app bar
            const MapAppBar(),
          ],
        ),
      ),
    );
  }
}

class AddNewSection extends StatelessWidget {
  const AddNewSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 200,
      left: 0,
      right: 0,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //tag
            Expanded(
              child: InkWell(
                onTap: () {},
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 4),
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: const BoxDecoration(
                            color: primaryColor,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.add,
                            size: 20,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        'Add new Tag',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(width: 16),

            //item
            Expanded(
              child: InkWell(
                onTap: () {},
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 4),
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: const BoxDecoration(
                            color: primaryColor,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.add,
                            size: 20,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        'Add new Item',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
