import 'package:flutter/material.dart';
import 'package:flutter_sha/shared/theme.dart';

class CustomFormField extends StatelessWidget {
  final String label;
  final bool obscureText;
  final TextEditingController? controller;
  const CustomFormField({
    super.key,
    required this.label,
    this.obscureText = false,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: blackTextStyle.copyWith(fontSize: 14, fontWeight: medium),
        ),
        const SizedBox(height: 8),
        TextFormField(
          obscureText: obscureText,
          controller: controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
            contentPadding: const EdgeInsets.all(12),
          ),
        ),
      ],
    );
  }
}
