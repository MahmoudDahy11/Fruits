import 'package:flutter/material.dart';

import '../../../../../core/constant/constant.dart';

class CustomTextFieldProduct extends StatelessWidget {
  const CustomTextFieldProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: .1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: 'ابحث عن ...',
          prefixIcon: Icon(Icons.search, color: Color(greenColor), size: 35),
          suffixIcon: Icon(Icons.tune, color: Colors.grey, size: 35),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: Color(greenColor)),
          ),
        ),
      ),
    );
  }
}
