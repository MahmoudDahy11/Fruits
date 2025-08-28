import 'package:e_commerce_app/features/shopping/presentation/views/widgets/custom_text_field_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/constant/assets.dart';
import 'presentation/views/widgets/list_view_generate.dart';
import 'presentation/views/widgets/shopping_card.dart';

class ProductsView extends StatefulWidget {
  const ProductsView({super.key});

  @override
  State<ProductsView> createState() => _ProductsViewState();
}

class _ProductsViewState extends State<ProductsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text(
          'المنتجات',
          style: TextStyle(fontFamily: 'Cairo', fontSize: 30),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(left: 16),
            decoration: BoxDecoration(
              color: Colors.green.shade100,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(Assets.imagesNotification, height: 30),
            ),
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                children: [
                  CustomTextFieldProduct(),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 16),
                    child: Row(
                      children: [
                        Text(
                          "منتجاتنا",
                          style: TextStyle(
                            fontFamily: 'Cairo',
                            fontWeight: FontWeight.w900,
                            fontSize: 20,
                          ),
                        ),
                        Spacer(),
                        SvgPicture.asset('assets/images/filrting.svg'),
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: ListViweGenerate(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 32.0),
                    child: Row(
                      children: [
                        Text(
                          "الأكثر مبيعا",
                          style: TextStyle(
                            fontFamily: 'Cairo',
                            fontWeight: FontWeight.w900,
                            fontSize: 20,
                          ),
                        ),
                        Spacer(),
                        Text(
                          "المزيد",
                          style: TextStyle(
                            color: Colors.grey,
                            fontFamily: 'Cairo',
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate(
                childCount: 20,
                (context, index) => ShoppingCard(),
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
