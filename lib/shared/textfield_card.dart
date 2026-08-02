import 'package:flutter/material.dart';


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
      controller: tfController ,
      keyboardType: keyboardTypes,
      decoration:  InputDecoration(
        labelText: labelTexts,
        prefixIcon: Icon(prefixIcon),
        border: OutlineInputBorder(),
      ),
    );
  }
}
