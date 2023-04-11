import 'package:flutter/material.dart';
import 'package:tokosepatu/theme.dart';

class WishlistPage extends StatelessWidget {
  @override
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

  Widget emptWishList() {
    return Expanded(
        child: Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: defaultMargin),
      color: backgroundColor3,
      child: Column(
        children: [],
      ),
    ));
  }

  Widget build(BuildContext context) {
    return Column(
      children: [
        header(),
      ],
    );
  }
}
