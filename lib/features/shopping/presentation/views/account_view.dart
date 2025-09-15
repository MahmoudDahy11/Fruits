import 'package:flutter/material.dart';

class AccountView extends StatelessWidget {
  const AccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "👤 حسابي",
          style: TextStyle(fontSize: 25, fontFamily: 'Cairo'),
        ),
      ),
    );
  }
}