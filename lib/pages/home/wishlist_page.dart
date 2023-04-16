import 'package:flutter/material.dart';
import 'package:serpismotor2/theme.dart';
import 'package:serpismotor2/widgets/wishlist_card.dart';

class WishlistPage extends StatelessWidget {
  @override


  Widget build(BuildContext context) {

    Widget header() {
      return AppBar(
        backgroundColor: backgroundColor1,
        centerTitle: true,
        title: Text(
          "Favorite Shoes",
        ),
        elevation: 0,
        automaticallyImplyLeading: false,
      );
    }

    Widget emptyWishList() {
      return Expanded(
          child: Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: defaultMargin),
            color: backgroundColor3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images_wishlist.png',
                  width: 74,
                ),
                SizedBox(
                  height: 23,
                ),
                Text(
                  ' You don\'t have dream shoes?',
                  style: primaryTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  'Let\'s find your favorite shoes',
                  style: secondaryTextStyle,
                ),
                SizedBox(
                  height: 20,
                ),
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.fromLTRB(24, 24, 24, 10),
                    backgroundColor: primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Container(
                    height: 44,
                    child: Text(
                      'Explore Store',
                      style: primaryTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: medium,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ));
    }
    
    Widget content() {
      return Expanded(
          child: Container(
            color: backgroundColor3,
            child: ListView(
              padding: EdgeInsets.symmetric(
                horizontal: defaultMargin,
              ),
              children: [
                WishlistCard(),
                WishlistCard(),
                WishlistCard(),

              ],
            ),
          ),
      );
    }
    return Column(
      children: [
        header(),
        // emptyWishList(),
        content(),
      ],
    );
  }
}
