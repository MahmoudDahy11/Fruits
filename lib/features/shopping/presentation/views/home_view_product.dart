import 'package:e_commerce_app/core/constant/assets.dart';
import 'package:e_commerce_app/features/shopping/presentation/views/account_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../cubits/fav/favorite_cubit.dart';
import 'fav_view.dart';
import 'product_view.dart';
import '../cubits/get_product/get_product_cubit.dart';
import '../cubits/cart/cart_cubit.dart';
import 'cart_view.dart';
import 'widgets/card_item.dart';
import 'widgets/custom_list_tile_info.dart';
import 'widgets/custom_text_field_product.dart';
import 'widgets/shopping_card.dart';

class HomeViewProduct extends StatefulWidget {
  const HomeViewProduct({super.key});
  static String id = 'Home_product_view';

  @override
  State<HomeViewProduct> createState() => _HomeViewProductState();
}

class _HomeViewProductState extends State<HomeViewProduct> {
  final List<Widget> _otherPages = const [
    ProductsView(),
    FavoriteView(),
    CartView(),
    AccountView(),
  ];

  int _currentIndex = 0;
  List<dynamic> _allProducts = [];
  List<dynamic> _filteredProducts = [];

  void _filterProducts(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredProducts = _allProducts;
      } else {
        _filteredProducts = _allProducts
            .where(
              (product) => product.title.toLowerCase().startsWith(
                query.toLowerCase().trim(),
              ),
            )
            .toList();
      }
    });
  }

  Widget _buildHomePage() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: CustomListTileInfo(),
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 30)),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: CustomTextFieldProduct(onChanged: _filterProducts),
              ),
            ),
            // const SliverToBoxAdapter(child: SizedBox(height: 30)),
            // SliverToBoxAdapter(
            //   child: SizedBox(
            //     height: MediaQuery.of(context).size.height * .22,
            //     child: ListView.builder(
            //       physics: const BouncingScrollPhysics(),
            //       scrollDirection: Axis.horizontal,
            //       itemCount: 10,
            //       itemBuilder: (context, index) {
            //         return const Padding(
            //           padding: EdgeInsets.symmetric(horizontal: 16.0),
            //           child: CardItem(),
            //         );
            //       },
            //     ),
            //   ),
            // ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 24.0,
                  horizontal: 8.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'الأكثر مبيعا',
                      style: TextStyle(
                        fontSize: 25,
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'المزيد',
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.normal,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            BlocBuilder<GetProductCubit, GetProductState>(
              builder: (context, state) {
                if (state is GetProductLoading) {
                  return const SliverToBoxAdapter(
                    child: Center(child: CircularProgressIndicator()),
                  );
                } else if (state is GetProductFailure) {
                  return SliverToBoxAdapter(
                    child: Center(child: Text(state.errMessage)),
                  );
                } else if (state is GetProductSuccess) {
                  if (_allProducts.isEmpty) {
                    _allProducts = state.products;
                    _filteredProducts = _allProducts;
                  }
                  return SliverGrid(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      final product = _filteredProducts[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ShoppingCard(product: product),
                      );
                    }, childCount: _filteredProducts.length),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 8,
                          crossAxisSpacing: 8,
                          childAspectRatio: 0.8,
                        ),
                  );
                }
                return const SliverToBoxAdapter(
                  child: Center(child: Text("جاري تحميل المنتجات...")),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    context.read<GetProductCubit>().getProducts(endPoint: "products");
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: _currentIndex == 0
            ? _buildHomePage()
            : _otherPages[_currentIndex - 1],
        bottomNavigationBar: SalomonBottomBar(
          backgroundColor: const Color(0xffFFFFFF),
          currentIndex: _currentIndex,
          onTap: (i) => setState(() => _currentIndex = i),
          items: [
            SalomonBottomBarItem(
              icon: SvgPicture.asset(Assets.imagesHome, height: 30),
              title: const Text("الرئيسية"),
              selectedColor: const Color(0xff1B5E37),
            ),
            SalomonBottomBarItem(
              icon: SvgPicture.asset(Assets.imagesElement3, height: 30),
              title: const Text("المنتجات"),
              selectedColor: const Color(0xff1B5E37),
            ),
            SalomonBottomBarItem(
              icon: BlocBuilder<FavoriteCubit, FavoriteState>(
                builder: (context, state) {
                  int favCount = 0;
                  if (state is FavoriteUpdated) {
                    favCount = state.favorites.length;
                  }
                  return Stack(
                    clipBehavior: Clip.none,
                    children: [
                      SvgPicture.asset(Assets.imagesHeart, height: 30),
                      if (favCount > 0)
                        Positioned(
                          right: -6,
                          top: -6,
                          child: Container(
                            padding: const EdgeInsets.all(4),
                            decoration: const BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                            ),
                            child: Text(
                              favCount.toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                    ],
                  );
                },
              ),
              title: const Text("المفضلة"),
              selectedColor: const Color(0xff1B5E37),
            ),

            SalomonBottomBarItem(
              icon: BlocBuilder<CartCubit, CartState>(
                builder: (context, state) {
                  return Stack(
                    clipBehavior: Clip.none,
                    children: [
                      SvgPicture.asset(Assets.imagesShoppingCart, height: 30),
                      if (state.items.isNotEmpty)
                        Positioned(
                          right: -6,
                          top: -6,
                          child: Container(
                            padding: const EdgeInsets.all(4),
                            decoration: const BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                            ),
                            child: Text(
                              state.items.length.toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                    ],
                  );
                },
              ),
              title: const Text("السلة"),
              selectedColor: const Color(0xff1B5E37),
            ),
            SalomonBottomBarItem(
              icon: SvgPicture.asset(Assets.imagesUser, height: 30),
              title: const Text("حسابي"),
              selectedColor: const Color(0xff1B5E37),
            ),
          ],
        ),
      ),
    );
  }
}
