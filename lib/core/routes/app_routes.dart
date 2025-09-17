import 'package:e_commerce_app/core/services/get_it.dart';
import 'package:e_commerce_app/features/auth/presentation/views/login/view/login_view.dart';
import 'package:e_commerce_app/features/auth/presentation/views/reset_password_view.dart';
import 'package:e_commerce_app/features/on_boarding/presentation/page_view.dart';
import 'package:e_commerce_app/features/shopping/domain/entity/product_entity.dart';
import 'package:e_commerce_app/features/shopping/presentation/cubits/add_product/add_product_cubit.dart';
import 'package:e_commerce_app/features/shopping/presentation/cubits/cart/cart_cubit.dart';
import 'package:e_commerce_app/features/shopping/presentation/cubits/fav/favorite_cubit.dart';
import 'package:e_commerce_app/features/shopping/presentation/views/account_view.dart';
import 'package:e_commerce_app/features/shopping/presentation/views/cart_view.dart';
import 'package:e_commerce_app/features/shopping/presentation/views/home_view_product.dart';
import 'package:e_commerce_app/features/shopping/presentation/views/product_view.dart';
import 'package:e_commerce_app/features/splash/presentation/views/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/auth/presentation/cubits/facebook_cubit/facebook_cubit.dart';
import '../../features/auth/presentation/cubits/google_cubit/google_cubit.dart';
import '../../features/auth/presentation/cubits/login_cubit/login_cubit.dart';
import '../../features/auth/presentation/cubits/signout_cubit/signout_cubit.dart';
import '../../features/auth/presentation/cubits/signup_cubit/signup_cubit.dart';
import '../../features/auth/presentation/views/register/view/regiser_view.dart';
import '../../features/shopping/presentation/cubits/get_product/get_product_cubit.dart';
import '../../features/shopping/presentation/views/fav_view.dart';
import '../../features/shopping/presentation/views/product_details_view.dart';

/*
 * AppRoutes class
 * defines application routes
 * maps route names to corresponding widget builders
 */

class AppRoutes {
  static Map<String, WidgetBuilder> routes = {
    Splash.id: (context) => const Splash(),

    FavoriteView.id: (context) => BlocProvider(
      create: (context) => getIt<FavoriteCubit>()..loadFavorites(),
      child: const FavoriteView(),
    ),

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

    AccountView.id: (context) => BlocProvider(
      create: (context) => getIt<SignoutCubit>(),
      child: const AccountView(),
    ),

    ProductDetiallsView.id: (context) {
      final product =
          ModalRoute.of(context)!.settings.arguments as ProductEntity;

      return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => getIt<AddProductCubit>()),
          BlocProvider(create: (context) => getIt<CartCubit>()),
        ],
        child: ProductDetiallsView(product: product),
      );
    },

    HomeViewProduct.id: (context) => MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<GetProductCubit>()),
        BlocProvider(create: (context) => getIt<AddProductCubit>()),
        BlocProvider(create: (context) => getIt<CartCubit>()),
        BlocProvider(create: (context) => getIt<SignoutCubit>()),
        BlocProvider(
          create: (context) => getIt<FavoriteCubit>()..loadFavorites(),
        ),
      ],
      child: const HomeViewProduct(),
    ),

    ProductsView.id: (context) => MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<GetProductCubit>()),
        BlocProvider(create: (context) => getIt<AddProductCubit>()),
        BlocProvider(create: (context) => getIt<CartCubit>()),
        BlocProvider(create: (context) => getIt<SignoutCubit>()),
        BlocProvider(
          create: (context) => getIt<FavoriteCubit>()..loadFavorites(),
        ),
      ],
      child: const ProductsView(),
    ),

    CartView.id: (context) => BlocProvider(
      create: (context) => getIt<CartCubit>(),
      child: const CartView(),
    ),

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
