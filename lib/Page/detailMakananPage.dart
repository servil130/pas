import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas/Controller/detailMakananController.dart';
import 'package:pas/Routes.dart';

class DetailMakananPage extends StatelessWidget {
  DetailMakananPage({super.key});

  final controller = Get.put(DetailMakananController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: controller.scheme(context).primary,
        foregroundColor: controller.scheme(context).onPrimary,
        title: Text(
          "Detail Makanan",
          style: controller.appBarTitleStyle(context),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(28),
                        child: Image.asset(
                          controller.makanan.gambarPath,
                          height: 240,
                          width: double.infinity,
                          fit: BoxFit.contain,
                          errorBuilder: (context, error, stackTrace) =>
                              Container(
                                height: 240,
                                width: double.infinity,
                                color: controller.scheme(context).primaryContainer,
                                child: Icon(
                                  Icons.restaurant_rounded,
                                  size: 56,
                                  color: controller.scheme(context).primary,
                                ),
                              ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      Text(
                        controller.makanan.namaMakanan,
                        textAlign: TextAlign.center,
                        style: controller
                            .textTheme(context)
                            .headlineMedium
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "Rp ${controller.makanan.harga}",
                        textAlign: TextAlign.center,
                        style: controller.textTheme(context).titleLarge?.copyWith(
                          color: controller.scheme(context).primary,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 24),
                      Text(
                        "DESKRIPSI",
                        textAlign: TextAlign.center,
                        style: controller.labelStyle(context),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        controller.makanan.deskripsi,
                        textAlign: TextAlign.center,
                        style: controller.bodyStyle(context),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: 52,
                child: ElevatedButton.icon(
                  onPressed: () => Get.toNamed(
                    Routes.transaksi,
                    arguments: controller.makanan,
                  ),
                  icon: const Icon(Icons.shopping_cart_rounded),
                  label: const Text("Beli"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: controller.scheme(context).primary,
                    foregroundColor: controller.scheme(context).onPrimary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}