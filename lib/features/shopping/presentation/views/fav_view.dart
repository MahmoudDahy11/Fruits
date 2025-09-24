import 'package:e_commerce_app/core/constant/constant.dart';
import 'package:e_commerce_app/features/shopping/presentation/cubits/fav/favorite_cubit.dart';
import 'package:e_commerce_app/features/shopping/presentation/views/widgets/shopping_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


/*
 * FavoriteView class
 * StatelessWidget that represents the favorite products screen
 * Uses BlocBuilder to manage and display the state of favorite products
 * Displays a grid of favorite product cards
 * Handles loading, empty, and error states for favorites
 */

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});
  static const id = "FavoriteView";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "المفضلات",
          style: TextStyle(fontFamily: fontFamily, fontSize: 24),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<FavoriteCubit, FavoriteState>(
        builder: (context, state) {
          if (state is FavoriteLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is FavoriteUpdated && state.favorites.isNotEmpty) {
            return GridView.builder(
              padding: const EdgeInsets.all(12),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.7,
              ),
              itemCount: state.favorites.length,
              itemBuilder: (context, index) {
                return ShoppingCard(product: state.favorites[index]);
              },
            );
          } else if (state is FavoriteError) {
            return Center(child: Text("Error: ${state.message}"));
          } else {
            return const Center(
              child: Text(
                "لا توجد منتجات في المفضلة",
                style: TextStyle(fontFamily: fontFamily, fontSize: 24),
              ),
            );
          }
        },
      ),
    );
  }
}
