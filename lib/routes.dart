import 'package:get/get.dart';
import 'package:pas/Page/mainMenu.dart';
import 'package:pas/Page/loginPage.dart';
import 'package:pas/Page/detailMakananPage.dart';
import 'package:pas/Page/listMakananPage.dart';
import 'package:pas/Page/transaksiPage.dart';

class Routes {
  static const String login = "/login";
  static const String menu_page = "/main_menu";
  static const String detail_makanan = "/detail_makanan";
  static const String list_makanan = "/list_makanan";
  static const String transaksi = "/transaksi";

  static final myPages = [
    GetPage(name: login, page: () => LoginPage()),
    GetPage(name: menu_page, page: () => MainMenu()),
    GetPage(name: detail_makanan, page: () => DetailMakananPage()),
    GetPage(name: list_makanan, page: () => ListMakananPage()),
    GetPage(name: transaksi, page: () => TransaksiPage()),
  ];
}