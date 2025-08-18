import 'package:e_commerce_app/core/constant/assets.dart';
import 'package:e_commerce_app/core/constant/constant.dart';
import 'package:flutter/material.dart';

class HomeViewProduct extends StatelessWidget {
  const HomeViewProduct({super.key});
  static String id = 'Home_product_view';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ListTile(
              leading: Image.asset(Assets.imagesAvatar),
              title: Text(
                'صباح الخير!..',
                style: TextStyle(
                  fontFamily: 'Cairo',
                  fontSize: 20,
                  color: Colors.grey,
                  fontWeight: FontWeight.normal,
                ),
              ),
              subtitle: Text(
                'محمود ضاحي',
                style: TextStyle(
                  fontFamily: 'Cairo',
                  fontSize: 24,
                  color: Colors.black,
                  fontWeight: FontWeight.w800,
                ),
              ),
              trailing: Container(
                decoration: BoxDecoration(
                  color: Colors.green.shade100,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.notifications_none_rounded,
                    size: 35,
                    color: Color(greenColor),
                  ),
                ),
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}
