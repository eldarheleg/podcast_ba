// Flutter imports:
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
// Package imports:
import 'package:get/get.dart';
import 'package:podcast_ba/app/common/colors.dart';
import 'package:podcast_ba/app/common/images.dart';
import 'package:podcast_ba/app/data/models/podcast.dart';
import 'package:podcast_ba/app/modules/notification/controllers/notification_controller.dart';
import 'package:podcast_ba/app/modules/notification/views/notification_view.dart';
import 'package:podcast_ba/app/modules/playing_now/controllers/playing_now_controller.dart';
import 'package:podcast_ba/app/modules/playing_now/views/playing_now_view.dart';

// Project imports:
import '../controllers/home_controller.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);
  NotificationController ncontroller = Get.put(NotificationController());
  HomeController controller = Get.put(HomeController());
  PlayingNowController playingNowController = Get.put(PlayingNowController());

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: whiteColor,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: const ImageIcon(
            AssetImage(menuIcn),
            color: blackColor,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Get.to(() => const NotificationView());
              },
              icon: Image.asset(
                ncontroller.notifications.isEmpty
                    ? bellEmptyIcn
                    : bellNotEmptyIcn,
                color: iconsColor,
              ))
        ],
      ),
      body: Obx(
        () => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                  gradient: LinearGradient(
                      colors: [whiteColor, primaryColor],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter)),
              height: 80,
              width: width,
              child: Text(
                controller.title.value,
                style: const TextStyle(
                  color: whiteColor,
                  fontStyle: FontStyle.italic,
                  fontSize: 32,
                  shadows: [
                    Shadow(
                      color: blackColor,
                      offset: Offset(0.0, -2.0),
                      blurRadius: 20,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: controller.bestPodcasts.isEmpty
                    ? const Center(
                        child: CircularProgressIndicator(
                          color: primaryColor,
                        ),
                      )
                    : ListView.builder(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 5),
                        physics: const BouncingScrollPhysics(),
                        itemCount: controller.bestPodcasts.length,
                        itemBuilder: (context, index) {
                          Podcast podcast = controller.bestPodcasts[index];
                          return InkWell(
                            onTap: () {
                              Get.to(() => PlayingNowView());
                              playingNowController.setIndex(index);
                            },
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              elevation: 10,
                              child: Container(
                                height: 120,
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 7,
                                      child: ClipRRect(
                                        borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(20),
                                            bottomLeft: Radius.circular(20)),
                                        child: CachedNetworkImage(
                                          alignment: Alignment.bottomLeft,
                                          imageUrl: podcast.image!,
                                          progressIndicatorBuilder: (context,
                                                  url, downloadProgress) =>
                                              Center(
                                            child: CircularProgressIndicator(
                                                color: primaryColor,
                                                value:
                                                    downloadProgress.progress),
                                          ),
                                          errorWidget: (context, url, error) =>
                                              const Icon(Icons.error),
                                        ),
                                      ),
                                    ),
                                    const Spacer(
                                      flex: 1,
                                    ),
                                    Expanded(
                                      flex: 14,
                                      child: Container(
                                        padding: const EdgeInsets.only(top: 5),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              podcast.title!,
                                              style: const TextStyle(
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              podcast.language!,
                                              style: const TextStyle(
                                                  fontSize: 15.0,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
