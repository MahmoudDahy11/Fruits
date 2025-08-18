import 'package:e_commerce_app/core/constant/constant.dart';
import 'package:e_commerce_app/core/widgets/custom_botton.dart';
import 'package:e_commerce_app/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key});
  static String id = "Reset Password";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(backGroundColor),
      appBar: AppBar(
        backgroundColor: Color(backGroundColor),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_forward_ios),
          ),
        ],
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          'نسيان كلمة المرور',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            fontFamily: fontFamily,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Text(
              maxLines: 2,
              'لا تقلق ما عليك سوي كتابة رقم هاتفك وسنرسل رمز التحقق.',
              style: TextStyle(color: Color(0xff616A6B), fontSize: 24),
            ),
            const SizedBox(height: 20),
            CustomTextField(hintText: 'ادخال رقم الهاتف', obscureText: false),
            const SizedBox(height: 40),
            CustomBotton(text: 'تأكيد', onTap: () {}),
          ],
        ),
      ),
    );
  }
}
