// Flutter imports:
import 'package:flutter/material.dart';
// Package imports:
import 'package:get/get.dart';
import 'package:podcast_ba/app/common/colors.dart';
import 'package:podcast_ba/app/common/images.dart';
import 'package:podcast_ba/app/modules/categories/views/categories_view.dart';
import 'package:podcast_ba/app/modules/playlists/views/playlists_view.dart';
import 'package:podcast_ba/app/modules/profile/views/profile_view.dart';

// Project imports:
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    //HomeController controller = Get.put(HomeController());
    return Scaffold(
          appBar: AppBar(
            elevation: 0,
            title: const Text(
              'Home',
              style: TextStyle(color: blackColor),
            ),
            backgroundColor: whiteColor,
            centerTitle: true,
            leading: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: iconsColor,
            ),
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    bellIcn,
                    color: iconsColor,
                  ))
            ],
          ),
          body: Center(child: Text("home is working"),)
          
          );
  }
}

//IconButton(
//     onPressed: () async {
//       SharedPreferences prefs = await SharedPreferences.getInstance();
//       prefs.remove('email');
//       Get.off(() => const LoginView());
//     },
//     icon: const Icon(Icons.exit_to_app)),
