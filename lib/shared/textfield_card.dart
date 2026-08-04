import 'package:flutter/material.dart';

import '../theme.dart';

class TextFieldCard extends StatelessWidget {
  const TextFieldCard({
    super.key,
    required this.tfController,
    required this.labelTexts,
    required this.prefixIcon,
    required this.keyboardTypes,
  });

  final TextEditingController tfController;
  final TextInputType keyboardTypes;
  final String labelTexts;
  final IconData prefixIcon;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: tfController,
      keyboardType: keyboardTypes,
      decoration: InputDecoration(
        labelText: labelTexts,
        prefixIcon: Icon(prefixIcon),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.textColor.withOpacity(0.3)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.primaryColor, width: 2),
        ),
        labelStyle: const TextStyle(color: Colors.white70),
        floatingLabelStyle: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
