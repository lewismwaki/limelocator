import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:lime_locator/constants/constants.dart';
import 'package:lime_locator/features/entity/data/models/entity_model/entity_model.dart';
import 'package:lime_locator/features/location_history/ui/widgets/current_location_section.dart';
import 'package:lime_locator/features/location_history/ui/widgets/location_history_section.dart';
import 'package:lime_locator/features/location_history/ui/widgets/profile_page_app_bar.dart';

@RoutePage()
class ProfilePage extends StatefulWidget {
  const ProfilePage({
    required this.entity,
    super.key,
  });

  final EntityModel entity;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  ScrollController? scrollController;

  @override
  void initState() {
    scrollController = ScrollController();
    scrollController?.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final isAppBarBlurred = scrollController != null &&
        scrollController!.hasClients &&
        scrollController!.offset > 16;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: [
            //content
            SingleChildScrollView(
              controller: scrollController,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 68),

                    //avatar
                    Center(
                      child: CircleAvatar(
                        foregroundImage: NetworkImage(
                          widget.entity.entityAvatar ?? '',
                        ),
                        radius: 100,
                      ),
                    ),

                    const SizedBox(height: 20),

                    //id
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            //info
                            OutlinedButton(
                              child: const Icon(Icons.info_outline),
                              onPressed: () {},
                            ),

                            const SizedBox(width: 10),

                            //id
                            Container(
                              decoration: BoxDecoration(
                                color: colorScheme.primary,
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 6,
                                ),
                                child: Text(
                                  'id no: ${widget.entity.id}',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),

                            const SizedBox(width: 10),

                            //chat
                            OutlinedButton(
                              child: const Icon(Icons.copy_all_outlined),
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 10),

                    //currentLocationSection
                    CurrentLocationSection(entity: widget.entity),

                    const SizedBox(height: 10),

                    //locationHistory
                    LocationHistorySection(entity: widget.entity),
                  ],
                ),
              ),
            ),

            ProfilePageAppBar(
              entity: widget.entity,
              isAppBarBlurred: isAppBarBlurred,
            ),

            //bottom actions
            Positioned(
              bottom: 20,
              right: 20,
              left: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //call
                  TextButton(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      shape: const CircleBorder(),
                    ),
                    child: const Icon(Icons.call_outlined, size: 20),
                    onPressed: () {},
                  ),

                  const SizedBox(width: 10),

                  //follow
                  TextButton(
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 36,
                        vertical: 12,
                      ),
                    ),
                    onPressed: () {},
                    child: const Text(
                      'Follow',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),

                  const SizedBox(width: 10),

                  //video call
                  TextButton(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      shape: const CircleBorder(),
                    ),
                    child: const Icon(Icons.video_call_outlined, size: 20),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
