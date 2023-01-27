import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:podcast_ba/app/common/colors.dart';
import 'package:podcast_ba/app/common/images.dart';
import 'package:podcast_ba/app/modules/categories/controllers/categories_controller.dart';
import 'package:podcast_ba/app/modules/categories/views/categories_view.dart';
import 'package:podcast_ba/app/modules/home/views/home_view.dart';
import 'package:podcast_ba/app/modules/playlists/views/playlists_view.dart';
import 'package:podcast_ba/app/modules/profile/views/profile_view.dart';

import '../controllers/navigation_controller.dart';

class NavigationView extends StatelessWidget {
  NavigationView({Key? key}) : super(key: key);
  static final List<Widget> _pages = [
    HomeView(),
    CategoriesView(),
    const PlaylistsView(),
    ProfileView()
  ];
  NavigationController controller = Get.put(NavigationController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
          bottomNavigationBar: GetX<NavigationController>(
            init: controller, 
            builder: (_) {
              return BottomNavigationBar(
                iconSize: 35,
                selectedItemColor: primaryColor,
                unselectedItemColor: inactiveColor,
                currentIndex: _.currentIndex.value,
                onTap: (index) => _.currentIndex.value = index,
                items: const [
                  BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage(homeIcn),
                      //size: 30,
                    ),
                    label: "Home",
                  ),
                  BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage(categoriesIcn),
                      //size: 30,
                    ),
                    label: "Categories",
                  ),
                  BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage(playlistIcn),
                      //size: 50,
                    ),
                    label: "Playlist",
                  ),
                  BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage(profileIcn),
                      //size: 50,
                    ),
                    label: "Profile",
                  ),
                ],
              );
            },
          ),
          body: _pages[controller.currentIndex.value]),
    );
  }
}
