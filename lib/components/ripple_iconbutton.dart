import 'package:flutter/material.dart';

class RippleIconbutton extends StatelessWidget {
  final VoidCallback onTap;
  final IconData icon;
  const RippleIconbutton({super.key, required this.onTap, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 3,
      color: Colors.lightBlue,
      borderRadius: BorderRadius.circular(50),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(50),
        splashColor: Colors.blue,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(icon, size: 25, color: Colors.white),
        ),
      ),
    );
  }
}
