import 'package:e_commerce_app/features/shopping/presentation/cubits/get_product/get_product_cubit.dart';
import 'package:e_commerce_app/features/shopping/presentation/views/widgets/custom_text_field_product.dart';
import 'package:e_commerce_app/features/shopping/presentation/views/widgets/list_view_generate.dart';
import 'package:e_commerce_app/features/shopping/presentation/views/widgets/shopping_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/constant/assets.dart';

class ProductsView extends StatefulWidget {
  const ProductsView({super.key});
  static const String id = 'ProductsView';

  @override
  State<ProductsView> createState() => _ProductsViewState();
}

class _ProductsViewState extends State<ProductsView> {
  String searchQuery = '';

  List _filterProducts(List allProducts) {
    if (searchQuery.isEmpty) return allProducts;
    return allProducts
        .where(
          (product) => product.title.toLowerCase().startsWith(searchQuery.toLowerCase()),
        )
        .toList();
  }

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
            margin: const EdgeInsets.only(left: 16),
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
      body: BlocBuilder<GetProductCubit, GetProductState>(
        builder: (context, state) {
          if (state is GetProductLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is GetProductFailure) {
            return Center(child: Text(state.errMessage));
          } else if (state is GetProductSuccess) {
            final allProducts = state.products;
            final filteredProducts = _filterProducts(allProducts);

            return CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8.0,
                      vertical: 8.0,
                    ),
                    child: CustomTextFieldProduct(
                      onChanged: (value) {
                        setState(() {
                          searchQuery = value;
                        });
                      },
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 150,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: allProducts.length,
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: ListViweGenerate(product: allProducts[index]),
                        );
                      },
                    ),
                  ),
                ),
                const SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 8.0,
                      vertical: 16,
                    ),
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
                ),
                SliverPadding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8.0,
                    vertical: 16,
                  ),
                  sliver: SliverGrid(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) =>
                          ShoppingCard(product: filteredProducts[index]),
                      childCount: filteredProducts.length,
                    ),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20,
                          childAspectRatio: 0.7,
                        ),
                  ),
                ),
              ],
            );
          } else {
            return const Center(child: Text("جاري تحميل المنتجات..."));
          }
        },
      ),
    );
  }
}
