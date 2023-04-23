import 'package:flutter/material.dart';
import 'package:serpismotor2/pages/cart_page.dart';
import 'package:serpismotor2/pages/checkout_page.dart';
import 'package:serpismotor2/pages/checkout_success_page.dart';
import 'package:serpismotor2/pages/detail_chat.dart';
import 'package:serpismotor2/pages/home/edit_profile_page.dart';
import 'package:serpismotor2/pages/home/navbar_main.dart';
import 'package:serpismotor2/pages/product_page.dart';
import 'package:serpismotor2/pages/service_detail.dart';
import 'package:serpismotor2/pages/sign_in_page.dart';
import 'package:serpismotor2/pages/splash_pages.dart';
import 'package:serpismotor2/pages/sign_up_page.dart';
import 'package:flutter/services.dart';
import 'package:serpismotor2/theme.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: backgroundColor1, // warna status bar
    statusBarIconBrightness: Brightness.dark, // warna icon pada status bar
    systemNavigationBarColor: whiteColor, // warna navigation bar
    systemNavigationBarIconBrightness:
        Brightness.dark, // warna icon pada navigation bar
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => SplashPage(),
        '/sign-in': (context) => SignInPage(),
        '/sign-up': (context) => SignUpPage(),
        '/home': (context) => NavbarMain(),
        '/detail-chat': (context) => DetailChatPage(),
        '/edit-profile': (context) => EditProfilePage(),
        '/product': (context) => ServiceDetail(),
        '/cart': (context) => CartPage(),
        '/checkout': (context) => CheckoutPage(),
        '/checkout-success': (context) => CheckoutSuccessPage(),
      },
    );
  }
}
