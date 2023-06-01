import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:serpismotor2/models/product_model.dart';
import 'package:serpismotor2/pages/service_detail.dart';
import 'package:serpismotor2/theme.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/category_model.dart';
import 'package:intl/intl.dart';

class BannerFormCard extends StatelessWidget {
  // const ServiceCardReversed({super.key});
  final ProductModel product;
  const BannerFormCard(this.product, {super.key});
  CategoryModel get category => product.category;

  void launchForm(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        launchForm(product.tags);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
        margin: EdgeInsets.only(
          top: 10,
          right: defaultMargin,
          left: defaultMargin,
        ),
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color(0xFFB65FCF).withOpacity(0.7)),
        child: Expanded(
          child: Row(
            children: [
              product.galleries.isEmpty
                  ? SizedBox(
                      width: 1,
                    )
                  : Image.network(
                      'https://dashboard.servismo.me${product.galleries[0].url}',
                      height: 60,
                    ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      product.name,
                      style: whiteTextStyle.copyWith(
                          fontSize: 16, fontWeight: semibold),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          product.description,
                          style: whiteTextStyle.copyWith(
                              fontWeight: medium, fontSize: 14),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
