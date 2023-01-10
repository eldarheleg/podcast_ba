// Flutter imports:
import 'package:flutter/material.dart';
// Package imports:
import 'package:get/get.dart';
import 'package:podcast_ba/app/common/colors.dart';
import 'package:podcast_ba/app/common/styles.dart';
import 'package:podcast_ba/app/modules/welcome/views/welcome_view.dart';

// Project imports:
import '../controllers/registration_controller.dart';

class RegistrationView extends GetView<RegistrationController> {
  const RegistrationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    RegistrationController controller = Get.put(RegistrationController());
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
                const SizedBox(height: 20),
                TextFormField(
                  style: largeText,
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: primaryColor,
                            width: 2,
                            strokeAlign: StrokeAlign.inside),
                      ),
                      hintText: 'First Name',
                      hintStyle: hintText),
                  onChanged: (value) => controller.ifname.value = value,
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
                            strokeAlign: StrokeAlign.inside),
                      ),
                      hintText: 'Last Name',
                      hintStyle: hintText),
                  onChanged: (value) => controller.ilname.value = value,
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
                            strokeAlign: StrokeAlign.inside),
                      ),
                      hintText: 'Email',
                      hintStyle: hintText),
                  onChanged: (value) => controller.iemail.value = value,
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
                            strokeAlign: StrokeAlign.inside),
                      ),
                      hintText: 'Password',
                      hintStyle: hintText),
                  obscureText: true,
                  onChanged: (value) => controller.ipassword.value = value,
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
                            strokeAlign: StrokeAlign.inside),
                      ),
                      hintText: 'Verify Password',
                      hintStyle: hintText),
                  obscureText: true,
                  onChanged: (value) =>
                      controller.ipasswordConfirm.value = value,
                ),
                const SizedBox(height: 80),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      fixedSize: Size(width, height * 0.06),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      backgroundColor: primaryColor),
                  child: const Text(
                    'Sign up',
                    style: largeText,
                  ),
                  onPressed: () => controller.signUp(),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      fixedSize: Size(width, height * 0.06),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      backgroundColor: whiteColor,
                      foregroundColor: primaryColor),
                  child: const Text(
                    'Back',
                    style: largeText,
                  ),
                  onPressed: () => Get.off(() => const WelcomeView(),
                      transition: Transition.rightToLeft),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
