import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:serpismotor2/models/cart_model.dart';
import 'package:serpismotor2/models/transaction_model.dart';
import 'package:serpismotor2/theme.dart';

import '../models/transaction_item_model.dart';

class ServiceListItemCard extends StatelessWidget {
  ServiceListItemCard(this.item);
  final TransactionItemModel item;

  // const ServiceListItemCard({Key? key}) : super(key: key);

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
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                    'https://dashboard.servismo.me${item.product.galleries[0].url}'),
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
                  item.product.category.name,
                  style: subtitleTextStyle.copyWith(
                    fontWeight: semibold,
                    fontSize: 12,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  item.product.name,
                  style: primaryTextStyle.copyWith(
                    fontWeight: semibold,
                  ),
                  maxLines: 1,
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
                  ).format(item.product.price),
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
            'x${item.quantity}',
            style: secondaryTextStyle.copyWith(
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
