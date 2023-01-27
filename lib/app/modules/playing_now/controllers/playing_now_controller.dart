import 'package:get/get.dart';

class PlayingNowController extends GetxController {
  RxInt selectedIndex = 0.obs;
  
  setIndex(int index) {
    selectedIndex.value = index;
  }
}
