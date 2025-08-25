import 'package:e_commerce_app/features/auth/data/repo/auth_repo_implement.dart';
import 'package:e_commerce_app/features/auth/presentation/cubits/auth/auth_cubit.dart';
import 'package:e_commerce_app/features/auth/presentation/views/login/view/login_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/services/firebase_auth.dart';
class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static String id = 'Login_View';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          AuthCubit(AuthRepoImplement(FirebaseAuthentication())),
      child: LoginViewBody(),
    );
  }
}
