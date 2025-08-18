import 'package:flutter/material.dart';
import 'widgets/custom_list_tile_info.dart';
import 'widgets/custom_text_field_product.dart';

class HomeViewProduct extends StatelessWidget {
  const HomeViewProduct({super.key});
  static String id = 'Home_product_view';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            children: [
              CustomListTileInfo(),
              const SizedBox(height: 30),
              CustomTextFieldProduct(),
            ],
          ),
        ),
      ),
    );
  }
}
