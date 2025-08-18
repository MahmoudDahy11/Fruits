import 'package:e_commerce_app/core/constant/constant.dart';
import 'package:e_commerce_app/features/auth/presentation/cubits/auth/auth_cubit.dart';
import 'package:e_commerce_app/features/auth/presentation/views/register/view/regiser_view.dart';
import 'package:e_commerce_app/features/page_view/presentation/page_view.dart';
import 'package:e_commerce_app/firebase_options.dart';
import 'package:e_commerce_app/generated/l10n.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'features/auth/presentation/views/login/view/login_view.dart';
import 'features/auth/presentation/views/reset_password_view.dart';
import 'features/shopping/presentation/views/home_view_product.dart';
import 'features/splash/presentation/views/splash.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const ECommerceApp());
}

class ECommerceApp extends StatelessWidget {
  const ECommerceApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: Color(backGroundColor),
          appBarTheme: AppBarTheme(color: Color(backGroundColor)),
        ),
        initialRoute: SplashView.id,
        routes: {
          SplashView.id: (context) => SplashView(),
          PageViewWelcome.id: (context) => PageViewWelcome(),
          LoginView.id: (context) => LoginView(),
          RegiserView.id: (context) => RegiserView(),
          ResetPasswordView.id: (context) => ResetPasswordView(),
          HomeViewProduct.id: (context) => HomeViewProduct(),
        },
        localizationsDelegates: [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [Locale('en'), Locale('ar')],
        locale: Locale('ar'),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
