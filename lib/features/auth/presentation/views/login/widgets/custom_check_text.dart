import 'package:e_commerce_app/core/constant/constant.dart';
import 'package:flutter/material.dart';

class CustomCheckText extends StatelessWidget {
  const CustomCheckText({super.key, required this.text, required this.onTap});
  final String text;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 18,
          color: Color(0xff2D9F5D),
          fontWeight: FontWeight.w700,
          fontFamily: fontFamily,
        ),
      ),
    );
  }
}
