import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:serpismotor2/models/transaction_model.dart';
import 'package:serpismotor2/pages/service_list_detail.dart';
import 'package:serpismotor2/providers/auth_provider.dart';
import 'package:serpismotor2/providers/transaction_provider.dart';
import 'package:serpismotor2/theme.dart';

class ServiceListCard extends StatefulWidget {
  // const ServiceListCard({super.key});
  final TransactionModel transaction;
  ServiceListCard(this.transaction);

  @override
  State<ServiceListCard> createState() => _ServiceListCardState();
}

class _ServiceListCardState extends State<ServiceListCard> {
  totalItemSparePart() {
    int total = 0;
    for (var item in widget.transaction.items) {
      if (item.product.category.id == 1) {
        total += 1;
      }
    }
    return total;
  }

  totalItemServis() {
    int total = 0;
    for (var item in widget.transaction.items) {
      if (item.product.category.id == 1) {
        total += 0;
      } else {
        total += 1;
      }
    }
    return total;
  }

  bool serviceKosong = false;

  bool sparePartKosong = false;

  bool tampilkanItemLain = false;

  String totalItemTransaction() {
    String text =
        "${totalItemServis()} Service & ${totalItemSparePart()} Spare Part";
    if (totalItemServis() == 0) {
      text = "${totalItemSparePart()} Spare Part";
    }
    if (totalItemSparePart() == 0) {
      text = "${totalItemServis()} Service";
    }
    return text;
  }

  @override
  Widget build(BuildContext context) {
    TransactionProvider transactionProvider =
        Provider.of<TransactionProvider>(context);
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    Widget itemLain() {
      return Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Divider(
            height: 0.5,
            color: subtitleColor,
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            "Tampilkan Item Lainnya",
            style: subtitleTextStyle.copyWith(
              fontSize: 12,
            ),
          ),
          const SizedBox(
            height: 2,
          ),
          Divider(
            height: 0.5,
            color: subtitleColor,
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      );
    }

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: ((context) => ServiceListDetail(widget.transaction)),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        margin: EdgeInsets.only(bottom: 15),
        decoration: BoxDecoration(
          color: whiteColor,
          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.black.withOpacity(0.3),
          //     blurRadius: 0.3,
          //     spreadRadius: 0.5,
          //   )
          // ],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 5.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.transaction.address,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: primaryTextStyle.copyWith(
                            fontWeight: semibold,
                          ),
                        ),
                        Text(
                          DateFormat('EE, dd MMMM yyyy')
                              .format(widget.transaction.updatedAt),
                          style: subtitleTextStyle.copyWith(
                            fontWeight: medium,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    transactionProvider.deleteTransaction(
                        authProvider.user.token!, widget.transaction.id);
                  },
                  child: Icon(
                    Icons.delete,
                    color: alertColor,
                    size: 20,
                  ),
                ),
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
            Container(
              margin: EdgeInsets.only(
                top: 15,
              ),
              child: Expanded(
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
                          'https://dashboard.servismo.me${widget.transaction.items[0].product.galleries[0].url}',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.transaction.items[0].product.category.name,
                            style: subtitleTextStyle.copyWith(
                              fontSize: 12,
                              fontWeight: medium,
                            ),
                          ),
                          Text(
                            widget.transaction.items[0].product.name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: primaryTextStyle.copyWith(
                              fontWeight: semibold,
                            ),
                          ),
                          Text(
                            'x${widget.transaction.items[0].quantity.toString()}',
                            style: subtitleTextStyle.copyWith(
                              fontSize: 12,
                              fontWeight: medium,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
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
                      totalItemTransaction(),
                      style: primaryTextStyle.copyWith(
                        fontWeight: semibold,
                        fontSize: 12,
                      ),
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      NumberFormat.currency(
                        locale: 'id', // sesuaikan dengan locale yang diinginkan
                        symbol: 'Rp. ',
                        decimalDigits: 0, // jumlah digit dibelakang koma
                      ).format(widget.transaction.totalPrice),
                      style: priceTextStyle.copyWith(
                        fontWeight: bold,
                        fontSize: 16,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
