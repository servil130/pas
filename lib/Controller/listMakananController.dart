import 'package:flutter/material.dart';
import 'package:pas/Model/modelMakanan.dart';
import 'package:pas/routes.dart';
import 'package:get/get.dart';

class ListMakananController extends GetxController {
  final dataMakanan = <ModelMakanan>[
    ModelMakanan(
      namaMakanan: "Nasi Goreng Spesial",
      harga: "Rp25.000",
      deskripsi: "Nasi goreng bumbu rempah dengan telur mata sapi,ayam suwir, dan kerupuk.",
      gambarPath: "assets/image/nasgor.jpe",
    ),
    ModelMakanan(
      namaMakanan: "Ayam Bakar Madu ",
      harga: "Rp30.000",
      deskripsi:
      "Ayam bakar olesan madu murni lengkap dengan sambal terasi dan lalapan.",
      gambarPath: "assets/image/satumadu.jpe",
    ),
   ModelMakanan(
      namaMakanan: "Sate Ayam Madura",
      harga: "Rp28.000",
      deskripsi: "10 tusuk sate ayam daging pilihan dengan siraman bumbu kacang kental.",
      gambarPath: "assets/image/satumadura.jpe",
    ),
    ModelMakanan(
      namaMakanan: "Mie Ayam Bakso",
      harga: "Rp20.000 ",
      deskripsi: "Mie kenyal dengan topping ayam kecap, sawi hijau, dan 2 butir bakso sapi.",
      gambarPath: "assets/image/mieayam.jpe",
    ),
    ModelMakanan(
      namaMakanan: "Es Teh Manis Jumbo",
      harga: "Rp8.000",
      deskripsi:
      "Mie kenyal dengan topping ayam kecap, sawi hijau, dan 2 butir bakso sapi.",
      gambarPath: "assets/image/esteh.jpe",
    ),
  ].obs;


  ColorScheme scheme(BuildContext context) => Theme.of(context).colorScheme;

  TextTheme textTheme(BuildContext context) => Theme.of(context).textTheme;

  TextStyle? appBarTitleStyle(BuildContext context) =>
      textTheme(context).titleLarge?.copyWith(
        fontWeight: FontWeight.bold,
        color: scheme(context).onPrimary,
      );


  void hapus(int index) {
    dataMakanan.removeAt(index);
  }


  void bukaDetail(int index) {
    Get.toNamed(Routes.detail_makanan, arguments: dataMakanan[index]);
  }
}