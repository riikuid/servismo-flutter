import 'package:flutter/material.dart';
import 'package:serpismotor2/theme.dart';

class ChatTile extends StatelessWidget {
  const ChatTile({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/detail-chat');
      },
      child: Container(
        margin: EdgeInsets.only(top: 33),
        child: Column(children: [
          Row(
            children: [
              Image.asset(
                'assets/image_shop_logo.png',
                width: 54,
              ),
              SizedBox(
                width: 12,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Shoe Store',
                      style: primaryTextStyle.copyWith(
                          fontSize: 15, fontWeight: medium),
                    ),
                    Text(
                      'Good night, This item is on Airplane, Good night, This item is on Airplane',
                      style: secondaryTextStyle,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              Text(
                'Now',
                style: secondaryTextStyle.copyWith(fontSize: 10),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Divider(
            thickness: 1,
            color: Color(0xFF2B2939),
          )
        ]),
      ),
    );
  }
}
