import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/playlists_controller.dart';

class PlaylistsView extends GetView<PlaylistsController> {
  const PlaylistsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PlaylistsView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'PlaylistsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
