
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:podcast_ba/app/data/db/db_helper.dart';
import 'package:podcast_ba/app/data/models/user.dart';
import 'package:podcast_ba/app/modules/home/views/home_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

class LoginController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  Future<SharedPreferences> _pref = SharedPreferences.getInstance();

  var dbHelper;
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    dbHelper = DbHelper();
  }

  login() async {
    String email = emailController.text;
    String password = passController.text;

    if (email.isEmpty) {
      Get.dialog(Text("Please Enter User ID"));
    } else if (password.isEmpty) {
      Get.dialog(Text("Please Enter Password"));
      //alertDialog(context, "Please Enter Password");
    } else {
      await dbHelper.getLoginUser(email, password).then((userData) {
        if (userData != null) {
          setSP(userData).whenComplete(() {
            Get.offAll(HomeView());
          });
        } else {
          //alertDialog(context, "Error: User Not Found");
          Get.snackbar("Ops", "User not found");
        }
      }).catchError((error) {
        print(error);
        //alertDialog(context, "Error: Login Fail");
        Get.snackbar("Ops", "Login fail");
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
