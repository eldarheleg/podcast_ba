// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';

// Project imports:
import '../controllers/registration_controller.dart';

class RegistrationView extends GetView<RegistrationController> {
  const RegistrationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    RegistrationController controller = Get.put(RegistrationController());
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Registration',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'First name',
              ),
              onChanged: (value) => controller.ifname.value = value,
              // controller: controller.fname,
            ),
            const SizedBox(height: 10),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Last name',
              ),
              onChanged: (value) => controller.ilname.value = value,
              // controller: controller.lname,
            ),
            const SizedBox(height: 10),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
              onChanged: (value) => controller.iemail.value = value,
              // controller: controller.email,
            ),
            const SizedBox(height: 10),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
              onChanged: (value) => controller.ipassword.value = value,
              // controller: controller.password,
            ),
            const SizedBox(height: 10),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Password Confirmation',
              ),
              obscureText: true,
              onChanged: (value) => controller.ipasswordConfirm.value = value,
              // controller: controller.password,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              child: Text('Register'),
              onPressed: () => controller.signUp(),
            ),
          ],
        ),
      ),
    );
  }
}
