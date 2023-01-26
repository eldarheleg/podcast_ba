import 'package:get/get.dart';

import '../modules/about/bindings/about_binding.dart';
import '../modules/about/views/about_view.dart';
import '../modules/categories/bindings/categories_binding.dart';
import '../modules/categories/views/categories_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/navigation/bindings/navigation_binding.dart';
import '../modules/navigation/views/navigation_view.dart';
import '../modules/playing_now/bindings/playing_now_binding.dart';
import '../modules/playing_now/views/playing_now_view.dart';
import '../modules/playlists/bindings/playlists_binding.dart';
import '../modules/playlists/views/playlists_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/registration/bindings/registration_binding.dart';
import '../modules/registration/views/registration_view.dart';
import '../modules/settings/bindings/settings_binding.dart';
import '../modules/settings/views/settings_view.dart';
import '../modules/welcome/bindings/welcome_binding.dart';
import '../modules/welcome/views/welcome_view.dart';

// Package imports:

// Project imports:
part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.WELCOME;
  static const NAVIGATION = Routes.NAVIGATION;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTRATION,
      page: () => const RegistrationView(),
      binding: RegistrationBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.WELCOME,
      page: () => const WelcomeView(),
      binding: WelcomeBinding(),
    ),
    GetPage(
      name: _Paths.CATEGORIES,
      page: () => const CategoriesView(),
      binding: CategoriesBinding(),
    ),
    GetPage(
      name: _Paths.PLAYLISTS,
      page: () => const PlaylistsView(),
      binding: PlaylistsBinding(),
    ),
    GetPage(
      name: _Paths.NAVIGATION,
      page: () => NavigationView(),
      binding: NavigationBinding(),
    ),
    GetPage(
      name: _Paths.PLAYING_NOW,
      page: () => const PlayingNowView(),
      binding: PlayingNowBinding(),
    ),
    GetPage(
      name: _Paths.SETTINGS,
      page: () => SettingsView(),
      binding: SettingsBinding(),
    ),
    GetPage(
      name: _Paths.ABOUT,
      page: () => const AboutView(),
      binding: AboutBinding(),
    ),
  ];
}
