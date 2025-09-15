import 'package:flutter/material.dart';

class CustomReview extends StatelessWidget {
  const CustomReview({
    super.key,
    required this.rating,
    required this.reviewCount,
  });
  final String rating;
  final String reviewCount;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.star, color: Color(0xffFFC529)),
        RichText(
          text: TextSpan(
            text: '   $rating   ',
            style: const TextStyle(
              fontFamily: 'Cairo',
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
            children: [
              TextSpan(
                text: '($reviewCount)   ',
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
