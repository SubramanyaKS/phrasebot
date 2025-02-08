import 'package:flutter/material.dart';

class GradientBackground extends StatelessWidget {
  final Widget child;

  const GradientBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topLeft,
          colors: [
            Colors.black,
            Color(0xFF0000FF),
            Colors.black,

             // Electric Blue 0xFF0080FF
          ],
        ),
      ),
      child: child,
    );
  }
}
