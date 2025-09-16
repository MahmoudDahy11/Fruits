import 'package:e_commerce_app/core/constant/assets.dart';
import 'package:e_commerce_app/core/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../domain/entity/cart_entity.dart';
import '../../cubits/cart/cart_cubit.dart';
import '../product_details_view.dart';

class CartItemDetails extends StatelessWidget {
  const CartItemDetails({super.key, required this.item});
  final CartItemEntity item;

  @override
  Widget build(BuildContext context) {
    final price = item.product.price;
    final count = item.quantity;

    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    final imageSize = width * 0.22;
    final iconSize = width * 0.08;
    final fontSize = width * 0.04;
    final titleFontSize = width * 0.045;

    return Container(
      margin: EdgeInsets.symmetric(
        vertical: height * 0.01,
        horizontal: width * 0.03,
      ),
      padding: EdgeInsets.symmetric(vertical: height * 0.005),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Container(
            width: imageSize,
            height: imageSize,
            color: Colors.grey.shade100,
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  ProductDetiallsView.id,
                  arguments: item.product,
                );
              },
              child: Image.network(item.product.image, fit: BoxFit.contain),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: width * 0.03,
                vertical: height * 0.01,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          item.product.title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: titleFontSize,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          context.read<CartCubit>().removeProduct(
                            item.product.id,
                          );
                        },
                        icon: SvgPicture.asset(
                          Assets.imagesDeleteIcon,
                          height: iconSize,
                        ),
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      item.product.category,
                      style: TextStyle(
                        color: Color(orangeColor),
                        fontSize: fontSize,
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.01),
                  Row(
                    children: [
                      IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          context.read<CartCubit>().increaseQuantity(
                            item.product.id,
                          );
                        },
                        icon: SvgPicture.asset(
                          Assets.imagesCount2,
                          height: iconSize,
                        ),
                      ),
                      SizedBox(width: width * 0.02),
                      Text(
                        "$count",
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: fontSize + 2,
                        ),
                      ),
                      SizedBox(width: width * 0.02),
                      IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          if (count > 1) {
                            context.read<CartCubit>().decreaseQuantity(
                              item.product.id,
                            );
                          }
                        },
                        icon: SvgPicture.asset(
                          Assets.imagesCount,
                          height: iconSize,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        "${(price * count).toStringAsFixed(2)} جنيه",
                        style: TextStyle(
                          color: Color(orangeColor),
                          fontSize: fontSize + 2,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
