import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pas/controller/loginController.dart';
import 'package:pas/component/CustomSpoButton.dart';
import 'package:pas/component/CustomSpoTextField.dart';
import 'package:pas/component/CustomeTheme.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    // Halaman ini tanpa AppBar, jadi ikon status bar diatur di sini
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: CustomeTheme.background,
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    "Masuk",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 32,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 40),
                  CustomSpoTextField(
                    label: "Username",
                    controller: controller.txtUsername,
                  ),
                  const SizedBox(height: 20),
                  CustomSpoTextField(
                    label: "Password",
                    controller: controller.txtPassword,
                    obscureText: true,
                  ),
                  const SizedBox(height: 32),
                  Obx(
                        () => CustomSpoButton(
                      label: "Masuk",
                      isLoading: controller.isLoading.value,
                      onTap: controller.login,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}