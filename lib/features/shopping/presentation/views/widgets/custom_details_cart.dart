import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/constant/assets.dart';

class CustonDetailsCart extends StatefulWidget {
  const CustonDetailsCart({super.key});

  @override
  State<CustonDetailsCart> createState() => _CustonDetailsCartState();
}

class _CustonDetailsCartState extends State<CustonDetailsCart> {
  List<Map> details = [
    {"title": "عام", "subTitle": "الصلاحيه", "image": Assets.calender},
    {"title": "100%", "subTitle": "اوجانيك", "image": Assets.organic},
    {"title": "80 كالوري", "subTitle": "100 جرام", "image": Assets.calory},
    {"title": "4.8", "subTitle": "Reviews", "image": Assets.star},
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: NeverScrollableScrollPhysics(),
      itemCount: details.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        childAspectRatio: 2,
      ),
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.only(
              right: 16.0,
              left: 32,
              top: 12,
              bottom: 12,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        alignment: Alignment.centerRight,
                        child: Text(
                          details[index]["title"],
                          style: TextStyle(
                            fontFamily: 'Cairo',
                            color: Color(0xff1B5E37),
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 7),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        alignment: Alignment.centerRight,
                        child: Text(
                          details[index]["subTitle"],
                          style: TextStyle(
                            fontFamily: 'Cairo',
                            color: Colors.grey,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 20),
                FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.centerRight,
                  child: Stack(
                    children: [
                      SvgPicture.asset(details[index]["image"], height: 60),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
