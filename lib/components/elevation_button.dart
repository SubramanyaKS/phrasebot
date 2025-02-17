import 'package:flutter/material.dart';

class ElevationButton extends StatelessWidget {
  const ElevationButton(
      {super.key, required this.onPress, required this.title, required this.foregroundColor, required this.backgroundColor});
  final VoidCallback onPress;
  final String title;
  final Color foregroundColor;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      style: ElevatedButton.styleFrom(
        shape: const StadiumBorder(),
        foregroundColor: foregroundColor,
        backgroundColor: backgroundColor,
        elevation: 20,
        shadowColor: Colors.black,
        minimumSize: const Size.fromHeight(60),
      ),
      child: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      ),
    );
  }
}
