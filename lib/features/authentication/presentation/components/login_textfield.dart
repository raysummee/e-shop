import 'package:flutter/material.dart';

class LoginTextField extends StatelessWidget {
  const LoginTextField({
    Key? key,
    required this.hint,
    this.onChanged,
    this.error,
  }) : super(key: key);
  final String hint;
  final Function(String)? onChanged;
  final String? error;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 19),
      child: TextField(
        onChanged: onChanged,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400
        ),
        decoration: InputDecoration(
          hintText: hint,
          filled: true,
          errorText: error,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          
        ),
      ),
    );
  }
}
