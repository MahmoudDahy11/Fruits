import 'package:e_commerce_app/core/constant/constant.dart';
import 'package:e_commerce_app/features/shopping/presentation/cubits/fav/favorite_cubit.dart';
import 'package:e_commerce_app/features/shopping/presentation/views/widgets/shopping_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteView extends StatefulWidget {
  const FavoriteView({super.key});
  static const id = "FavoriteView";

  @override
  State<FavoriteView> createState() => _FavoriteViewState();
}

class _FavoriteViewState extends State<FavoriteView> {

  @override
void initState() {
  super.initState();
  context.read<FavoriteCubit>().loadFavorites();
}

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
          if (state is FavoriteUpdated && state.favorites.isNotEmpty) {
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
