import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../core/constant/constant.dart';

class CustomTextFieldProduct extends StatelessWidget {

  const CustomTextFieldProduct({super.key, this.onChanged});

  final ValueChanged<String>? onChanged; 
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
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
        onChanged: onChanged, // السيرش يشتغل هنا
        decoration: InputDecoration(
          hintText: 'ابحث عن ...',
          prefixIcon: Icon(
            CupertinoIcons.search,
            color: Color(greenColor),
            size: 30,
          ),
          suffixIcon: const Icon(Icons.tune, color: Colors.grey, size: 28),
          enabledBorder: const OutlineInputBorder(
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
