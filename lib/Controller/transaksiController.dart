import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TransaksiController extends GetxController {
  final makanan = Get.arguments; // dikirim dari halaman detail
  final jumlahC = TextEditingController(text: '1');

  double get harga => double.tryParse(makanan.harga.toString()) ?? 0;

  String rupiah(double v) =>
      'Rp ${v.round().toString().replaceAllMapped(RegExp(r'\B(?=(\d{3})+(?!\d))'), (m) => '.')}';

  void bayar() {
    final jumlah = int.tryParse(jumlahC.text) ?? 0;
    if (jumlah < 1) {
      Get.snackbar('Gagal', 'Jumlah minimal 1');
      return;
    }

    final subtotal = harga * jumlah;
    final ppn = subtotal * 0.05;
    final total = subtotal + ppn;

    Get.dialog(
      AlertDialog(
        title: const Text('Rincian Pembayaran'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _baris('Subtotal', rupiah(subtotal)),
            _baris('PPN (5%)', rupiah(ppn)),
            const Divider(),
            _baris('Total Bayar', rupiah(total), tebal: true),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Get.back(), child: const Text('Tutup')),
        ],
      ),
    );
  }

  Widget _baris(String label, String nilai, {bool tebal = false}) {
    final style =
    TextStyle(fontWeight: tebal ? FontWeight.bold : FontWeight.normal);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text(label, style: style), Text(nilai, style: style)],
      ),
    );
  }

  @override
  void onClose() {
    jumlahC.dispose();
    super.onClose();
  }
}