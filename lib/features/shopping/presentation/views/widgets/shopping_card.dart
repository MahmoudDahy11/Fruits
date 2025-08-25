import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/constant/assets.dart';

class ShoppingCard extends StatefulWidget {
  const ShoppingCard({super.key});

  @override
  State<ShoppingCard> createState() => _ShoppingCardState();
}

class _ShoppingCardState extends State<ShoppingCard> {
  bool check = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              onPressed: () {
                setState(() {
                  check = !check;
                });
              },
              icon: Icon(
                check ? Icons.favorite : Icons.favorite_outline_rounded,
                color: check ? Colors.red : Colors.black,
                size: 30,
              ),
            ),
          ),
          Expanded(child: Center(child: Image.asset(Assets.imagesStroparypng))),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: const Text(
                      'فراولة',
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: const [
                      Text(
                        '30 جنية \\ ',
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Cairo',
                          fontWeight: FontWeight.w700,
                          color: Color(0xffF4A91F),
                        ),
                      ),
                      Text(
                        "الكيلو",
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Cairo',
                          fontWeight: FontWeight.w700,
                          color: Color(0xffF8C76D),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SvgPicture.asset(Assets.imagesCount2, height: 30),
            ],
          ),
        ],
      ),
    );
  }
}
