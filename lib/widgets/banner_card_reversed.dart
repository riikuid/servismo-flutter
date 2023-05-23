import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:serpismotor2/models/product_model.dart';
import 'package:serpismotor2/pages/service_detail.dart';
import 'package:serpismotor2/theme.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/category_model.dart';
import 'package:intl/intl.dart';

class BannerCardReversed extends StatelessWidget {
  // const ServiceCardReversed({super.key});
  final ProductModel product;
  const BannerCardReversed(this.product, {super.key});
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
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 12),
        margin: EdgeInsets.only(
          top: defaultMargin,
          right: defaultMargin,
          left: defaultMargin,
        ),
        height: 200,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: alertColor),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AutoSizeText(
                    product.description,
                    style:
                        whiteTextStyle.copyWith(fontSize: 20, fontWeight: bold),
                    overflow: TextOverflow.clip,
                    minFontSize: 10,
                  ),
                  // Text(
                  //   "Kendalamu",
                  //   style:
                  //   whiteTextStyle.copyWith(fontSize: 20, fontWeight: bold),
                  // ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Isi Sekarang",
                        style: whiteTextStyle.copyWith(
                            fontWeight: medium, fontSize: 14),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Icon(
                        Icons.arrow_forward_rounded,
                        color: whiteColor,
                        size: 18,
                      )
                    ],
                  )
                ],
              ),
            ),
            Expanded(
              child: AspectRatio(
                aspectRatio: 1 / 1,
                child: Image.asset(
                  'assets/image_servis_problem.png',
                  // height: 120,
                  // fit: BoxFit.fitWidth,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
