import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/constant/assets.dart';

class ProductImageCart extends StatelessWidget {
  const ProductImageCart({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset(
          Assets.backGrounsvg,
          width: MediaQuery.sizeOf(context).width,
        ),
        Positioned(
          right: 100,
          bottom: 100,
          child: Image.network(
            image,
            height: 200,
            width: 200,
            fit: BoxFit.contain,
          ),
        ),
        Positioned(
          top: 40,
          right: 20,
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: Icon(Icons.arrow_back_ios, color: Colors.black),
            ),
          ),
        ),
      ],
    );
  }
}
