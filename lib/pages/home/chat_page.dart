import 'package:flutter/material.dart';
import 'package:serpismotor2/theme.dart';
import 'package:serpismotor2/widgets/chat_tile.dart';

class ChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget header() {
      return AppBar(
        backgroundColor: backgroundColor1,
        centerTitle: true,
        toolbarHeight: 80,
        title: Text(
          'Message Support',
          style: primaryTextStyle.copyWith(
            fontSize: 18,
            fontWeight: semibold,
          ),
        ),
        elevation: 0,
        automaticallyImplyLeading: false,
      );
    }

    Widget content() {
      return Expanded(
          child: Container(
        color: backgroundColor3,
        width: double.infinity,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          children: [
            ChatTile(),
            ChatTile(),
            ChatTile(),
          ],
        ),
      ));
    }

    Widget emptyChat() {
      return Expanded(
          child: Container(
        color: backgroundColor3,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/icon_headset.png',
              width: 80,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Opss no message yet?',
              style:
                  primaryTextStyle.copyWith(fontSize: 16, fontWeight: semibold),
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              'You have never done a transaction',
              style: secondaryTextStyle.copyWith(fontWeight: medium),
            ),
            SizedBox(
              height: 20,
            ),
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                  backgroundColor: primaryColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12))),
              child: Text(
                'Explore Store',
                style:
                    primaryTextStyle.copyWith(fontSize: 16, fontWeight: medium),
              ),
            )
          ],
        ),
      ));
    }

    return Column(
      children: [header(), content()],
    );
  }
}
