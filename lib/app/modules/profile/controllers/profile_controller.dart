// Package imports:
import 'dart:math';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileController extends GetxController {
  RxString fname = ''.obs;
  RxString lname = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchName();
  }

  Future<void> fetchName() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      fname.value = prefs.getString('firstname')!;
      lname.value = prefs.getString('lastname')!;
    } catch (e) {
      print(e);
    }
  }
}
