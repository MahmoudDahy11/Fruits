
import 'package:flutter/material.dart';

class CustomTextSalary extends StatelessWidget {
  const CustomTextSalary({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: const TextStyle(fontSize: 24, fontFamily: 'Cairo'),
        children: const [
          TextSpan(
            text: '20 ',
            style: TextStyle(
              color: Color(0xFFF9A825),
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: 'جنية ',
            style: TextStyle(
              color: Color(0xFFF9A825),
              fontWeight: FontWeight.normal,
            ),
          ),
          TextSpan(
            text: '/ الكيلو',
            style: TextStyle(
              color: Color(0xFFFFE082),
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
