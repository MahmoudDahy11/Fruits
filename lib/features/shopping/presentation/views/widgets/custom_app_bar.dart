
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "السلة",
      style: TextStyle(
        fontFamily: 'fontFamily',
        fontWeight: FontWeight.bold,
        fontSize: 24,
      ),
    );
  }
}
