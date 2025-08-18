import 'package:e_commerce_app/core/constant/constant.dart';
import 'package:flutter/material.dart';

class CustomBotton extends StatelessWidget {
const  CustomBotton({super.key, required this.text,required this.onTap});
  final String text;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.sizeOf(context).width,
        decoration: BoxDecoration(
          color: Color(0XFF1B5D36),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontFamily: fontFamily,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
