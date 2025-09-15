import 'dart:developer';
import 'package:e_commerce_app/core/constant/constant.dart';
import 'package:e_commerce_app/core/widgets/custom_botton.dart';
import 'package:e_commerce_app/core/widgets/custom_create_account_text.dart';
import 'package:e_commerce_app/core/widgets/custom_text_field.dart';
import 'package:e_commerce_app/features/auth/presentation/cubits/login_cubit/login_cubit.dart';
import 'package:e_commerce_app/features/auth/presentation/views/login/widgets/custom_brovider.dart';
import 'package:e_commerce_app/features/auth/presentation/views/login/widgets/custom_check_text.dart';
import 'package:e_commerce_app/features/auth/presentation/views/login/widgets/custom_list_tile.dart';
import 'package:e_commerce_app/features/auth/presentation/views/register/view/regiser_view.dart';
import 'package:e_commerce_app/features/shopping/presentation/views/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../../../../../../core/helper/awesome_dialog.dart';
import '../../../../../../core/helper/show_snak_bar.dart';
import '../../../cubits/google_cubit/google_cubit.dart';
import '../../reset_password_view.dart';

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
    return MultiBlocListener(
      listeners: [
        BlocListener<GoogleCubit, GoogleState>(
          listener: (context, state) {
            if (state is GoogleLoading) {
              log("Google login success");
            } else if (state is GoogleSuccess) {
              log("Google login loading...");
              showSnakBar(context, "Google login success");
              Navigator.of(context).pushNamed(HomeViewProduct.id);
            } else if (state is GoogleFailure) {
              showDialogMessage(context, desc: state.errMessage);
              log("Google error: ${state.errMessage}");
            }
          },
        ),
      ],
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginLoading) {
            log("Login loading...");
          } else if (state is LoginSuccess) {
            showSnakBar(context, "Login Register");
            Navigator.of(context).pushNamed(HomeViewProduct.id);
          } else if (state is LoginFailure) {
            showDialogMessage(context, desc: state.errMessage);
            log(state.errMessage);
          }
        },
        builder: (context, state) {
          return GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: ModalProgressHUD(
              inAsyncCall: state is LoginLoading,
              child: Scaffold(
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
                body: SingleChildScrollView(
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
                          const SizedBox(height: 20),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: CustomCheckText(
                              text: 'نسيت كلمة المرور ',
                              onTap: () {
                                Navigator.of(
                                  context,
                                ).pushNamed(ResetPasswordView.id);
                              },
                            ),
                          ),
                          const SizedBox(height: 80),
                          CustomBotton(
                            text: 'تسجيل الدخول',
                            onTap: () {
                              if (formKey.currentState!.validate()) {
                                formKey.currentState!.save();
                                BlocProvider.of<LoginCubit>(
                                  context,
                                ).signInWithEmailAndPassword(
                                  email: email!,
                                  password: password!,
                                );
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
                          CustomListTile(
                            onTap: () {
                              BlocProvider.of<GoogleCubit>(
                                context,
                              ).signInWithGoogle();
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
