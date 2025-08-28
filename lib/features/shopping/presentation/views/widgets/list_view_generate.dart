import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ListViweGenerate extends StatefulWidget {
  const ListViweGenerate({super.key});

  @override
  State<ListViweGenerate> createState() => _ListViweGenerateState();
}

class _ListViweGenerateState extends State<ListViweGenerate> {
  List<Map> photos = [
    {'name': 'اناناس', 'image': 'assets/images/pageview2image.svg'},
    {'name': 'بطيخ', 'image': 'assets/images/pageview1mage.svg'},
    {'name': 'اناناس', 'image': 'assets/images/pageview2image.svg'},
    {'name': 'بطيخ', 'image': 'assets/images/pageview1mage.svg'},
    {'name': 'اناناس', 'image': 'assets/images/pageview2image.svg'},
    {'name': 'بطيخ', 'image': 'assets/images/pageview1mage.svg'},
    {'name': 'اناناس', 'image': 'assets/images/pageview2image.svg'},
    {'name': 'بطيخ', 'image': 'assets/images/pageview1mage.svg'},
    {'name': 'اناناس', 'image': 'assets/images/pageview2image.svg'},
    {'name': 'بطيخ', 'image': 'assets/images/pageview1mage.svg'},
    {'name': 'اناناس', 'image': 'assets/images/pageview2image.svg'},
    {'name': 'بطيخ', 'image': 'assets/images/pageview1mage.svg'},
    {'name': 'اناناس', 'image': 'assets/images/pageview2image.svg'},
    {'name': 'بطيخ', 'image': 'assets/images/pageview1mage.svg'},
    {'name': 'اناناس', 'image': 'assets/images/pageview2image.svg'},
    {'name': 'بطيخ', 'image': 'assets/images/pageview1mage.svg'},
    {'name': 'اناناس', 'image': 'assets/images/pageview2image.svg'},
    {'name': 'بطيخ', 'image': 'assets/images/pageview1mage.svg'},
    {'name': 'اناناس', 'image': 'assets/images/pageview2image.svg'},
    {'name': 'بطيخ', 'image': 'assets/images/pageview1mage.svg'},
    {'name': 'اناناس', 'image': 'assets/images/pageview2image.svg'},
    {'name': 'بطيخ', 'image': 'assets/images/pageview1mage.svg'},
    {'name': 'اناناس', 'image': 'assets/images/pageview2image.svg'},
    {'name': 'بطيخ', 'image': 'assets/images/pageview1mage.svg'},
    {'name': 'اناناس', 'image': 'assets/images/pageview2image.svg'},
    {'name': 'بطيخ', 'image': 'assets/images/pageview1mage.svg'},
    {'name': 'اناناس', 'image': 'assets/images/pageview2image.svg'},
    {'name': 'بطيخ', 'image': 'assets/images/pageview1mage.svg'},
  ];
  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(photos.length, (index) {
        return Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 4),
              margin: EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                shape: BoxShape.circle,
              ),
              child: SvgPicture.asset(photos[index]['image']!, height: 70),
            ),
            Text(
              photos[index]['name'],
              style: TextStyle(
                fontFamily: 'Cairo',
                fontWeight: FontWeight.w700,
                fontSize: 16,
              ),
            ),
          ],
        );
      }),
    );
  }
}
