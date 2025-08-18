import 'package:e_commerce_app/core/constant/assets.dart';
import 'package:e_commerce_app/core/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'widgets/custom_list_tile_info.dart';
import 'widgets/custom_shop_botton.dart';
import 'widgets/custom_text_field_product.dart';

class HomeViewProduct extends StatelessWidget {
  const HomeViewProduct({super.key});
  static String id = 'Home_product_view';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            children: [
              const CustomListTileInfo(),
              const SizedBox(height: 30),
              const CustomTextFieldProduct(),
              const SizedBox(height: 30),
              Row(
                children: [
                  Stack(
                    children: [
                      SvgPicture.asset(
                        Assets.imagesFeatureItemBackground,
                        height: MediaQuery.sizeOf(context).height * .25,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 16.0,
                          horizontal: 38,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'عروض العيد',
                              style: TextStyle(
                                fontFamily: 'Cairo',
                                fontSize: 18,
                                color: Color(0XFFD3E4D1),
                              ),
                            ),
                            const SizedBox(height: 30),
                            Text(
                              'خصم 25%',
                              style: TextStyle(
                                fontFamily: 'Cairo',
                                fontSize: 30,
                                color: Color(backGroundColor),
                              ),
                            ),
                            const SizedBox(height: 30),
                            CustomShopBotton(),
                          ],
                        ),
                      ),
                      SvgPicture.asset(Assets.imagesFruits),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
