import 'package:e_commerce_app/core/services/get_it.dart';
import 'package:e_commerce_app/features/auth/presentation/views/login/view/login_view.dart';
import 'package:e_commerce_app/features/auth/presentation/views/reset_password_view.dart';
import 'package:e_commerce_app/features/on_boarding/presentation/page_view.dart';
import 'package:e_commerce_app/features/shopping/product_view.dart';
import 'package:e_commerce_app/features/splash/presentation/views/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/auth/presentation/cubits/facebook_cubit/facebook_cubit.dart';
import '../../features/auth/presentation/cubits/google_cubit/google_cubit.dart';
import '../../features/auth/presentation/cubits/login_cubit/login_cubit.dart';
import '../../features/auth/presentation/cubits/signout_cubit/signout_cubit.dart';
import '../../features/auth/presentation/cubits/signup_cubit/signup_cubit.dart';
import '../../features/auth/presentation/views/register/view/regiser_view.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> routes = {
    Splash.id: (context) => const Splash(),
    OnBoarding.id: (context) => const OnBoarding(),
    LoginView.id: (context) => MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<LoginCubit>()),
        BlocProvider(create: (context) => getIt<GoogleCubit>()),
        BlocProvider(create: (context) => getIt<SignoutCubit>()),
        BlocProvider(create: (context) => getIt<FacebookCubit>()),
      ],
      child: const LoginView(),
    ),
    ResetPasswordView.id: (context) => const ResetPasswordView(),
    ProductsView.id: (context) => const ProductsView(),
    RegiserView.id: (context) => MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<SignupCubit>()),
        BlocProvider(create: (context) => getIt<GoogleCubit>()),
        BlocProvider(create: (context) => getIt<SignoutCubit>()),
        BlocProvider(create: (context) => getIt<FacebookCubit>()),
      ],
      child: const RegiserView(),
    ),
  };
}
