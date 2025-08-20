import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

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
  int _currentIndex = 0;

  Widget _buildHomePage() {
    return Padding(
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
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: CustomTextFieldProduct(),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 30)),
          SliverToBoxAdapter(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * .22,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: CardItem(),
                  );
                },
              ),
            ),
          ),
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
          SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (context, index) => const Padding(
                padding: EdgeInsets.all(8.0),
                child: ShoppingCard(),
              ),
              childCount: 20,
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              childAspectRatio: 0.8,
            ),
          ),
        ],
      ),
    );
  }

  final List<Widget> _otherPages = [
    Scaffold(
      body: Center(
        child: Text(
          "📂 المنتجات",
          style: TextStyle(fontSize: 25, fontFamily: 'Cairo'),
        ),
      ),
    ),
    Scaffold(
      body: Center(
        child: Text(
          "🛒 السلة",
          style: TextStyle(fontSize: 25, fontFamily: 'Cairo'),
        ),
      ),
    ),
    Scaffold(
      body: Center(
        child: Text(
          "👤 حسابي",
          style: TextStyle(fontSize: 25, fontFamily: 'Cairo'),
        ),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _currentIndex == 0
            ? _buildHomePage()
            : _otherPages[_currentIndex - 1],
      ),
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _currentIndex,
        onTap: (i) => setState(() => _currentIndex = i),
        items: [
          SalomonBottomBarItem(
            icon: const Icon(Icons.home),
            title: const Text("الرئيسية"),
            selectedColor: Color(0xff1B5E37),
          ),
          SalomonBottomBarItem(
            icon: const Icon(Icons.grid_view_rounded),
            title: const Text("المنتجات"),
            selectedColor: Color(0xff1B5E37),
          ),
          SalomonBottomBarItem(
            icon: const Icon(Icons.shopping_cart),
            title: const Text("السلة"),
            selectedColor: Color(0xff1B5E37),
          ),
          SalomonBottomBarItem(
            icon: const Icon(Icons.person),
            title: const Text("حسابي"),
            selectedColor: Color(0xff1B5E37),
          ),
        ],
      ),
    );
  }
}
