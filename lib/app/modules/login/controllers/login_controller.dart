// Dart imports:
import 'dart:ui';

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
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  Future<SharedPreferences> _pref = SharedPreferences.getInstance();

  var dbHelper;
  void onInit() {
    super.onInit();
    dbHelper = DbHelper();
  }

  login() async {
    String email = emailController.text;
    String password = passController.text;

    if (email.isEmpty) {
      Get.snackbar("", "", titleText: Center(child: Text("Ops",textAlign: TextAlign.center,)),
          backgroundColor: primaryColor, messageText: Text("nestoo",style: TextStyle(fontSize: 18,),textAlign: TextAlign.center,));
    } else if (password.isEmpty) {
      Get.snackbar("Ops", "Please enter password",
          backgroundColor: primaryColor);
    } else {
      await dbHelper.getLoginUser(email, password).then((userData) {
        if (userData != null) {
          setSP(userData).whenComplete(() {
            Get.offAll(HomeView(),transition: Transition.fadeIn);
          });
        } else {
          Get.snackbar("Ops", "User not found", backgroundColor: primaryColor);
        }
      }).catchError((error) {
        print(error);
        Get.snackbar("Ops", "Login fail, try again",
            backgroundColor: primaryColor);
      });
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
