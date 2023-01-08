import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:podcast_ba/app/common/colors.dart';
import 'package:podcast_ba/app/common/images.dart';
import 'package:podcast_ba/app/common/spaces.dart';
import 'package:podcast_ba/app/common/styles.dart';
import 'package:podcast_ba/app/modules/login/views/login_view.dart';
import 'package:podcast_ba/app/modules/registration/views/registration_view.dart';
import 'package:podcast_ba/app/modules/widgets/rounded_button.dart';

import '../controllers/welcome_controller.dart';

class WelcomeView extends GetView<WelcomeController> {
  const WelcomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          top: false,
          child: Padding(
            padding: const EdgeInsets.all(40.0),
            child: Container(
              child: Column(
                children: [
                  Stack(
                    alignment: AlignmentDirectional.bottomEnd,
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40),
                          bottomLeft: Radius.circular(40),
                          bottomRight: Radius.circular(100),
                        ),
                        child: Container(
                          height: height * 0.6,
                          width: width,
                          child: Image.asset(
                            welcomeScreenImage,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Image.asset(playButtonImage),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Podcast",
                    style: xlargeText,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Listen your favourite podcast\nAnywhere, Anytime",
                    style: largeText,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  roundedButtonStyle(
                      height * 0.06,
                      width,
                      25,
                      "Log In",
                      primaryColor,
                      whiteColor,
                      largeTextButton,
                      roundedButtonFunction),
                  const SizedBox(
                    height: 10,
                  ),
                  roundedButtonStyle(height * 0.06, width, 25, "Sign Up",
                      whiteColor, primaryColor, largeTextButton, signUp),
                ],
              ),
            ),
          ),
        ));
  }

  signUp() {
    Get.to(RegistrationView());
  }

  roundedButtonFunction() {
    Get.to(const LoginView());
  }
}
