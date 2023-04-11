import 'package:flutter/material.dart';
import 'package:tokosepatu/theme.dart';
import 'package:tokosepatu/widgets/chat_bubble.dart';

class DetailChatPage extends StatelessWidget {
  const DetailChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget header() {
      return PreferredSize(
          child: AppBar(
            backgroundColor: backgroundColor3,
            elevation: 0,
            centerTitle: false,
            toolbarHeight: 80,
            title: Center(
              child: Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/image_shop_logo_online.png',
                      width: 50,
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Shoe Store',
                          style: primaryTextStyle.copyWith(
                            fontWeight: medium,
                          ),
                        ),
                        Text(
                          'Online',
                          style: secondaryTextStyle,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          preferredSize: Size.fromHeight(80));
    }

    Widget productPriview() {
      return Container(
        width: 225,
        height: 74,
        margin: EdgeInsets.only(bottom: 20),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: backgroundColor5,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: primaryColor)),
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              'assets/image_shoes.png',
              width: 54,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'COURT VISO 2.0 COURT VISO 2.0',
                  overflow: TextOverflow.ellipsis,
                  style: primaryTextStyle,
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  '\$57,15',
                  style: priceTextStyle.copyWith(fontWeight: medium),
                )
              ],
            ),
          ),
          Image.asset(
            'assets/button_close.png',
            height: 22,
          )
        ]),
      );
    }

    Widget chatInput() {
      return Container(
        margin: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            productPriview(),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 45,
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: backgroundColor4,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: TextFormField(
                        decoration: InputDecoration.collapsed(
                            hintText: 'Type Message...',
                            hintStyle: subtitleTextStyle),
                        style: primaryTextStyle,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: primaryColor),
                  child: Center(
                    child: Image.asset(
                      'assets/icon_submit.png',
                      height: 20,
                      width: 23,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      );
    }

    Widget content() {
      return ListView(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        children: [
          ChatBubble(
            isSender: true,
            text: 'Hai, item ini masih ada?',
            hasProduct: true,
          ),
          ChatBubble(
            isSender: false,
            text: 'Selamat malam, item ini hanya tersedia ukuran 42 dan 45',
          )
        ],
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor3,
      appBar: header(),
      bottomNavigationBar: chatInput(),
      body: content(),
    );
  }
}
