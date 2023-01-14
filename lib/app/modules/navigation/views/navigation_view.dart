import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:podcast_ba/app/common/colors.dart';
import 'package:podcast_ba/app/modules/categories/views/categories_view.dart';
import 'package:podcast_ba/app/modules/home/views/home_view.dart';
import 'package:podcast_ba/app/modules/playlists/views/playlists_view.dart';
import 'package:podcast_ba/app/modules/profile/views/profile_view.dart';

import '../controllers/navigation_controller.dart';

class NavigationView extends GetView<NavigationController> {
  const NavigationView({Key? key}) : super(key: key);
  static final List<Widget> _pages = [
    const HomeView(),
    const CategoriesView(),
    const PlaylistsView(),
    const ProfileView()
  ];
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
          bottomNavigationBar: GetX<NavigationController>(
            init: NavigationController(),
            builder: (_) {
              return BottomNavigationBar(
                selectedItemColor: primaryColor,
                unselectedItemColor: inactiveColor,
                currentIndex: _.currentIndex.value,
                onTap: (index) => _.currentIndex.value = index,
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: "Home",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.category),
                    label: "Categories",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.playlist_play),
                    label: "Playlist",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person),
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
