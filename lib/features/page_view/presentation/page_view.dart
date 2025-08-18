import 'package:e_commerce_app/features/page_view/presentation/widgets/first_page.dart';
import 'package:e_commerce_app/features/page_view/presentation/widgets/second_page.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PageViewWelcome extends StatefulWidget {
  const PageViewWelcome({super.key});
  static String id = "page_view";

  @override
  State<PageViewWelcome> createState() => _PageViewWelcomeState();
}

class _PageViewWelcomeState extends State<PageViewWelcome> {
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color(0xffFFFFFF),
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              children: const [FirstPage(), SecondPage()],
            ),
          ),
          const SizedBox(height: 16),
          SmoothPageIndicator(
            controller: _pageController,
            count: 2,
            effect: WormEffect(
              dotHeight: 12,
              dotWidth: 12,
              spacing: 8,
              activeDotColor: Color(0xff1B5E37),
              dotColor: Colors.grey.shade300,
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
