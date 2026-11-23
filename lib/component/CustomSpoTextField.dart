import 'package:flutter/material.dart';
import 'package:pas/component/CustomeTheme.dart';

/// Input ala Spotify: label tebal di atas, border abu-abu tipis,
/// border putih saat fokus.
class CustomSpoTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final bool obscureText;

  const CustomSpoTextField({
    super.key,
    required this.label,
    required this.controller,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          obscureText: obscureText,
          cursorColor: Colors.white,
          style: const TextStyle(color: Colors.white, fontSize: 16),
          decoration: InputDecoration(
            contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: const BorderSide(color: CustomeTheme.border),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: const BorderSide(color: Colors.white, width: 2),
            ),
          ),
        ),
      ],
    );
  }
}