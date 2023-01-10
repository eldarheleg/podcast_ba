// Flutter imports:
import 'package:flutter/widgets.dart';
// Package imports:
import 'package:get/get.dart';
// Project imports:
import 'package:podcast_ba/app/common/colors.dart';
import 'package:podcast_ba/app/data/db/db_helper.dart';
import 'package:podcast_ba/app/data/models/user.dart';
import 'package:podcast_ba/app/modules/home/views/home_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  final Future<SharedPreferences> _pref = SharedPreferences.getInstance();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  bool loggedIn = false;

  var dbHelper;
  @override
  void onInit() {
    super.onInit();
    dbHelper = DbHelper();
  }

  login() async {
    String email = emailController.text;
    String password = passController.text;

    if (email.isEmpty || password.isEmpty) {
      Get.snackbar(
        ":(",
        "",
        backgroundColor: primaryColor,
        messageText: const Text(
          "Invalid email or password",
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: whiteColor),
          textAlign: TextAlign.center,
        ),
      );
    } else {
      await dbHelper.getLoginUser(email, password).then(
        (userData) {
          if (userData != null) {
            setSP(userData).whenComplete(() {
              Get.offAll(const HomeView(), transition: Transition.fadeIn);
              loggedIn = true;
            });
          } else {
            Get.snackbar(
              ":(",
              "",
              backgroundColor: primaryColor,
              messageText: const Text(
                "User not found",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: whiteColor),
                textAlign: TextAlign.center,
              ),
            );
          }
        },
      ).catchError(
        (error) {
          Get.snackbar(
            ":(",
            "",
            backgroundColor: primaryColor,
            messageText: const Text(
              "Login fail, try again later",
              style: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold, color: whiteColor),
              textAlign: TextAlign.center,
            ),
          );
        },
      );
    }
  }

  Future setSP(User user) async {
    final SharedPreferences sp = await _pref;

    sp.setString("firstname", user.firstname);
    sp.setString("lastname", user.lastname);
    sp.setString("email", user.email);
    sp.setString("password", user.password);
  }
}
