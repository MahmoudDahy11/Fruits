import 'package:e_commerce_app/core/constant/constant.dart';
import 'package:e_commerce_app/core/widgets/custom_botton.dart';
import 'package:e_commerce_app/core/widgets/custom_create_account_text.dart';
import 'package:e_commerce_app/core/widgets/custom_text_field.dart';
import 'package:e_commerce_app/core/widgets/show_snak_bar.dart';
import 'package:e_commerce_app/features/auth/presentation/cubits/auth/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../../shopping/presentation/views/home_view_product.dart';

class RegisterViewBody extends StatefulWidget {
  const RegisterViewBody({super.key});

  @override
  State<RegisterViewBody> createState() => _RegisterViewBodyState();
}

class _RegisterViewBodyState extends State<RegisterViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey();
  String? email, password, fullName;
  bool obscureText = true;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthLoading) {
          isLoading = true;
        } else if (state is AuthSuccess) {
          isLoading = false;
          showSnakBar(context, 'Login Success');
          Future.delayed(Duration(seconds: 1), () {
            Navigator.of(context).pushNamed(HomeViewProduct.id);
          });
        } else if (state is AuthFailure) {
          isLoading = false;
          showSnakBar(context, state.errMessage);
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.arrow_forward_ios),
              ),
            ],
            automaticallyImplyLeading: false,
            centerTitle: true,
            title: const Text(
              'حساب جديد',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                fontFamily: fontFamily,
              ),
            ),
          ),
          body: ModalProgressHUD(
            inAsyncCall: isLoading,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    const SizedBox(height: 40),
                    CustomTextField(
                      hintText: 'الاسم بالكامل',
                      onSaved: (value) {
                        fullName = value;
                      },
                      obscureText: false,
                    ),
                    const SizedBox(height: 20),
                    CustomTextField(
                      hintText: 'البريد الالكتروني',
                      onSaved: (value) {
                        email = value;
                      },
                      obscureText: false,
                    ),
                    const SizedBox(height: 20),
                    CustomTextField(
                      hintText: 'كلمة المرور',
                      onSaved: (value) {
                        password = value;
                      },
                      suffix: IconButton(
                        onPressed: () {
                          setState(() {
                            obscureText = !obscureText;
                          });
                        },
                        icon: Icon(
                          obscureText
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                          color: Colors.grey,
                        ),
                      ),
                      obscureText: obscureText,
                    ),
                    const SizedBox(height: 80),
                    CustomBotton(
                      text: 'انشاء حساب جديد',
                      onTap: () async {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                          BlocProvider.of<AuthCubit>(context).register(
                            email: email!,
                            password: password!,
                            fullName: fullName!,
                          );
                        }
                      },
                    ),
                    const SizedBox(height: 40),
                    CustomCreateAccountText(
                      text1: 'تمتلك حساب بالفعل ؟',
                      text2: 'تسجيل الدخول',
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
