import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:serpismotor2/models/transaction_model.dart';
import 'package:serpismotor2/providers/auth_provider.dart';
import 'package:serpismotor2/providers/cart_provider.dart';
import 'package:serpismotor2/providers/transaction_provider.dart';
import 'package:serpismotor2/theme.dart';
import 'package:serpismotor2/widgets/checkout_card.dart';
import 'package:serpismotor2/widgets/service_list_item_card.dart';

class ServiceListDetail extends StatefulWidget {
  // ServiceListDetail({Key? key}) : super(key: key);
  TransactionModel transaction;
  ServiceListDetail(this.transaction);

  @override
  State<ServiceListDetail> createState() => _ServiceListDetailState();
}

class _ServiceListDetailState extends State<ServiceListDetail> {
  totalItem() {
    int total = 0;
    for (var item in widget.transaction.items) {
      total += item.quantity;
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    TransactionProvider transactionProvider =
        Provider.of<TransactionProvider>(context);

    Widget header() {
      return AppBar(
        backgroundColor: backgroundColor1,
        centerTitle: true,
        toolbarHeight: 80,
        title: Column(
          children: [
            Text(
              "Service List Detail",
              style: primaryTextStyle.copyWith(fontWeight: semibold),
            ),
            Text(
              widget.transaction.address,
              style: subtitleTextStyle.copyWith(
                fontWeight: medium,
                fontSize: 12,
              ),
            )
          ],
        ),
        elevation: 0,
        automaticallyImplyLeading: false,
      );
    }

    Widget content() {
      return Expanded(
        child: ListView(
          padding: EdgeInsets.symmetric(
            horizontal: defaultMargin,
          ),
          children: [
            // LIST ITEMS
            Container(
              margin: const EdgeInsets.only(
                top: 14,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Text(
                  //   'List Items',
                  //   style: primaryTextStyle.copyWith(
                  //     fontSize: 16,
                  //     fontWeight: medium,
                  //   ),
                  // ),
                  ...widget.transaction.items
                      .map((item) => ServiceListItemCard(item))
                      .toList()
                ],
              ),
            ),

            //note : summary
            Container(
              margin: EdgeInsets.only(
                top: defaultMargin,
              ),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Summary',
                    style: primaryTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: medium,
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total Quantity',
                        style: secondaryTextStyle.copyWith(
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        '${totalItem().toString()} Items',
                        style: primaryTextStyle.copyWith(
                          fontWeight: medium,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total Price',
                        style: secondaryTextStyle.copyWith(
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        NumberFormat.currency(
                          locale:
                              'id', // sesuaikan dengan locale yang diinginkan
                          symbol: '',
                          decimalDigits: 0, // jumlah digit dibelakang koma
                        ).format(widget.transaction.totalPrice),
                        style: priceTextStyle.copyWith(
                          fontWeight: medium,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Divider(
                    thickness: 1,
                    color: Color(0xff2E3141),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total',
                        style: priceTextStyle.copyWith(
                          fontWeight: semibold,
                        ),
                      ),
                      Text(
                        NumberFormat.currency(
                          locale:
                              'id', // sesuaikan dengan locale yang diinginkan
                          symbol: 'Rp. ',
                          decimalDigits: 0, // jumlah digit dibelakang koma
                        ).format(widget.transaction.totalPrice),
                        style: priceTextStyle.copyWith(
                          fontWeight: semibold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor1,
      floatingActionButton: Padding(
        padding: EdgeInsets.only(top: 14),
        child: FloatingActionButton(
          heroTag: null,
          mini: true,
          onPressed: () {
            Navigator.pop(context);
          },
          child: Image.asset(
            "assets/icon_back.png",
            color: blackColor,
            height: 18,
          ),
          backgroundColor:
              primaryColor, // sesuaikan dengan warna yang diinginkan
          shape: CircleBorder(),
          elevation: 1,
          // set shape menjadi CircleBorder
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      body: Column(
        children: [header(), content()],
      ),
    );
  }
}
