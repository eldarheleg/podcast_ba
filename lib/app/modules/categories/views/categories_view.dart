import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:podcast_ba/app/common/colors.dart';

import '../controllers/categories_controller.dart';

class CategoriesView extends GetView<CategoriesController> {
  const CategoriesView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: whiteColor,
        title: const Text('CategoriesView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'CategoriesView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
