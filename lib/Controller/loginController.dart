import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:pas/model/loginModel.dart';
import 'package:pas/routes.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../Page/mainMenu.dart';

class LoginController extends GetxController {
  TextEditingController txtUsername = TextEditingController();
  TextEditingController txtPassword = TextEditingController();

  var loginModel = Rxn<LoginModel>();
  var isLoading = false.obs;

  // Method hit API
  void login() async {
    if (txtUsername.text.toString().isEmpty ||
        txtPassword.text.toString().isEmpty) {
      Get.snackbar("error", "username dan password harus terisi");
    } else {
      try {
        isLoading.value = true; // tanda loading
        final url = Uri.parse("https://mediadwi.com/api/latihan/login");

        final response = await http.post(url, body: {
          "username": txtUsername.text.toString(),
          "password": txtPassword.text.toString(),
        });

        isLoading.value = false;
        if (response.statusCode == 200) {
          loginModel.value = loginModelFromJson(response.body);

          // ambil json message ke main menu
          final data = jsonDecode(response.body);
          if (data['status'] == true) {
            Get.snackbar(
                "Berhasil", loginModel.value?.message ?? "Login Berhasil");
                Get.offNamed(Routes.menu_page);
          } else {
            Get.snackbar("Gagal", loginModel.value?.message ?? "Login Gagal");
          }
        } else {
          Get.snackbar("Gagal", "Cek internet connection");
        }
      } catch (e) {
        isLoading.value = false;
        Get.snackbar("Gagal", e.toString());
      }
    }
  }

  @override
  void onClose() {
    txtUsername.dispose();
    txtPassword.dispose();
    super.onClose();
  }
}
