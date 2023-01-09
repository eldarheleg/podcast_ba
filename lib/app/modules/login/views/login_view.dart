import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:podcast_ba/app/common/colors.dart';
import 'package:podcast_ba/app/common/images.dart';
import 'package:podcast_ba/app/common/styles.dart';
import 'package:podcast_ba/app/modules/widgets/rounded_button.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../controllers/login_controller.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LoginController controller = Get.put(LoginController());
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(loginImage,scale: 0.5,),
              SizedBox(height: 20,),
              const Text(
                'Log in',
                style: TextStyle(
                  color: primaryColor,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
                
              ),
              const SizedBox(height: 40),
              TextFormField(
                style: largeText,
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: primaryColor,width: 2,strokeAlign: StrokeAlign.inside)),
                  hintText: 'Email',
                  hintStyle: hintText
                ),
                controller: controller.emailController,
              ),
              const SizedBox(height: 10),
              TextFormField(
                style: largeText,
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: primaryColor,width: 2,strokeAlign: StrokeAlign.inside)),
                  hintText: 'Password',
                  hintStyle: hintText
                ),
                obscureText: true,
                controller: controller.passController,
              ),
              const SizedBox(height: 50),
              ElevatedButton(
                style: ElevatedButton.styleFrom(fixedSize: Size(width, height*0.07),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),backgroundColor: primaryColor),
                child: const Text('Log in', style: largeText,),
                onPressed: () => controller.login(),
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}
