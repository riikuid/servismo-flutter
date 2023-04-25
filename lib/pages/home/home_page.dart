import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';
import 'package:serpismotor2/providers/auth_provider.dart';
import 'package:serpismotor2/providers/product_provider.dart';
import 'package:serpismotor2/theme.dart';
import 'package:serpismotor2/widgets/service_card.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:provider/provider.dart';
import 'package:serpismotor2/models/user_model.dart';
import 'package:serpismotor2/widgets/service_card_bengkel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late SharedPreferences prefs;

  @override
  void initState() {
    initSharedPref();
    // TODO: implement initState
    super.initState();

  }

  void initSharedPref() async{
    prefs = await SharedPreferences.getInstance();
  }
  @override
  Widget build(BuildContext context) {

    ProductProvider productProvider = Provider.of<ProductProvider>(context);

    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    UserModel user = authProvider.user;

    getInit() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await authProvider.login(
          email: prefs.getString('email'), password: prefs.getString('pw'));

    }



    profileImage() {
      try {
        return SvgPicture.network(user.profilePhotoUrl!);
      } catch (e) {
        // Use Image.memory to load the data as image
        return Image.network(user.profilePhotoUrl!);
      }
    }

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
                  'Halo ${user.name}',
                  style: primaryTextStyle.copyWith(
                    fontSize: 22,
                    fontWeight: semibold,
                  ),
                ),
                Text(
                  '@${user.username}',
                  style: subtitleTextStyle.copyWith(fontSize: 16),

                ),

              ],
            ),
          ),
          ClipOval(
            child: SvgPicture.network(
              user.profilePhotoUrl!,
              height: 54,
              width: 54,
            ),
          )
        ]),
      );
    }

    Widget bannerServisRutin() {
      return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/servis-rutin');
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 12),
          margin: EdgeInsets.only(
            top: defaultMargin,
            right: defaultMargin,
            left: defaultMargin,
          ),
          height: 150,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color(0xFFFFCD5D)),
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
        ),
      );
    }

    Widget bannerServisProblem() {
      return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/servis-problem');
        },
        child: Container(
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
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/servis-rutin');
              },
              child: Text(
                "See All",
                style: yellowTextStyle.copyWith(
                  fontWeight: semibold,
                ),
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
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          child: ResponsiveGridRow(
            horizontalGridMargin: 30,
            itemWidth: 150,
            spacing: 15,
            rowItems: productProvider.products
                .map(
                  (product) => ServiceCardAll(product),
                )
                .where((product) => product.category.id == 2).take(5)
                .toList(),
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
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/servis-problem');
              },
              child: Text(
                "See All",
                style: yellowTextStyle.copyWith(
                  fontWeight: semibold,
                ),
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
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          child: ResponsiveGridRow(
            horizontalGridMargin: 30,
            itemWidth: 150,
            spacing: 15,
            rowItems: [
              ...productProvider.products
                  .map(
                    (product) => ServiceCardAll(product),
                  )
                  // .take(10)
                  .where((product) =>
                      product.category.id != 1 && product.category.id != 2).take(5)
                  .toList(),
            ],
          ),
        ),
      );
    }

    Widget servisBengkelTitle() {
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
              'Rekomendasi Bengkel',
              style:
              primaryTextStyle.copyWith(fontSize: 18, fontWeight: semibold),
            ),
            // GestureDetector(
            //   onTap: () {
            //     Navigator.pushNamed(context, '/servis-problem');
            //   },
            //   child: Text(
            //     "See All",
            //     style: yellowTextStyle.copyWith(
            //       fontWeight: semibold,
            //     ),
            //   ),
            // )
          ],
        ),
      );
    }

    Widget servisBengkel() {
      return Container(
        margin: EdgeInsets.only(
          top: 14,
        ),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          child: ResponsiveGridRow(
            horizontalGridMargin: 30,
            itemWidth: 150,
            spacing: 15,
            rowItems: [
              ...productProvider.products
                  .map(
                    (product) => ServiceCardBengkel(product),
              )
              // .take(10)
                  .where((product) =>
              product.category.id == 10)
                  .toList(),
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
        servisBengkelTitle(),
        servisBengkel(),

        SizedBox(
          height: 30,
        )
      ],
    );
  }
}
