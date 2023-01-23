import 'package:get/get.dart';

import '../controllers/playing_now_controller.dart';

class PlayingNowBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PlayingNowController>(
      () => PlayingNowController(),
    );
  }
}
