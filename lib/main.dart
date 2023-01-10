// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Project imports:
import 'app/routes/app_pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var email = prefs.getString('email');
  //print(email);
  runApp(
    GetMaterialApp(
      theme: ThemeData(fontFamily: 'Lato'),
      debugShowCheckedModeBanner: false,
      initialRoute: email == null ? AppPages.INITIAL:AppPages.HOME,
      getPages: AppPages.routes,
    ),
  );
}
