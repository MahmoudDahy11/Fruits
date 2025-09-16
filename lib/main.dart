import 'package:e_commerce_app/core/constant/constant.dart';
import 'package:e_commerce_app/core/routes/app_routes.dart';
import 'package:e_commerce_app/core/services/get_it.dart';
import 'package:e_commerce_app/firebase_options.dart';
import 'package:e_commerce_app/generated/l10n.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'features/splash/presentation/views/splash.dart';

/*
 * main function
 * initializes Firebase and GetIt
 * runs the Fruits app
 */
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  getItSetup();
  runApp(const Fruits());
}

class Fruits extends StatelessWidget {
  const Fruits({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Color(backGroundColor),
        appBarTheme: AppBarTheme(backgroundColor: Color(backGroundColor)),
      ),
      initialRoute: Splash.id,
      routes: AppRoutes.routes,
      /*
       * localization settings
       * supports English and Arabic
       * sets default locale to Arabic
       * includes necessary localization delegates
       */
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [Locale('en'), Locale('ar')],
      locale: Locale('ar'),
      debugShowCheckedModeBanner: false,
    );
  }
}

//dahym2028@gmail.com          Asd00968
//iphone8009688@gmail.com       Asd00968
