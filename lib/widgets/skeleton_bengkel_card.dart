import 'package:flutter/material.dart';
import 'package:serpismotor2/models/product_model.dart';
import 'package:serpismotor2/pages/home/service_page.dart';
import 'package:serpismotor2/pages/service_detail.dart';
import 'package:serpismotor2/pages/service_detail_bengkel.dart';
import 'package:serpismotor2/theme.dart';
import '../models/category_model.dart';
import 'package:intl/intl.dart';

class SkeletonBengkelCard extends StatelessWidget {
  const SkeletonBengkelCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: MediaQuery.of(context).size.width / 3.5,
      // height: MediaQuery.of(context).size.height / 4,
      // width: 200,
      // height: 230,
      // margin: EdgeInsets.only(
      //   right: defaultMargin,
      // ),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AspectRatio(
            aspectRatio: 16 / 9,
            child: Container(
              width: double.infinity,
              color: whiteColor,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: double.infinity,
            // margin: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 5,
                ),
                Container(
                  width: 80,
                  height: 12,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: whiteColor),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 10,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: whiteColor),
                ),
                // Text(
                //   NumberFormat.currency(
                //     locale: 'id', // sesuaikan dengan locale yang diinginkan
                //     symbol: 'Rp. ',
                //     decimalDigits: 0, // jumlah digit dibelakang koma
                //   ).format(product.price),
                //   style: priceTextStyle.copyWith(
                //     fontWeight: bold,
                //     fontSize: 16,
                //   ),
                //   overflow: TextOverflow.ellipsis,
                // ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
