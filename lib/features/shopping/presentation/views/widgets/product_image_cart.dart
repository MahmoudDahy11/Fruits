import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/constant/assets.dart';
import '../home.dart';

class ProductImageCart extends StatelessWidget {
  const ProductImageCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset(
          Assets.backGrounsvg,
          width: MediaQuery.sizeOf(context).width,
        ),
        Positioned(
          right: 80,
          bottom: 100,
          child: SvgPicture.asset(Assets.imagesPageview1mage),
        ),
        Positioned(
          top: 40,
          right: 20,
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pushReplacementNamed(HomeView.id);
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
