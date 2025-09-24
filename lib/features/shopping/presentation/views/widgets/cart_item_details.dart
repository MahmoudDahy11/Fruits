import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/constant/assets.dart';
import '../../../../../core/constant/constant.dart';
import '../../../domain/entity/cart_entity.dart';
import '../../cubits/cart/cart_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../product_details_view.dart';


/*
 * CartItemDetails class
 * StatelessWidget that represents the details of a single cart item
 * Displays product image, title, category, quantity controls, and total price
 * Allows navigation to product details on image tap
 * Uses CartCubit to manage quantity changes and product removal
 */
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

    return Card(
      margin: EdgeInsets.symmetric(vertical: height * 0.01, horizontal: width * 0.03),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 3,
      child: Padding(
        padding: EdgeInsets.all(width * 0.03),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, ProductDetiallsView.id, arguments: item.product);
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  item.product.image,
                  width: imageSize,
                  height: imageSize,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.broken_image, size: 50, color: Colors.grey),
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return const Center(child: CircularProgressIndicator());
                  },
                ),
              ),
            ),
            SizedBox(width: width * 0.04),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          item.product.title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: titleFontSize),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          context.read<CartCubit>().removeProduct(item.product.id);
                        },
                        icon: SvgPicture.asset(Assets.imagesDeleteIcon, height: iconSize * 0.8),
                      ),
                    ],
                  ),
                  Text(
                    item.product.category,
                    style: TextStyle(color: Color(orangeColor), fontSize: fontSize),
                  ),
                  SizedBox(height: height * 0.01),
                  Row(
                    children: [
                      _QuantityButton(
                        icon: Assets.imagesCount2,
                        onTap: () => context.read<CartCubit>().increaseQuantity(item.product.id),
                        size: iconSize,
                      ),
                      SizedBox(width: width * 0.02),
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 250),
                        transitionBuilder: (child, anim) => ScaleTransition(scale: anim, child: child),
                        child: Text(
                          "$count",
                          key: ValueKey(count),
                          style: TextStyle(fontWeight: FontWeight.w800, fontSize: fontSize + 2),
                        ),
                      ),
                      SizedBox(width: width * 0.02),
                      _QuantityButton(
                        icon: Assets.imagesCount,
                        onTap: () {
                          if (count > 1) {
                            context.read<CartCubit>().decreaseQuantity(item.product.id);
                          }
                        },
                        size: iconSize,
                      ),
                      const Spacer(),
                      Text(
                        "${(price * count).toStringAsFixed(2)} جنيه",
                        style: TextStyle(
                          color: Color(orangeColor),
                          fontSize: fontSize + 2,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _QuantityButton extends StatelessWidget {
  const _QuantityButton({required this.icon, required this.onTap, required this.size});
  final String icon;
  final VoidCallback onTap;
  final double size;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(color: Colors.grey.shade200, borderRadius: BorderRadius.circular(8)),
        child: SvgPicture.asset(icon, height: size * 0.9),
      ),
    );
  }
}
