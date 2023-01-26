// Package imports:
import 'package:get/get.dart';
import 'package:podcast_ba/app/data/db/db_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileController extends GetxController {
  RxString fname = ''.obs;
  RxString lname = ''.obs;

  @override
  void onInit() {
    // TODO: implement onInit
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
