import 'package:e_commerce_app/core/services/firebase_auth.dart';
import 'package:e_commerce_app/features/auth/data/repo/auth_repo_implement.dart';
import 'package:e_commerce_app/features/auth/presentation/cubits/auth/auth_cubit.dart';
import 'package:e_commerce_app/features/auth/presentation/views/register/view/register_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class RegiserView extends StatelessWidget {
  const RegiserView({super.key});
  static String id = 'RegisterView';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(AuthRepoImplement(FirebaseAuthentication()) ),
      child: RegisterViewBody(),
    );
  }
}
