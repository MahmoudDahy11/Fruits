import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/constant/assets.dart';
import '../../../domain/entity/product_entity.dart';
import '../../cubits/cart/cart_cubit.dart';
import '../product_details_view.dart';

class ShoppingCard extends StatefulWidget {
  const ShoppingCard({super.key, required this.product});
  final ProductEntity product;

  @override
  State<ShoppingCard> createState() => _ShoppingCardState();
}

class _ShoppingCardState extends State<ShoppingCard> {
  bool check = false;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        Navigator.of(
          context,
        ).pushNamed(ProductDetiallsView.id, arguments: widget.product);
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: () {
                  setState(() {
                    check = !check;
                  });
                },
                icon: Icon(
                  check ? Icons.favorite : Icons.favorite_outline_rounded,
                  color: check ? Colors.red : Colors.black,
                  size: width * 0.07,
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Image.network(
                  widget.product.image,
                  width: width * 0.25,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(
                      Icons.broken_image,
                      size: 50,
                      color: Colors.grey,
                    );
                  },
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return const Center(child: CircularProgressIndicator());
                  },
                ),
              ),
            ),
            const SizedBox(height: 8),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.product.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 18,
                          fontFamily: 'Cairo',
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          Flexible(
                            child: Text(
                              "${widget.product.price} جنية  ",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: width * 0.035,
                                fontFamily: 'Cairo',
                                fontWeight: FontWeight.w700,
                                color: const Color(0xffF4A91F),
                              ),
                            ),
                          ),
                          // Text(
                          //   "الكيلو",
                          //   style: TextStyle(
                          //     fontSize: width * 0.035,
                          //     fontFamily: 'Cairo',
                          //     fontWeight: FontWeight.w700,
                          //     color: const Color(0xffF8C76D),
                          //   ),
                          // ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  onPressed: () {
                    context.read<CartCubit>().addProduct(widget.product);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          "${widget.product.title} تمت إضافته للسلة",
                        ),
                      ),
                    );
                  },
                  icon: SvgPicture.asset(
                    Assets.imagesCount2,
                    height: width * 0.07,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
