import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pas/Controller/loginController.dart';
import 'package:pas/component/CustomSpoButton.dart';
import 'package:pas/component/CustomeTheme.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final loginController = Get.isRegistered<LoginController>()
        ? Get.find<LoginController>()
        : null;
    final rawName = loginController?.txtUsername.text.trim() ?? '';
    final username = rawName.isNotEmpty ? rawName : "User";


    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: CustomeTheme.background,
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: CustomeTheme.green,
                    child: Text(
                      username[0].toUpperCase(),
                      style: const TextStyle(
                        fontSize: 44,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    username,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    "user123@gmail.com",
                    style: TextStyle(
                      fontSize: 14,
                      color: CustomeTheme.textSecondary,
                    ),
                  ),
                  const SizedBox(height: 32),

                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Tentang",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: CustomeTheme.surface,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Ini bionya",
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),

                  CustomSpoButton(
                    label: "Keluar",
                    onTap: () {},
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