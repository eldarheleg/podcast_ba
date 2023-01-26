// Flutter imports:
import 'package:flutter/material.dart';
// Package imports:
import 'package:get/get.dart';
import 'package:podcast_ba/app/common/colors.dart';
import 'package:podcast_ba/app/common/images.dart';
import 'package:podcast_ba/app/common/styles.dart';
import 'package:podcast_ba/app/modules/login/views/login_view.dart';
import 'package:podcast_ba/app/modules/settings/views/settings_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Project imports:
import '../controllers/profile_controller.dart';

class ProfileView extends StatelessWidget {
  ProfileView({Key? key}) : super(key: key);

  ProfileController controller = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(color: blackColor),
        ),
        elevation: 0,
        backgroundColor: whiteColor,
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              Image.asset(
                loginManImg,
                scale: 4,
              ),
              const SizedBox(
                height: 40,
              ),
              Text(
                'Welcome ${controller.fname.value} ${controller.lname.value}',
                style: largeText,
              ),
              const SizedBox(
                height: 40,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    fixedSize: Size(width, height * 0.06),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    backgroundColor: primaryColor,
                    foregroundColor: whiteColor),
                child: const Text(
                  'Settings',
                  style: largeText,
                ),
                onPressed: () => Get.to(() => SettingsView(),
                    transition: Transition.rightToLeft),
              ),
              const SizedBox(
                height: 40,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    fixedSize: Size(width, height * 0.06),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    backgroundColor: primaryColor,
                    foregroundColor: whiteColor),
                child: const Text(
                  'Log out',
                  style: largeText,
                ),
                onPressed: () async {
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  prefs.remove('email');
                  Get.off(() => const LoginView());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
