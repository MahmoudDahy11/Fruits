import 'package:e_commerce_app/core/constant/assets.dart';
import 'package:e_commerce_app/core/helper/show_snak_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../../domain/entity/product_entity.dart';
import '../../cubits/cart/cart_cubit.dart';
import '../../cubits/fav/favorite_cubit.dart';
import '../product_details_view.dart';

class ShoppingCard extends StatelessWidget {
  const ShoppingCard({super.key, required this.product});
  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          ProductDetiallsView.id,
          arguments: product,
        );
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(4),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 8,
              offset: const Offset(0, 1000),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocBuilder<FavoriteCubit, FavoriteState>(
              builder: (context, state) {
                final favorites = state is FavoriteUpdated
                    ? state.favorites
                    : [];
                final isFavorite = favorites.any((p) => p.id == product.id);

                return IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    context.read<FavoriteCubit>().toggleFavorite(
                      product,
                      isFavorite,
                    );
                    showSnakBar(
                      context,
                      isFavorite
                          ? "Removed from favorites"
                          : "Added to favorites ❤️",
                      isError: isFavorite,
                    );
                  },
                  icon: Icon(
                    isFavorite
                        ? Icons.favorite
                        : Icons.favorite_outline_rounded,
                    color: isFavorite ? Colors.red : Colors.black54,
                    size: width * 0.08,
                  ),
                );
              },
            ),

            Expanded(
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    product.image,
                    width: width * 0.35,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        width: width * 0.35,
                        height: width * 0.35,
                        color: Colors.grey.shade200,
                        child: const Icon(
                          Icons.broken_image,
                          size: 50,
                          color: Colors.grey,
                        ),
                      );
                    },
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return SizedBox(
                        width: width * 0.35,
                        height: width * 0.35,
                        child: const Center(child: CircularProgressIndicator()),
                      );
                    },
                  ),
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
                        product.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 18,
                          fontFamily: 'Cairo',
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "${product.price.toStringAsFixed(2)} جنية",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: width * 0.045,
                          fontFamily: 'Cairo',
                          fontWeight: FontWeight.w700,
                          color: const Color(0xffF4A91F),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),

                IconButton(
                  onPressed: () {
                    context.read<CartCubit>().addProduct(product);
                    showSnakBar(context, "${product.title} تمت إضافته للسلة");
                  },
                  icon: SvgPicture.asset(
                    Assets.imagesCount2,
                    height: width * 0.09,
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
