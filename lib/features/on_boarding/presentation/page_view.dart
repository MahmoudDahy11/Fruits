import 'package:e_commerce_app/features/on_boarding/presentation/widgets/first_page.dart';
import 'package:e_commerce_app/features/on_boarding/presentation/widgets/second_page.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


/*
 * OnBoarding class
 * StatefulWidget that represents the onboarding screen
 * Contains a PageView with two pages and a SmoothPageIndicator
 */
class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});
  static const String id = "page_view";

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
