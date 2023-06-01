import 'package:flutter/material.dart';
import 'package:serpismotor2/providers/auth_provider.dart';
import 'package:serpismotor2/theme.dart';
import 'package:provider/provider.dart';
import 'package:serpismotor2/widgets/loading_button.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:auto_validate/auto_validate.dart';

class SignUpPage extends StatefulWidget {
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController nameController = TextEditingController(text: '');

  TextEditingController usernameController = TextEditingController(text: '');

  TextEditingController emailController = TextEditingController(text: '');

  TextEditingController passwordController = TextEditingController(text: '');

  TextEditingController verifpasswordController =
      TextEditingController(text: '');

  bool isLoading = false;
  var _isObscure;
  var _isObscure2;

  @override
  void initState() {
    super.initState();
    _isObscure = true;
    _isObscure2 = true;
  }

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    handleSignUp() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      setState(() {
        isLoading = true;
      });
      if (AutoValidate.alphanumericWithSpaces(nameController.text.toString()) ==
              false ||
          AutoValidate.minLength(nameController.text.toString(), 5) == false) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: alertColor,
            content: Text(
              'Must contains your name and minimum 5 characters',
              textAlign: TextAlign.center,
            ),
          ),
        );
      } else if (AutoValidate.userName(usernameController.text.toString()) ==
          false) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: alertColor,
            content: Text(
              'Username Must contains Alphanumeric, underscores and hyphens and its long between 3 to 16 characters',
              textAlign: TextAlign.center,
            ),
          ),
        );
      } else if (AutoValidate.email(emailController.text.toString()) == false) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: alertColor,
            content: Text(
              'Must contains example@example.com',
              textAlign: TextAlign.center,
            ),
          ),
        );
      } else if (AutoValidate.minLength(
              passwordController.text.toString(), 8) ==
          false) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: alertColor,
            content: Text(
              'Password must contains at least 8 characters',
              textAlign: TextAlign.center,
            ),
          ),
        );
      } else if (AutoValidate.match(verifpasswordController.text.toString(),
              passwordController.text.toString())! ==
          false) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: alertColor,
            content: Text(
              'Please re-enter your password correctly',
              textAlign: TextAlign.center,
            ),
          ),
        );
      } else if (await authProvider.register(
          name: nameController.text,
          username: usernameController.text,
          email: emailController.text,
          password: passwordController.text)) {
        prefs.setBool("isLoggedIn", true);
        prefs.setString('pw', passwordController.text);
        prefs.setString('email', emailController.text);
        Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: alertColor,
            content: Text(
              'Failed to register user',
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
              'Sign Up',
              style: primaryTextStyle.copyWith(
                fontSize: 24,
                fontWeight: semibold,
              ),
            ),
            SizedBox(
              height: 2,
            ),
            Text(
              // 'Register and Happy Shopping',
              'Register to Explore',
              style: subtitleTextStyle,
            )
          ],
        ),
      );
    }

    Widget nameInput() {
      return Container(
        margin: EdgeInsets.only(top: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Full Name',
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
                border: nameController.text.isEmpty
                    ? Border.all(color: Colors.transparent)
                    : AutoValidate.alphanumericWithSpaces(
                                nameController.text.toString())! &&
                            AutoValidate.minLength(
                                nameController.text.toString(), 5)!
                        ? Border.all(color: Colors.transparent)
                        : Border.all(color: alertColor),
              ),
              child: Center(
                child: Row(
                  children: [
                    Image.asset(
                      'assets/icon_name.png',
                      width: 17,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: nameController,
                        autovalidateMode: AutovalidateMode.always,
                        validator: FormValidator.combination(validators: [
                          FormValidator.alphanumericWithSpaces(),
                          FormValidator.minLength(minLength: 5)
                        ]),
                        textInputAction: TextInputAction.next,
                        style: primaryTextStyle,
                        decoration: InputDecoration.collapsed(
                          hintText: 'Your Full Name',
                          hintStyle: subtitleTextStyle,
                        ),
                        onChanged: (_) => setState(() {}),
                      ),
                    ),
                    // nameController.text.isEmpty
                    //     ? Icon(Icons.check, color: Colors.transparent)
                    //     : AutoValidate.alphanumericWithSpaces(
                    //                 nameController.text.toString())! &&
                    //             AutoValidate.minLength(
                    //                 nameController.text.toString(), 5)!
                    //         ? Icon(Icons.check, color: Colors.green)
                    //         : Icon(Icons.close, color: alertColor),
                  ],
                ),
              ),
            ),
            nameController.text.isEmpty
                ? SizedBox()
                : AutoValidate.alphanumericWithSpaces(
                            nameController.text.toString())! &&
                        AutoValidate.minLength(
                            nameController.text.toString(), 5)!
                    ? SizedBox()
                    : Row(
                        children: [
                          // Icon(
                          //   Icons.close,
                          //   color: alertColor,
                          // ),
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 10.0, top: 8),
                              child: Text(
                                'Must contains your name and minimum 5 characters',
                                overflow: TextOverflow.clip,
                                style: primaryTextStyle.copyWith(
                                  fontSize: 11,
                                  fontWeight: medium,
                                  color: alertColor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
          ],
        ),
      );
    }

    Widget usernameInput() {
      return Container(
        margin: EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Username',
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
                border: usernameController.text.isEmpty
                    ? Border.all(color: Colors.transparent)
                    : AutoValidate.userName(usernameController.text.toString())!
                        ? Border.all(color: Colors.transparent)
                        : Border.all(color: alertColor),
              ),
              child: Center(
                child: Row(
                  children: [
                    Image.asset(
                      'assets/icon_username.png',
                      width: 17,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                        child: TextFormField(
                      controller: usernameController,
                      textInputAction: TextInputAction.next,
                      style: primaryTextStyle,
                      decoration: InputDecoration.collapsed(
                        hintText: 'Your Username',
                        hintStyle: subtitleTextStyle,
                      ),
                      onChanged: (_) => setState(() {}),
                      autovalidateMode: AutovalidateMode.always,
                      validator: FormValidator.userName(),
                      // validator: (value) {
                      //   if (value!.contains(' ')) {
                      //     return 'Username cannot contain spaces';
                      //   }
                      //   return null;
                      // },
                    )),
                    // usernameController.text.isEmpty
                    //     ? SizedBox()
                    //     : AutoValidate.userName(
                    //             usernameController.text.toString())!
                    //         ? Icon(Icons.check, color: Colors.green)
                    //         : Icon(Icons.close, color: alertColor),
                  ],
                ),
              ),
            ),
            usernameController.text.isEmpty
                ? SizedBox()
                : AutoValidate.userName(usernameController.text.toString())!
                    ? SizedBox()
                    : Row(
                        children: [
                          // Icon(
                          //   Icons.close,
                          //   color: alertColor,
                          // ),
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 10.0, top: 8),
                              child: Text(
                                'Must contains Alphanumeric, underscores and hyphens and its long between 3 to 16 characters',
                                overflow: TextOverflow.clip,
                                style: primaryTextStyle.copyWith(
                                    fontSize: 11,
                                    fontWeight: medium,
                                    color: alertColor),
                              ),
                            ),
                          ),
                        ],
                      ),
          ],
        ),
      );
    }

    Widget emailInput() {
      return Container(
        margin: EdgeInsets.only(top: 20),
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
                color: whiteColor,
                borderRadius: BorderRadius.circular(12),
                border: emailController.text.isEmpty
                    ? Border.all(color: Colors.transparent)
                    : AutoValidate.email(emailController.text.toString())!
                        ? Border.all(color: Colors.transparent)
                        : Border.all(color: alertColor),
              ),
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
                      onChanged: (_) => setState(() {}),
                    )),
                    // emailController.text.isEmpty
                    //     ? SizedBox()
                    //     : AutoValidate.email(emailController.text.toString())!
                    //         ? Icon(Icons.check, color: Colors.green)
                    //         : Icon(Icons.close, color: alertColor),
                  ],
                ),
              ),
            ),
            emailController.text.isEmpty
                ? SizedBox()
                : AutoValidate.email(emailController.text.toString())!
                    ? SizedBox()
                    : Row(
                        children: [
                          // Icon(
                          //   Icons.close,
                          //   color: alertColor,
                          // ),
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 10.0, top: 8),
                              child: Text(
                                'Must contains example@example.com',
                                overflow: TextOverflow.clip,
                                style: primaryTextStyle.copyWith(
                                    fontSize: 11,
                                    fontWeight: medium,
                                    color: alertColor),
                              ),
                            ),
                          ),
                        ],
                      ),
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
                border: passwordController.text.isEmpty
                    ? Border.all(color: Colors.transparent)
                    : AutoValidate.minLength(
                            passwordController.text.toString(), 8)!
                        ? Border.all(color: Colors.transparent)
                        : Border.all(color: alertColor),
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

                        textInputAction: TextInputAction.next,
                        obscureText: _isObscure, // gunakan kondisi _isObscure
                        decoration: InputDecoration.collapsed(
                          hintText: 'Your Password',
                          hintStyle: subtitleTextStyle,
                        ),
                        onChanged: (_) => setState(() {}),
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
                    // passwordController.text.isEmpty
                    //     ? SizedBox()
                    //     : AutoValidate.minLength(
                    //             passwordController.text.toString(), 8)!
                    //         ? Icon(Icons.check, color: Colors.green)
                    //         : Icon(Icons.close, color: alertColor),
                  ],
                ),
              ),
            ),
            passwordController.text.isEmpty
                ? SizedBox()
                : AutoValidate.minLength(passwordController.text.toString(), 8)!
                    ? SizedBox()
                    : Row(
                        children: [
                          // Icon(
                          //   Icons.close,
                          //   color: alertColor,
                          // ),
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 10.0, top: 8),
                              child: Text(
                                'Password must contains at least 8 characters',
                                overflow: TextOverflow.clip,
                                style: primaryTextStyle.copyWith(
                                  fontSize: 11,
                                  fontWeight: medium,
                                  color: alertColor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
          ],
        ),
      );
    }

    Widget verifpasswordInput() {
      return Container(
        margin: EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Re-Enter Password',
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
                border: verifpasswordController.text.isEmpty
                    ? Border.all(color: Colors.transparent)
                    : AutoValidate.match(
                            verifpasswordController.text.toString(),
                            passwordController.text.toString())!
                        ? Border.all(color: Colors.transparent)
                        : Border.all(color: alertColor),
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
                        controller: verifpasswordController,
                        style: primaryTextStyle,
                        obscureText: _isObscure2, // gunakan kondisi _isObscure
                        decoration: InputDecoration.collapsed(
                          hintText: 'Re-Enter Password',
                          hintStyle: subtitleTextStyle,
                        ),
                        onChanged: (_) => setState(() {}),
                      ),
                    ),
                    IconButton(
                      splashColor: Colors.transparent,
                      splashRadius: 1,
                      icon: Icon(
                        _isObscure2 ? Icons.visibility : Icons.visibility_off,
                        color: subtitleColor,
                      ),
                      onPressed: () {
                        setState(() {
                          _isObscure2 =
                              !_isObscure2; // toggle kondisi _isObscure ketika button ditekan
                        });
                      },
                    ),
                    // verifpasswordController.text.isEmpty
                    //     ? SizedBox()
                    //     : AutoValidate.match(
                    //             verifpasswordController.text.toString(),
                    //             passwordController.text.toString())!
                    //         ? Icon(Icons.check, color: Colors.green)
                    //         : Icon(Icons.close, color: alertColor),
                  ],
                ),
              ),
            ),
            verifpasswordController.text.isEmpty
                ? SizedBox()
                : AutoValidate.match(verifpasswordController.text.toString(),
                        passwordController.text.toString())!
                    ? SizedBox()
                    : Row(
                        children: [
                          // Icon(
                          //   Icons.close,
                          //   color: alertColor,
                          // ),
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 10.0, top: 8),
                              child: Text(
                                'Please re-enter your password correctly',
                                overflow: TextOverflow.clip,
                                style: primaryTextStyle.copyWith(
                                  fontSize: 11,
                                  fontWeight: medium,
                                  color: alertColor,
                                ),
                              ),
                            ),
                          ),
                        ],
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

    Widget signUpButton() {
      return Container(
        height: 50,
        width: double.infinity,
        margin: EdgeInsets.only(top: 30),
        child: TextButton(
            style: TextButton.styleFrom(
                backgroundColor: primaryColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12))),
            onPressed: handleSignUp,
            child: Text(
              'Sign Up',
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
            'Already have an account? ',
            style: subtitleTextStyle.copyWith(),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Text(
              'Sign In',
              style: purpleTextStyle.copyWith(fontSize: 12, fontWeight: bold),
            ),
          )
        ]),
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: backgroundColor1,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: defaultMargin),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 1.2,
            child: ListView(
              physics: BouncingScrollPhysics(),
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                header(),
                nameInput(),
                usernameInput(),
                emailInput(),
                passwordInput(),
                verifpasswordInput(),
                isLoading ? LoadingButton() : signUpButton(),
                SizedBox(
                  height: 20,
                ),
                footer()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
