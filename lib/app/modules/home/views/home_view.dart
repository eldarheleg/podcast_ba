// Flutter imports:
import 'package:flutter/material.dart';
// Package imports:
import 'package:get/get.dart';
import 'package:podcast_ba/app/common/colors.dart';
import 'package:podcast_ba/app/common/images.dart';

// Project imports:
import '../controllers/home_controller.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.put(HomeController());
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'Home',
          style: TextStyle(color: blackColor),
        ),
        backgroundColor: whiteColor,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: const ImageIcon(
            AssetImage(menuIcn),
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                controller.fetchPodcastsByGenre();
              },
              icon: Image.asset(
                bellIcn,
                color: iconsColor,
              ))
        ],
      ),
      body: Obx(
        () => Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(controller.title.value),
            const SizedBox(
              height: 40,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: controller.bestPodcasts.length,
                itemBuilder: (context, index) {
                  var podcast = controller.bestPodcasts[index];
                  return ListTile(
                    title: Text(podcast.title!),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
