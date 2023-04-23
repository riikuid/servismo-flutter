import 'package:flutter/material.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';
import 'package:serpismotor2/theme.dart';
import 'package:serpismotor2/widgets/product_card.dart';
import 'package:serpismotor2/widgets/product_tile.dart';
import 'package:serpismotor2/widgets/service_card.dart';
import 'package:auto_size_text/auto_size_text.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        margin: EdgeInsets.only(
            top: defaultMargin, left: defaultMargin, right: defaultMargin),
        child: Row(children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Halo Akmal',
                  style: primaryTextStyle.copyWith(
                    fontSize: 22,
                    fontWeight: semibold,
                  ),
                ),
                Text(
                  '@akmalgantenkidaman',
                  style: subtitleTextStyle.copyWith(fontSize: 16),
                )
              ],
            ),
          ),
          Container(
            width: 45,
            height: 45,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage(
                  'assets/image_profile.png',
                ))),
          )
        ]),
      );
    }

    Widget bannerServisRutin() {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 12),
        margin: EdgeInsets.only(
          top: defaultMargin,
          right: defaultMargin,
          left: defaultMargin,
        ),
        height: 150,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Color(0xFFFFCD5D)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Servis Rutin",
                  style:
                      whiteTextStyle.copyWith(fontSize: 20, fontWeight: bold),
                ),
                Text(
                  "Kendaraanmu",
                  style:
                      whiteTextStyle.copyWith(fontSize: 20, fontWeight: bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Servis Sekarang",
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
            Image.asset(
              'assets/image_servis_rutin.png',
              // height: 150,
              fit: BoxFit.contain,
            )
          ],
        ),
      );
    }

    Widget bannerServisProblem() {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 12),
        margin: EdgeInsets.only(
          top: defaultMargin,
          right: defaultMargin,
          left: defaultMargin,
        ),
        height: 150,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: alertColor),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Kenali Apa",
                  style:
                      whiteTextStyle.copyWith(fontSize: 20, fontWeight: bold),
                ),
                Text(
                  "Kendalamu",
                  style:
                      whiteTextStyle.copyWith(fontSize: 20, fontWeight: bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Servis Sekarang",
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
            AspectRatio(
              aspectRatio: 1 / 1,
              child: Image.asset(
                'assets/image_servis_problem.png',
                // height: 120,
                // fit: BoxFit.fitWidth,
              ),
            )
          ],
        ),
      );
    }

    Widget servisRutinTitle() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
          right: defaultMargin,
          left: defaultMargin,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Servis Rutin',
              style:
                  primaryTextStyle.copyWith(fontSize: 18, fontWeight: semibold),
            ),
            Text(
              "See All",
              style: yellowTextStyle.copyWith(
                fontWeight: semibold,
              ),
            )
          ],
        ),
      );
    }

    Widget servisRutin() {
      return Container(
        margin: EdgeInsets.only(
          top: 14,
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: ResponsiveGridRow(
            horizontalGridMargin: 30,
            itemWidth: 150,
            spacing: 15,
            rowItems: [
              ServiceCardAll(),
              ServiceCardAll(),
              ServiceCardAll(),
              ServiceCardAll(),
              ServiceCardAll(),
            ],
          ),
        ),
      );
    }

    Widget servisProblemTitle() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
          right: defaultMargin,
          left: defaultMargin,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Mengalami Kendala ?',
              style:
                  primaryTextStyle.copyWith(fontSize: 18, fontWeight: semibold),
            ),
            Text(
              "See All",
              style: yellowTextStyle.copyWith(
                fontWeight: semibold,
              ),
            )
          ],
        ),
      );
    }

    Widget servisProblem() {
      return Container(
        margin: EdgeInsets.only(
          top: 14,
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: ResponsiveGridRow(
            horizontalGridMargin: 30,
            itemWidth: 150,
            spacing: 15,
            rowItems: [
              ServiceCardAll(),
              ServiceCardAll(),
              ServiceCardAll(),
              ServiceCardAll(),
              ServiceCardAll(),
            ],
          ),
        ),
      );
    }

    return ListView(
      physics: BouncingScrollPhysics(
        parent: AlwaysScrollableScrollPhysics(),
      ),
      children: [
        header(),
        bannerServisRutin(),
        servisRutinTitle(),
        servisRutin(),
        bannerServisProblem(),
        servisProblemTitle(),
        servisProblem(),
        SizedBox(
          height: 30,
        )
      ],
    );
  }
}
