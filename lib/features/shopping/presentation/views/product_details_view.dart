import 'package:e_commerce_app/features/shopping/domain/entity/product_entity.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_botton.dart';
import 'widgets/custom_details_cart.dart';
import 'widgets/custom_review.dart';
import 'widgets/custom_text_salary.dart';
import 'widgets/product_image_cart.dart';

class ProductDetiallsView extends StatelessWidget {
  const ProductDetiallsView({super.key, required this.product});
  static String id = 'ProductDetiallsView';
  final ProductEntity product;
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
                  ProductImageCart(image: product.image),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      product.category,
                      style: TextStyle(
                        fontFamily: 'Cairo',
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: CustomTextSalary(salary: product.price.toString()),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: CustomReview(
                      rating: product.rate.toString(),
                      reviewCount: product.count.toString(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 24.0,
                      horizontal: 16,
                    ),
                    child: Text(
                      product.description,
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
