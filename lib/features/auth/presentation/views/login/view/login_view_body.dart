import 'package:e_commerce_app/core/constant/constant.dart';
import 'package:e_commerce_app/core/widgets/custom_botton.dart';
import 'package:e_commerce_app/core/widgets/custom_create_account_text.dart';
import 'package:e_commerce_app/core/widgets/custom_text_field.dart';
import 'package:e_commerce_app/core/widgets/show_snak_bar.dart';
import 'package:e_commerce_app/features/auth/presentation/cubits/auth/auth_cubit.dart';
import 'package:e_commerce_app/features/auth/presentation/views/login/widgets/custom_brovider.dart';
import 'package:e_commerce_app/features/auth/presentation/views/login/widgets/custom_list_tile.dart';
import 'package:e_commerce_app/features/auth/presentation/views/register/view/regiser_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../../shopping/presentation/views/home_view_product.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  GlobalKey<FormState> formKey = GlobalKey();
  String? email, password;
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
            centerTitle: true,
            title: const Text(
              'تسجيل الدخول',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                fontFamily: fontFamily,
              ),
            ),
          ),
          body: ModalProgressHUD(
            inAsyncCall: isLoading,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      const SizedBox(height: 40),
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
                        text: 'تسجيل الدخول',
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            formKey.currentState!.save();
                            BlocProvider.of<AuthCubit>(
                              context,
                            ).login(email: email!, password: password!);
                          }
                        },
                      ),
                      const SizedBox(height: 40),
                      CustomCreateAccountText(
                        text1: 'لا تمتلك حساب ؟',
                        text2: 'قم بانشاء حساب',
                        onTap: () {
                          Navigator.pushNamed(context, RegiserView.id);
                        },
                      ),
                      const SizedBox(height: 40),
                      const CustomBrovider(),
                      const SizedBox(height: 40),
                      const CustomListTile(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
