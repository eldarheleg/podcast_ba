import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    LoginController controller = Get.put(LoginController());
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Login',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Email',
                  ),
                  controller: controller.emailController,
                ),
            const SizedBox(height: 10),
            TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Password',
                  ),
                  obscureText: true,
                  controller: controller.passController,
                ),
            const SizedBox(height: 20),
            ElevatedButton(
              child: Text('Login'),
              onPressed: () => controller.login(),
            ),
          ],
        ),
      ),
    );
  }
}
