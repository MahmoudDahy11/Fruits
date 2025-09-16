import 'package:e_commerce_app/core/constant/constant.dart';
import 'package:flutter/material.dart';

class NumberOfProduct extends StatelessWidget {
  const NumberOfProduct({super.key, required this.count});
  final int count;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(color: Color(0xffEBF9F1)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Text(
          "لديك $count منتجات في سله التسوق",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'fontFamily',
            fontWeight: FontWeight.normal,
            fontSize: 18,
            color: Color(primaryColor),
          ),
        ),
      ),
    );
  }
}
