import 'package:flutter/material.dart';
import 'package:serpismotor2/theme.dart';
import 'package:provider/provider.dart';
import 'package:serpismotor2/providers/auth_provider.dart';
import 'package:serpismotor2/widgets/loading_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInPage extends StatefulWidget {
  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController emailController = TextEditingController(text: '');

  TextEditingController passwordController = TextEditingController(text: '');

  bool isLoading = false;
  var _isObscure;

  @override
  void initState() {
    super.initState();
    _isObscure = true;
  }

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    handleSignIn() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      setState(() {
        isLoading = true;
      });

      if (await authProvider.login(
          email: emailController.text, password: passwordController.text)) {
        prefs.setBool("isLoggedIn", true);
        prefs.setString('pw', passwordController.text);
        prefs.setString('email', emailController.text);
        Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: alertColor,
            content: Text(
              'Failed to login',
              textAlign: TextAlign.center,
            ),
          ),
        );
      }

      setState(() {
        isLoading = false;
      });
    }

    Widget header() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Login',
              style: primaryTextStyle.copyWith(
                fontSize: 24,
                fontWeight: semibold,
              ),
            ),
            SizedBox(
              height: 2,
            ),
            Text(
              'Sign In to Continue',
              style: subtitleTextStyle,
            )
          ],
        ),
      );
    }

    Widget emailInput() {
      return Container(
        margin: EdgeInsets.only(top: 70),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Email Address',
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              height: 50,
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                  color: whiteColor, borderRadius: BorderRadius.circular(12)),
              child: Center(
                child: Row(
                  children: [
                    Image.asset(
                      'assets/icon_email.png',
                      width: 17,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                        child: TextFormField(
                      controller: emailController,
                      textInputAction: TextInputAction.next,
                      style: primaryTextStyle,
                      decoration: InputDecoration.collapsed(
                        hintText: 'Your Email Address',
                        hintStyle: subtitleTextStyle,
                      ),
                    ))
                  ],
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget passwordInput() {
      return Container(
        margin: EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Password',
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              height: 50,
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Row(
                  children: [
                    Image.asset(
                      'assets/icon_password.png',
                      width: 17,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: passwordController,
                        style: primaryTextStyle,
                        obscureText: _isObscure, // gunakan kondisi _isObscure
                        decoration: InputDecoration.collapsed(
                          hintText: 'Your Password',
                          hintStyle: subtitleTextStyle,
                        ),
                      ),
                    ),
                    IconButton(
                      splashColor: Colors.transparent,
                      splashRadius: 1,
                      icon: Icon(
                        _isObscure ? Icons.visibility : Icons.visibility_off,
                        color: subtitleColor,
                      ),
                      onPressed: () {
                        setState(() {
                          _isObscure =
                              !_isObscure; // toggle kondisi _isObscure ketika button ditekan
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }
    // Widget passwordInput() {
    //   return Container(
    //     margin: EdgeInsets.only(top: 20),
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         Text(
    //           'Password',
    //           style: primaryTextStyle.copyWith(
    //             fontSize: 16,
    //             fontWeight: medium,
    //           ),
    //         ),
    //         SizedBox(
    //           height: 12,
    //         ),
    //         Container(
    //           height: 50,
    //           padding: EdgeInsets.symmetric(
    //             horizontal: 16,
    //           ),
    //           decoration: BoxDecoration(
    //               color: whiteColor, borderRadius: BorderRadius.circular(12)),
    //           child: Center(
    //             child: Row(
    //               children: [
    //                 Image.asset(
    //                   'assets/icon_password.png',
    //                   width: 17,
    //                 ),
    //                 SizedBox(
    //                   width: 16,
    //                 ),
    //                 Expanded(
    //                     child: TextFormField(
    //                   controller: passwordController,
    //                   style: primaryTextStyle,
    //                   obscureText: true,
    //                   decoration: InputDecoration.collapsed(
    //                     hintText: 'Your Password',
    //                     hintStyle: subtitleTextStyle,
    //                   ),
    //                 ))
    //               ],
    //             ),
    //           ),
    //         )
    //       ],
    //     ),
    //   );
    // }

    Widget signInButton() {
      return Container(
        height: 50,
        width: double.infinity,
        margin: EdgeInsets.only(top: 30),
        child: TextButton(
            style: TextButton.styleFrom(
                backgroundColor: primaryColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12))),
            onPressed: handleSignIn,
            child: Text(
              'Sign In',
              style:
                  primaryTextStyle.copyWith(fontSize: 16, fontWeight: medium),
            )),
      );
    }

    Widget footer() {
      return Container(
        margin: EdgeInsets.only(bottom: 30),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            'Don\'t have an account? ',
            style: subtitleTextStyle.copyWith(),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/sign-up');
            },
            child: Text(
              'Sign Up',
              style: purpleTextStyle.copyWith(fontSize: 12, fontWeight: bold),
            ),
          )
        ]),
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: backgroundColor1,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: defaultMargin),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                header(),
                emailInput(),
                passwordInput(),
                isLoading ? LoadingButton() : signInButton(),
                Spacer(),
                footer()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
