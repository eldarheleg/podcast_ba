import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';
import 'package:podcast_ba/app/data/models/podcast.dart';
import 'package:podcast_ba/app/modules/home/controllers/home_controller.dart';

class PlayerController extends GetxController {
  final AudioPlayer _advancedPlayer = AudioPlayer();
  final HomeController homeController = Get.put(HomeController());
  late var streams = homeController.bestPodcasts;
  late RxString url = streams[currentStreamIndex.value].website!.obs;
  final RxBool _isPlaying = false.obs;
  bool get isPlaying => _isPlaying.value;

  Rx<Duration> duration = const Duration(seconds: 0).obs;
  Rx<Duration> position = const Duration(seconds: 0).obs;
  final Rx<int> currentStreamIndex = 0.obs;
  final Rx<PlayerState> playState = PlayerState.stopped.obs;

  @override
  void onInit() {
    super.onInit();
    _advancedPlayer.setSourceUrl(url.value);
    _advancedPlayer.onDurationChanged.listen((d) => duration.value = d);
    _advancedPlayer.onPositionChanged.listen((p) => position.value = p);
    _advancedPlayer.onPlayerStateChanged
        .listen((PlayerState state) => playState.value = state);
    _advancedPlayer.onPlayerComplete
        .listen((event) => position.value = duration.value);
  }

  // //play
  // Future<void> smartPlay() async {
  //   if (playState.value == PlayerState.playing) {
  //     pause();
  //   } else {
  //     resume();
  //   }
  // }

  // Future<void> play() async {
  //   stop();
  //   resume();
  // }
  void play() async {
    await _advancedPlayer.play(UrlSource(url.value));
    _isPlaying.value = true;
  }

  void pause() async {
    await _advancedPlayer.pause();
    _isPlaying.value = false;
  }

  //play
  Future<void> resume() async {
    var result = await _advancedPlayer.play(UrlSource(url.value));
    //if (result as int == 1) ; //success
  }

  // //pause
  // Future<void> pause() async {
  //   var result = await _advancedPlayer.pause();
  //   //if (result as int == 1) ; //success
  // }

  //stop
  Future<void> stop() async {
    var result = await _advancedPlayer.stop();
    if (result as int == 1) {
      position.value = Duration(seconds: 0);
    }
  }

  void next() {
    if (currentStreamIndex.value + 1 != streams.length) {
      currentStreamIndex.value++;
    }
    play();
  }

  void back() {
    if (currentStreamIndex.value - 1 != -1) currentStreamIndex.value--;
    play();
  }

  set setPositionValue(double value) =>
      _advancedPlayer.seek(Duration(seconds: value.toInt()));
}
