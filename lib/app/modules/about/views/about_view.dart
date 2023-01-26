import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:podcast_ba/app/common/colors.dart';

import '../controllers/about_controller.dart';

class AboutView extends GetView<AboutController> {
  const AboutView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About',),
        elevation: 0,
        backgroundColor: primaryColor,
        centerTitle: true,
        
      ),
      body: const Center(
        child: Text(
          'About app dummy text',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
