import 'package:e_commerce_app/core/constant/assets.dart';
import 'package:e_commerce_app/core/services/local_storage_service.dart';
import 'package:e_commerce_app/features/on_boarding/presentation/page_view.dart';
import 'package:e_commerce_app/features/shopping/presentation/views/home_view_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

/*
 * Splash class
 * StatefulWidget that represents the splash screen
 * Displays an animated logo and navigates to the appropriate screen based on login status
 * Uses LocalStorageService to check if the user is logged in
 * Implements a fade-in animation for the logo
 */

class Splash extends StatefulWidget {
  const Splash({super.key});
  static const String id = 'splash';

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  double _opacity = 0.0;

  @override
  void initState() {
    super.initState();

    LocalStorageService.init();

    Future.delayed(const Duration(milliseconds: 200), () {
      setState(() {
        _opacity = 1.0;
      });
    });

    Future.delayed(const Duration(seconds: 3), () {
      bool loggedIn = LocalStorageService.isLoggedIn();
      if (loggedIn) {
        Navigator.of(context).pushReplacementNamed(HomeViewProduct.id);
      } else {
        Navigator.of(context).pushReplacementNamed(OnBoarding.id);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      body: Center(
        child: AnimatedOpacity(
          duration: const Duration(seconds: 2),
          opacity: _opacity,
          child: SvgPicture.asset(Assets.imagesLogoApp),
        ),
      ),
    );
  }
}
