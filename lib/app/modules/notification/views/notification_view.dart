import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:podcast_ba/app/common/colors.dart';

import '../controllers/notification_controller.dart';

class NotificationView extends GetView<NotificationController> {
  const NotificationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    NotificationController notificationController =
        Get.put(NotificationController());
    return Scaffold(
        appBar: AppBar(
          title: const Text('Notifications'),
          elevation: 0,
          backgroundColor: primaryColor,
          centerTitle: true,
        ),
        body: ListView.separated(
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(height: 5);
          },
          padding: const EdgeInsets.all(10),
          physics: const BouncingScrollPhysics(),
          itemCount: notificationController.notifications.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: CircleAvatar(
                backgroundColor: primaryColor,
                child: Text(
                  '${index + 1}',
                  style: const TextStyle(color: whiteColor),
                ),
              ),
              shape: RoundedRectangleBorder(
                side: const BorderSide(width: 5, color: primaryColor),
                borderRadius: BorderRadius.circular(50), //<-- SEE HERE
              ),
              title: Text(notificationController.notifications[index]),
            );
          },
        ));
  }
}
