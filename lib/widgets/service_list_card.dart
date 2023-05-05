import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:serpismotor2/models/transaction_model.dart';
import 'package:serpismotor2/theme.dart';

class ServiceListCard extends StatelessWidget {
  // const ServiceListCard({super.key});
  final TransactionModel transaction;
  ServiceListCard(this.transaction);

  totalItem() {
    int total = 0;
    for (var item in transaction.items) {
      total += item.quantity;
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    Widget itemService() {
      return Container(
        margin: EdgeInsets.only(
          top: 15,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  'https://dashboard.servismo.me${transaction.items[0].product.galleries[0].url}',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  transaction.items[0].product.category.name,
                  style: subtitleTextStyle.copyWith(
                    fontSize: 12,
                    fontWeight: medium,
                  ),
                ),
                Text(
                  transaction.items[0].product.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: primaryTextStyle.copyWith(
                    fontWeight: semibold,
                  ),
                ),
                Text(
                  transaction.items[0].quantity.toString(),
                  style: subtitleTextStyle.copyWith(
                    fontSize: 12,
                    fontWeight: medium,
                  ),
                )
              ],
            )
          ],
        ),
      );
    }

    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      margin: EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        color: whiteColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 0.3,
            spreadRadius: 0.5,
          )
        ],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.home_max_outlined,
                size: 30,
                color: subtitleColor,
              ),
              SizedBox(
                width: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    transaction.address,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: primaryTextStyle.copyWith(
                      fontWeight: semibold,
                    ),
                  ),
                  Text(
                    DateFormat('EEEE, dd MMMM yyyy')
                        .format(transaction.updatedAt),
                    style: subtitleTextStyle.copyWith(
                      fontWeight: medium,
                      fontSize: 12,
                    ),
                  )
                ],
              )
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Divider(
            height: 0.5,
            color: subtitleColor,
          ),
          const SizedBox(
            height: 10,
          ),
          Column(
            children: [
              itemService(),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          // Divider(
          //   height: 0.5,
          //   color: subtitleColor,
          // ),
          // const SizedBox(
          //   height: 10,
          // ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Total",
                    style: primaryTextStyle.copyWith(
                      fontWeight: medium,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    "${totalItem()} Items",
                    style: primaryTextStyle.copyWith(
                      fontWeight: semibold,
                    ),
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    transaction.totalPrice.toString(),
                    style: primaryTextStyle.copyWith(
                      fontWeight: semibold,
                      fontSize: 16,
                    ),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
