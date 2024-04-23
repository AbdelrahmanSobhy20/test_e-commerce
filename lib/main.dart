import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:e_commerce_app/provider/purchases.dart';
import 'package:e_commerce_app/provider/selectedindex.dart';
import 'package:e_commerce_app/sql/SQLP.dart';
import 'package:e_commerce_app/view/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'model/check_user.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferences.getInstance();
  await ProductsData.instance.open();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => UserProvider()),
      ChangeNotifierProvider(create: (_) => Purchasses()),
      ChangeNotifierProvider(create: (_) => SelectedCategoryProvider()),
      //     ChangeNotifierProvider(create: (context) => CartProvider())
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create:(BuildContext context) => Purchasses(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: AnimatedSplashScreen(
          duration: 3000,
          splash: "assets/71.jpg",
          splashIconSize: 250,
          nextScreen: const OnBoardingScreen(),
          splashTransition: SplashTransition.sizeTransition,
          pageTransitionType: PageTransitionType.leftToRight,
          backgroundColor:Colors.white,
        ),
      ),
    );
  }
}