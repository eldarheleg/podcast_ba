// Flutter imports:
import 'package:flutter/material.dart';
// Package imports:
import 'package:get/get.dart';
import 'package:podcast_ba/app/common/colors.dart';
import 'package:podcast_ba/app/common/images.dart';

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
          leading: IconButton(onPressed: (){}, icon: ImageIcon(AssetImage(menuIcn))),
          // leading: IconButton(
          //     onPressed: () async {
          //       SharedPreferences prefs = await SharedPreferences.getInstance();
          //       prefs.remove('email');
          //       Get.off(() => const LoginView());
          //     },
          //     icon: const Icon(Icons.exit_to_app)),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Image.asset(
                  bellIcn,
                  color: iconsColor,
                ))
          ],
        ),
        body: Center(
          child: Text("home is working"),
        ));
  }
}
