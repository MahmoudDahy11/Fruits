import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_botton.dart';
import 'widgets/custom_details_cart.dart';
import 'widgets/custom_review.dart';
import 'widgets/custom_text_salary.dart';
import 'widgets/product_image_cart.dart';

class ProductDetiallsView extends StatelessWidget {
  const ProductDetiallsView({super.key});
  static String id = 'ProductDetiallsView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProductImageCart(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      'فواكهه',
                      style: TextStyle(
                        fontFamily: 'Cairo',
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: CustomTextSalary(),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: CustomReview(),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 24.0,
                      horizontal: 16,
                    ),
                    child: Text(
                      'ينتمي إلى الفصيلة القرعية ولثمرته لُب حلو المذاق وقابل للأكل، '
                      'وبحسب علم النبات فهي تعتبر ثمار لبيّة، تستعمل لفظة البطيخ '
                      'للإشارة إلى النبات نفسه أو إلى الثمرة تحديداً',
                      style: TextStyle(
                        fontFamily: 'Cairo',
                        color: Colors.grey,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: CustonDetailsCart(),
                  ),
                ],
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(12.0),
            child: CustomBotton(text: 'أضف الي السلة', onTap: () {}),
          ),
        ],
      ),
    );
  }
}
