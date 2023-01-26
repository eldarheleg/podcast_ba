// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';
import 'package:podcast_ba/app/common/colors.dart';

// Project imports:
import '../controllers/profile_controller.dart';

class ProfileView extends StatelessWidget {
  ProfileView({Key? key}) : super(key: key);

  ProfileController controller = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    //controller.fetchName();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(color: blackColor),
        ),
        elevation: 0,
        backgroundColor: whiteColor,
        centerTitle: true,
      ),
      body: Center(
        child: Text(controller.fname.value),
      ),
    );
  }
}
