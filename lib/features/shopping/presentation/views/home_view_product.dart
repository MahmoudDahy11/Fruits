import 'package:e_commerce_app/core/constant/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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

  final List<Widget> _otherPages = const [
    ProductsView(),
    CartView(),
    AccountView(),
  ];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: _currentIndex == 0
              ? _buildHomePage()
              : _otherPages[_currentIndex - 1],
        ),
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
              icon: SvgPicture.asset(Assets.imagesShoppingCart, height: 30),
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

class ProductsView extends StatelessWidget {
  const ProductsView({super.key});

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
    );
  }
}

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "🛒 السلة",
          style: TextStyle(fontSize: 25, fontFamily: 'Cairo'),
        ),
      ),
    );
  }
}

class AccountView extends StatelessWidget {
  const AccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "👤 حسابي",
          style: TextStyle(fontSize: 25, fontFamily: 'Cairo'),
        ),
      ),
    );
  }
}
