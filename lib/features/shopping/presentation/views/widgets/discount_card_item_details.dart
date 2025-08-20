import 'package:flutter/widgets.dart';

import '../../../../../core/constant/constant.dart';
import 'custom_shop_botton.dart';

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

        CustomShopBotton(),
        const SizedBox(height: 30),
      ],
    );
  }
}
