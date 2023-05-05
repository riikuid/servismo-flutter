import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:serpismotor2/models/cart_model.dart';
import 'package:serpismotor2/theme.dart';

class CheckoutCard extends StatelessWidget {
  CheckoutCard(this.cart);
  final CartModel cart;

  // const CheckoutCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 12,
      ),
      padding: EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 12,
      ),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: NetworkImage(
                    'https://dashboard.servismo.me${cart.product.galleries[0].url}'),
              ),
            ),
          ),
          SizedBox(
            width: 12,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cart.product.name,
                  style: primaryTextStyle.copyWith(
                    fontWeight: semibold,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  NumberFormat.currency(
                    locale: 'id', // sesuaikan dengan locale yang diinginkan
                    symbol: 'Rp. ',
                    decimalDigits: 0, // jumlah digit dibelakang koma
                  ).format(cart.product.price),
                  style: priceTextStyle.copyWith(
                    fontWeight: medium,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 12,
          ),
          Text(
            '${cart.quantity} items',
            style: secondaryTextStyle.copyWith(
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
