import 'package:flutter/material.dart';

class TextInputField extends StatelessWidget {
  const TextInputField({
    super.key,
    // required this.label,
    required this.hint,
    required this.leading,
    this.trailing,
    required  this.keyboardType,
    this.obscure,
    this.controller,
  });

  // final String label;
  final String hint;
  final Icon leading;
  final Icon? trailing;
  final TextInputType keyboardType;
  final bool? obscure;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    // TextEditingController controller = TextEditingController(); // Add a TextEditingController

    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          // labelText: label,
          prefixIcon: leading,
          hintText: hint,
          suffixIcon: trailing,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none
          ),
          // errorText: 'Please enter a valid email address',
        ),
        keyboardType: keyboardType,
        obscureText: obscure ?? false,
        validator: (value){
          if (value == null || value.isEmpty) {
            return 'Enter a valid $hint';
          }
          return null;
        },
      ),
    );
  }
}
