import 'package:flutter/material.dart';

class BottomCard extends StatelessWidget {
  const BottomCard({super.key, required this.mediaSize, required this.child});

  final Size mediaSize;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: mediaSize.width,
      child: Card(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            )
        ),
        child: child,
      ),

    );
  }
}
