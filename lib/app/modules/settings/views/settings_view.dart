import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:podcast_ba/app/common/colors.dart';
import 'package:podcast_ba/app/modules/about/views/about_view.dart';

import '../controllers/settings_controller.dart';

class SettingsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final settingsController = Get.put(SettingsController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        elevation: 0,
        backgroundColor: primaryColor,
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          Obx(() => SwitchListTile(
                title: const Text('Dark mode'),
                value: settingsController.darkMode.value,
                onChanged: (value) {
                  settingsController.setDarkMode(value);
                },
              )),
          ListTile(
            title: const Text('About'),
            onTap: () {
              Get.to(() => const AboutView(),transition: Transition.rightToLeft);
            },
          ),
        ],
      ),
    );
  }
}
