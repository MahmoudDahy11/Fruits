import 'package:e_commerce_app/core/constant/assets.dart';
import 'package:e_commerce_app/core/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
              SizedBox(
                height: MediaQuery.sizeOf(context).height * .22,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: CardItem(),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'الأكثر مبيعا',
                      style: TextStyle(
                        fontSize: 25,
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'المزيد',
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.normal,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}

class DiscountCardItemDetails extends StatelessWidget {
  const DiscountCardItemDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'عروض العيد',
          style: TextStyle(
            fontFamily: 'Cairo',
            fontSize: 18,
            color: Color(0XFFD3E4D1),
          ),
        ),
        // const SizedBox(height: 30),
        Text(
          'خصم 25%',
          style: TextStyle(
            fontFamily: 'Cairo',
            fontSize: 30,
            color: Color(backGroundColor),
          ),
        ),
        const SizedBox(height: 15),
        CustomShopBotton(),
      ],
    );
  }
}

class CardItem extends StatelessWidget {
  const CardItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset(
          Assets.imagesCircles,
          height: MediaQuery.sizeOf(context).height * .22,
        ),
        SvgPicture.asset(
          Assets.imagesFeatureItemBackground,
          height: MediaQuery.sizeOf(context).height * .22,
        ),
        Padding(
          padding: const EdgeInsets.only(right: 16.0, top: 32),
          child: DiscountCardItemDetails(),
        ),
      ],
    );
  }
}
