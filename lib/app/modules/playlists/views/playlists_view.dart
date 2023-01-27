import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:podcast_ba/app/common/colors.dart';

import '../controllers/playlists_controller.dart';

class PlaylistsView extends GetView<PlaylistsController> {
  const PlaylistsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: whiteColor,
        title: const Text('PlaylistsView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'PlaylistsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
