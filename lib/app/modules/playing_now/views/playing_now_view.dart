import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/playing_now_controller.dart';

class PlayingNowView extends GetView<PlayingNowController> {
  const PlayingNowView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PlayingNowView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'PlayingNowView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
