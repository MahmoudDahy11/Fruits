import 'package:e_commerce_app/core/constant/constant.dart';
import 'package:flutter/material.dart';

import '../../features/auth/presentation/views/login/widgets/custom_check_text.dart';

class CustomCreateAccountText extends StatelessWidget {
  const CustomCreateAccountText({
    super.key,
    required this.text1,
    required this.text2,
    required this.onTap,
  });
  final String text1;
  final String text2;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FittedBox(
          fit: BoxFit.scaleDown,
          alignment: Alignment.centerLeft,
          child: Text(
            text1,
            style: TextStyle(
              fontSize: 20,
              color: Colors.grey,
              fontWeight: FontWeight.w700,
              fontFamily: fontFamily,
            ),
          ),
        ),
        GestureDetector(
          onTap: onTap,
          child: FittedBox(
            fit: BoxFit.scaleDown,
            alignment: Alignment.centerLeft,
            child: CustomCheckText(text: text2, onTap: onTap),
          ),
        ),
      ],
    );
  }
}
