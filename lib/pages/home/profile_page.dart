import 'package:flutter/material.dart';
import 'package:serpismotor2/theme.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget header() {
      return AppBar(
        backgroundColor: backgroundColor1,
        automaticallyImplyLeading: false,
        elevation: 0,
        flexibleSpace: SafeArea(
          child: Container(
            padding: EdgeInsets.all(
                defaultMargin,
            ),
            child: Row(
              children: [
                ClipOval(
                  child: Image.asset(
                      'assets/image_profile.png',
                    width: 64,
                  ),

                ),
                SizedBox(
                  width: 16,
                ),
                Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            'Hallo, bambe',
                          style: primaryTextStyle.copyWith(
                            fontSize: 24,
                            fontWeight: semibold,
                          ),
                        ),
                        Text(
                          '@bambegresik',
                          style: primaryTextStyle.copyWith(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    )
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/sign-in', (route) => false);
                  },
                  child: Image.asset(
                    'assets/button_exit.png',
                    width: 20,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    Widget menuItem(String text) {
      return Container(
        margin: EdgeInsets.only(
          top: 16,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text, style: secondaryTextStyle.copyWith(
              fontSize: 13,
            ),
            ),
            Icon(
              Icons.chevron_right,
              color: primaryTextColor,
            ),
          ],
        ),
      );
    }

    Widget content(){
      return Expanded(
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(
              horizontal: defaultMargin,
            ),
            decoration: BoxDecoration(
              color: backgroundColor3,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Account',
                  style: primaryTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: semibold,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/edit-profile');
                  },
                  child: menuItem(
                    'Edit Profile',
                  ),
                ),
                menuItem(
                  'Your Orders',
                ),
                menuItem(
                  'Help',
                ),

                SizedBox(
                  height: 30,
                ),
                Text(
                  'General',
                  style: primaryTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: semibold,
                  ),
                ),

                menuItem(
                  'Privacy & Policy',
                ),
                menuItem(
                  'Terms of Service',
                ),
                menuItem(
                  'Rate App',
                ),
              ],
            ),
          ),
      );
    }
    return Column(
      children: [
        header(),
        content(),
      ],
    );
  }
}
