import 'package:e_commerce_app/core/constant/assets.dart';
import 'package:e_commerce_app/core/widgets/custom_botton.dart';
import 'package:e_commerce_app/features/auth/presentation/views/login/view/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: SvgPicture.asset(
            Assets.imagesPageview2background,
            fit: BoxFit.fitWidth,
            width: MediaQuery.sizeOf(context).width,
          ),
        ),

        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: MediaQuery.sizeOf(context).height * .22),
            SvgPicture.asset(Assets.imagesPageview2image),
            const SizedBox(height: 60),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'أبحث وتسوق',
                  style: TextStyle(
                    color: Colors.black,
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
                "نقدم لك أفضل الفواكه المختارة بعناية. اطلع على التفاصيل والصور والتقييمات للتأكد من اختيار الفاكهة المثالية.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'cairo',
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 40),
            CustomBotton(
              text: 'ابدأ الان',
              onTap: () {
                Navigator.of(context).pushReplacementNamed(LoginView.id);
              },
            ),
          ],
        ),
      ],
    );
  }
}
