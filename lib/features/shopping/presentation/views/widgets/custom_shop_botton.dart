
import 'package:flutter/material.dart';

import '../../../../../core/constant/constant.dart';

class CustomShopBotton extends StatelessWidget {
  const CustomShopBotton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Color(backGroundColor),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 8),
          child: Text(
            'تسوق الان',
            style: TextStyle(
              color: Color(greenColor),
              fontSize: 24,
              fontFamily: "Cairo",
            ),
          ),
        ),
      ),
    );
  }
}
