import 'package:flutter/material.dart';
import 'package:tokosepatu/pages/detail_chat.dart';
import 'package:tokosepatu/pages/home/main_page.dart';
import 'package:tokosepatu/pages/sign_in_page.dart';
import 'package:tokosepatu/pages/splash_pages.dart';
import 'package:tokosepatu/pages/sign_up_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => SplashPage(),
        '/sign-in': (context) => SignInPage(),
        '/sign-up': (context) => SignUpPage(),
        '/home': (context) => MainPage(),
        '/detail-chat': (context) => DetailChatPage(),
      },
    );
  }
}
