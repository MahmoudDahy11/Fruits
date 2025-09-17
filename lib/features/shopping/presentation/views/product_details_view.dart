import 'package:e_commerce_app/features/shopping/domain/entity/product_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/custom_botton.dart';
import '../cubits/cart/cart_cubit.dart';
import 'widgets/custom_details_cart.dart';
import 'widgets/custom_review.dart';
import 'widgets/custom_text_salary.dart';
import 'widgets/product_image_cart.dart';

class ProductDetiallsView extends StatefulWidget {
  const ProductDetiallsView({super.key, required this.product});
  static String id = 'ProductDetiallsView';
  final ProductEntity product;

  @override
  State<ProductDetiallsView> createState() => _ProductDetiallsViewState();
}

class _ProductDetiallsViewState extends State<ProductDetiallsView> {
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
                  ProductImageCart(image: widget.product.image),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      widget.product.category,
                      style: TextStyle(
                        fontFamily: 'Cairo',
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: CustomTextSalary(
                      salary: widget.product.price.toString(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: CustomReview(
                      rating: widget.product.rate.toString(),
                      reviewCount: widget.product.count.toString(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 24.0,
                      horizontal: 16,
                    ),
                    child: Text(
                      widget.product.description,
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
            child: CustomButton(
              text: 'أضف الي السلة',
              onTap: () {
                BlocProvider.of<CartCubit>(context).addProduct(widget.product);
              },
            ),
          ),
        ],
      ),
    );
  }
}
