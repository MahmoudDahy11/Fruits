import 'package:flutter/material.dart';

class CustomBrovider extends StatelessWidget {
  const CustomBrovider({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: Divider(color: Colors.grey, thickness: 1.5)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            'أو',
            style: const TextStyle(
              fontSize: 24,
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontFamily: 'Cairo',
            ),
          ),
        ),
        const Expanded(child: Divider(color: Colors.grey, thickness: 1.5)),
      ],
    );
  }
}
