import 'package:e_commerce_app/features/shopping/presentation/views/widgets/custom_list_tile_info.dart';
import 'package:flutter/material.dart';

class HomeViewProduct extends StatelessWidget {
  const HomeViewProduct({super.key});
  static String id = 'Home_product_view';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Column(children: [CustomListTileInfo()])),
    );
  }
}
