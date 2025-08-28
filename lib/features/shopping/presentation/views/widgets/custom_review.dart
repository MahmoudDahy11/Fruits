
import 'package:flutter/material.dart';

class CustomReview extends StatelessWidget {
  const CustomReview({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.star, color: Color(0xffFFC529)),
        RichText(
          text: TextSpan(
            text: '   4.5   ',
            style: const TextStyle(
              fontFamily: 'Cairo',
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
            children: const [
              TextSpan(
                text: '(+30)   ',
                style: TextStyle(
                  fontFamily: 'Cairo',
                  color: Colors.grey,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              TextSpan(
                text: 'المراجعه',
                style: TextStyle(
                  fontFamily: 'Cairo',
                  color: Color(0xff1B5E37),
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  decoration: TextDecoration.underline,
                  decorationColor: Color(0xff1B5E37),
                  decorationThickness: 2,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
