// Package imports:
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:podcast_ba/app/common/colors.dart';
// Project imports:
import 'package:podcast_ba/app/data/db/db_helper.dart';
import 'package:podcast_ba/app/data/models/user.dart';
import 'package:podcast_ba/app/modules/login/views/login_view.dart';

class RegistrationController extends GetxController {
  int id = 1;
  final ifname = ''.obs;
  final ilname = ''.obs;
  final iemail = ''.obs;
  final ipassword = ''.obs;
  final ipasswordConfirm = ''.obs;
  var dbHelper;
  @override
  void onInit() {
    super.onInit();
    dbHelper = DbHelper();
  }

  signUp() async {
    String firstname = ifname.value;
    String lastname = ilname.value;
    String email = iemail.value;
    String passwd = ipassword.value;
    String cpasswd = ipasswordConfirm.value;
    bool alreadyExist = await dbHelper.userExists(email);

    if (passwd != cpasswd ||
        firstname.isEmpty ||
        lastname.isEmpty ||
        email.isEmpty ||
        passwd.isEmpty ||
        cpasswd.isEmpty) {
      Get.snackbar(
        ":(",
        "",
        backgroundColor: primaryColor,
        messageText: const Text(
          "One field is missing or password mismatch!",
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: whiteColor),
          textAlign: TextAlign.center,
        ),
      );
    } else {
      if (alreadyExist) {
        Get.snackbar(
          ":(",
          "",
          backgroundColor: primaryColor,
          messageText: const Text(
            "User with that mail already exists!",
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: whiteColor),
            textAlign: TextAlign.center,
          ),
        );
      } else {
        User uModel = User(
            id: id,
            firstname: firstname,
            lastname: lastname,
            email: email,
            password: passwd);
        await dbHelper.saveData(uModel).then((userData) {
          Get.snackbar(
            ":)",
            "",
            backgroundColor: primaryColor,
            messageText: const Text(
              "Succesfull registration!",
              style: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold, color: whiteColor),
              textAlign: TextAlign.center,
            ),
          );
          Get.to(() => const LoginView(), transition: Transition.leftToRight);
          id++;
        }).catchError((error) {
          Get.snackbar(
            ":/",
            "",
            backgroundColor: primaryColor,
            messageText: const Text(
              "Something went wrong...",
              style: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold, color: whiteColor),
              textAlign: TextAlign.center,
            ),
          );
        });
      }
    }
  }
}
