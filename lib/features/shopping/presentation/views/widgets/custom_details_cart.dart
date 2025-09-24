import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/constant/assets.dart';
import '../../../domain/entity/product_entity.dart';

class CustonDetailsCart extends StatelessWidget {
  const CustonDetailsCart({super.key, required this.product});

  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> details = [
      {
        "title": "${product.count} يوم",
        "subTitle": "الصلاحيه",
        "image": Assets.calender,
      },
      {
        "title": "100%",
        "subTitle": "أوجانيك",
        "image": Assets.organic,
      },
      {
        "title":
            "${product.price.toStringAsFixed(2)} جنيه", 
        "subTitle": "100 جرام",
        "image": Assets.calory,
      },
      {
        "title": product.rate.toString(), 
        "subTitle": "Reviews",
        "image": Assets.star,
      },
    ];

    return GridView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: details.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        childAspectRatio: 2,
      ),
      itemBuilder: (context, index) {
        final detail = details[index];
        return Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(16),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 6,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        detail["title"].toString(),
                        style: const TextStyle(
                          fontFamily: 'Cairo',
                          color: Color(0xff1B5E37),
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        detail["subTitle"] ?? "",
                        style: const TextStyle(
                          fontFamily: 'Cairo',
                          color: Colors.grey,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                if (detail["image"] != null)
                  SvgPicture.asset(detail["image"], height: 50, width: 50),
              ],
            ),
          ),
        );
      },
    );
  }
}
