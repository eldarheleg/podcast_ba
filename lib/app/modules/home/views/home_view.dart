// Flutter imports:
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
// Package imports:
import 'package:get/get.dart';
import 'package:podcast_ba/app/common/colors.dart';
import 'package:podcast_ba/app/common/images.dart';
import 'package:podcast_ba/app/data/models/podcast.dart';
import 'package:podcast_ba/app/modules/notification/views/notification_view.dart';

// Project imports:
import '../controllers/home_controller.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.put(HomeController());
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
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
                Get.to(() => const NotificationView());
              },
              icon: Image.asset(
                bellIcn,
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
                    gradient: LinearGradient(colors: [orangeColor, pinkColor])),
                height: 50,
                width: width,
                //color: primaryColor,
                child: Text(
                  controller.title.value,
                  style: const TextStyle(
                      color: whiteColor,
                      fontStyle: FontStyle.italic,
                      fontSize: 32),
                )),
            SizedBox(
              height: 10,
              width: width,
            ),
            Expanded(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: controller.bestPodcasts.length,
                itemBuilder: (context, index) {
                  Podcast podcast = controller.bestPodcasts[index];
                  return Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    elevation: 4,
                    child: Container(
                    height: 120,
                    padding: const EdgeInsets.all(0),
                    child: Row(children: [
                      Expanded(
                        flex: 6,
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(topLeft: Radius.circular(20),bottomLeft: Radius.circular(20)),
                          child: CachedNetworkImage(
                                alignment: Alignment.bottomLeft,
                                imageUrl: podcast.image!,
                                progressIndicatorBuilder:
                                    (context, url, downloadProgress) =>
                                        CircularProgressIndicator(
                                            value: downloadProgress.progress),
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Text(podcast.title!,
                                  style: const TextStyle(
                                      fontSize: 20.0, fontWeight: FontWeight.bold)),
                              
                            ],
                          ),
                        ),
                      ),
                    ],),
                  ),
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

