import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:serpismotor2/providers/product_provider.dart';
import 'package:serpismotor2/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../providers/auth_provider.dart';

class SplashPage extends StatefulWidget {
  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    getInit();

    super.initState();
  }

  getInit() async {
    await Provider.of<ProductProvider>(context, listen: false).getProducts();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // var status = prefs.getBool('isLoggedIn') ?? false;
    // print(status);
    // if (status) {
    //   Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
    // } else {
    //   Navigator.pushNamedAndRemoveUntil(context, '/sign-in', (route) => false);
    // }
  }

  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    getInit() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var status = prefs.getBool('isLoggedIn') ?? false;
      print(status);
      if (status) {
        if (await authProvider.login(
            email: prefs.getString('email'), password: prefs.getString('pw')?? null)) {
          Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);

        }
      }else{
        Navigator.pushNamedAndRemoveUntil(context, '/sign-in', (route) => false);
      }
    }

    setState(() {
      getInit();
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          width: 500,
          height: 500,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/servismoputih.png'))),
        ),

      ),
    );

  }
}
