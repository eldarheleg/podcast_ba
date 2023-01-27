import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:podcast_ba/app/common/colors.dart';
import 'package:podcast_ba/app/data/models/genre.dart';

import '../controllers/categories_controller.dart';

class CategoriesView extends GetView<CategoriesController> {
  CategoriesView({Key? key}) : super(key: key);
  CategoriesController categoriesController = Get.put(CategoriesController());
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: whiteColor,
        title: const Text('Categories',style: TextStyle(color: primaryColor),),
        centerTitle: true,
      ),
      body: Obx(
        () => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: controller.genres.isEmpty
                    ? const Center(
                        child: CircularProgressIndicator(
                          color: primaryColor,
                        ),
                      )
                    : ListView.builder(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 5),
                        physics: const BouncingScrollPhysics(),
                        itemCount: controller.genres.length,
                        itemBuilder: (context, index) {
                          Genre genre = controller.genres[index];
                          return Card(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(color: primaryColor),
                                borderRadius: BorderRadius.circular(20)),
                            elevation: 10,
                            child: Container(
                              alignment: Alignment.center,
                              height: 120,
                              child:
                                   Container(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            genre.name!,
                                            style: const TextStyle(
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                              ),
                          );
                        },
                      ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
