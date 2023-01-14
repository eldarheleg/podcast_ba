// Flutter imports:
import 'package:flutter/material.dart';
// Package imports:
import 'package:get/get.dart';
// Project imports:
import 'package:podcast_ba/app/common/colors.dart';
import 'package:podcast_ba/app/common/images.dart';
import 'package:podcast_ba/app/common/styles.dart';
import 'package:podcast_ba/app/modules/welcome/views/welcome_view.dart';

import '../controllers/login_controller.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LoginController controller = Get.put(LoginController());
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(40.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: height * 0.2,
                ),
                Image.asset(loginManImg,
                    filterQuality: FilterQuality.high, scale: 3),
                const SizedBox(height: 60),
                TextFormField(
                  style: largeText,
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: primaryColor,
                              width: 2,
                              strokeAlign: StrokeAlign.inside)),
                      hintText: 'Email',
                      hintStyle: hintText),
                  controller: controller.emailController,
                ),
                const SizedBox(height: 10),
                TextFormField(
                  style: largeText,
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: primaryColor,
                              width: 2,
                              strokeAlign: StrokeAlign.inside)),
                      hintText: 'Password',
                      hintStyle: hintText),
                  obscureText: true,
                  controller: controller.passController,
                ),
                const SizedBox(height: 80),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      fixedSize: Size(width, height * 0.06),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      backgroundColor: primaryColor),
                  child: const Text(
                    'Log in',
                    style: largeText,
                  ),
                  onPressed: () => controller.login(),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      fixedSize: Size(width, height * 0.06),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      backgroundColor: whiteColor,
                      foregroundColor: primaryColor),
                  child: const Text(
                    'Back',
                    style: largeText,
                  ),
                  onPressed: () => Get.off(() => const WelcomeView(),
                      transition: Transition.leftToRight),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
