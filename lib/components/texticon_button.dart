import 'package:flutter/material.dart';

class TextIconButton extends StatelessWidget {
  const TextIconButton(
      {super.key,
      required this.onPress,
      required this.label,
      required this.icon});

  final VoidCallback onPress;
  final String label;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed:
        onPress,

      style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(Colors.white),
          foregroundColor: WidgetStatePropertyAll(Colors.blue)),
      iconAlignment: IconAlignment.end,
      icon: Icon(
        icon,
        color: Colors.blue,
        size: 24.0,
      ),
      label: Text(label),
    );
  }
}
