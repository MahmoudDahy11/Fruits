import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/constant/assets.dart';
import 'discount_card_item_details.dart';

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
