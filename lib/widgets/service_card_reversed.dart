import 'package:flutter/material.dart';
import 'package:serpismotor2/models/product_model.dart';
import 'package:serpismotor2/pages/service_detail.dart';
import 'package:serpismotor2/theme.dart';
import '../models/category_model.dart';
import 'package:intl/intl.dart';

class ServiceCardReversed extends StatelessWidget {
  // const ServiceCardReversed({super.key});
  final ProductModel product;
  const ServiceCardReversed(this.product, {super.key});
  CategoryModel get category => product.category;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: ((context) => ServiceDetail(product)),
          ),
        );
      },
      child: Container(
        // width: MediaQuery.of(context).size.width / 3.5,
        // height: MediaQuery.of(context).size.height / 4,
        width: 150,
        // height: 230,
        // margin: EdgeInsets.only(
        //   right: defaultMargin,
        // ),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: whiteColor),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AspectRatio(
                aspectRatio: 1 / 1,
                child: product.galleries.isEmpty
                    ? Icon(Icons.error)
                    : Image.network(
                        'https://dashboard.servismo.me${product.galleries[0].url}',
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Icon(Icons
                              .error); // widget pengganti ketika terjadi kesalahan
                        },
                      )),
            SizedBox(
              height: 15,
            ),
            Container(
              width: double.infinity,
              // margin: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: blackTextStyle.copyWith(fontWeight: semibold),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    NumberFormat.currency(
                      locale: 'id', // sesuaikan dengan locale yang diinginkan
                      symbol: 'Rp. ',
                      decimalDigits: 0, // jumlah digit dibelakang koma
                    ).format(product.price),
                    style: priceTextStyle.copyWith(
                      fontWeight: bold,
                      fontSize: 16,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    product.category.name,
                    style: secondaryTextStyle.copyWith(
                        fontSize: 12, fontWeight: semibold),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
