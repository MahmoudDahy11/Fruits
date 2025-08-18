import 'package:e_commerce_app/core/constant/assets.dart';
import 'package:e_commerce_app/core/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade400),
        color: Color(backGroundColor),
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        leading: SvgPicture.asset(
          Assets.imagesGoogleIcons,
          width: 30,
          height: 30,
        ),
        title: const Text(
          'تسجيل الدخول باستخدام جوجل',
          style: TextStyle(
            fontSize: 20,
            fontFamily: fontFamily,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        onTap: () {},
      ),
    );
  }
}
