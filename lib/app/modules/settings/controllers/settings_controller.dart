import 'package:get/get.dart';

class SettingsController extends GetxController {
  RxBool darkMode = false.obs;

  setDarkMode(bool v) {
    darkMode.value = v;
  }
}
