import 'package:flutter/material.dart';

class DefaultTextfield extends StatelessWidget {

  final String label;
  final Function(String value) onChanged;
  final IconData icon;
  final dynamic error;
  final bool obscureText;

  const DefaultTextfield({
    super.key,
    required this.label,
    required this.onChanged,
    required this.icon,
    this.error,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) {
        onChanged(value);
      },
      decoration: InputDecoration(
        label: Text(label),
        labelStyle: const TextStyle(
          color: Colors.white,
        ),
        errorText: error,
        suffixIcon: Icon(
          icon,
          color: Colors.white,
        )
      ),
      style: const TextStyle(
        color: Colors.white,
      ),
      obscureText: obscureText,
    );
  }
}
