import 'package:flutter/material.dart';
import 'package:pas/component/CustomeTheme.dart';

/// Tombol hijau berbentuk pil, teks hitam tebal.
/// Kalau [isLoading] true, tampil spinner dan tombol tidak bisa ditekan.
class CustomSpoButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final bool isLoading;

  const CustomSpoButton({
    super.key,
    required this.label,
    required this.onTap,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton(
        onPressed: isLoading ? null : onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: CustomeTheme.green,
          foregroundColor: Colors.black,
          // supaya saat loading warna tombol tidak jadi abu-abu
          disabledBackgroundColor: CustomeTheme.green,
          disabledForegroundColor: Colors.black,
          elevation: 0,
          shape: const StadiumBorder(),
        ),
        child: isLoading
            ? const SizedBox(
          height: 22,
          width: 22,
          child: CircularProgressIndicator(
            strokeWidth: 2.5,
            color: Colors.black,
          ),
        )
            : Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}