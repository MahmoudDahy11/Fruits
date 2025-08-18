import 'package:e_commerce_app/core/constant/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: SvgPicture.asset(
            Assets.imagesPageview1background,
            fit: BoxFit.fitWidth,
            width: MediaQuery.sizeOf(context).width,
          ),
        ),

        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: MediaQuery.sizeOf(context).height * .22),
            SvgPicture.asset(Assets.imagesPageview1mage),
            const SizedBox(height: 60),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'مرحبا بك في',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Cairo',
                    fontSize: 30,
                  ),
                ),
                Text(
                  'Hub',
                  style: TextStyle(
                    color: Color(0xffF4A91F),
                    fontFamily: 'Cairo',
                    fontSize: 30,
                  ),
                ),
                Text(
                  'Fruit',
                  style: TextStyle(
                    color: Color(0xff1B5E37),
                    fontFamily: 'Cairo',
                    fontSize: 30,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28.0),
              child: const Text(
                "اكتشف تجربة تسوق فريدة مع FruitHUB، استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة واحصل على أفضل العروض والجودة العالية.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'cairo',
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
