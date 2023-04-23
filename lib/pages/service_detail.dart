import 'package:flutter/material.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';
import 'package:serpismotor2/theme.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:serpismotor2/widgets/service_card.dart';

class ServiceDetail extends StatefulWidget {
  const ServiceDetail({super.key});

  @override
  State<ServiceDetail> createState() => _ServiceDetailState();
}

class _ServiceDetailState extends State<ServiceDetail> {
  List images = [
    'assets/image_cat.jpg',
    'assets/image_cat.jpg',
    'assets/image_shoes.png',
  ];

  List familiarShoes = [
    'assets/image_shoes.png',
    'assets/image_shoes.png',
    'assets/image_shoes.png',
    'assets/image_shoes.png',
    'assets/image_shoes.png',
    'assets/image_shoes.png',
    'assets/image_shoes.png',
    'assets/image_shoes.png',
  ];

  int currentIndex = 0;
  bool isWishList = false;

  @override
  Widget build(BuildContext context) {
    Future<void> showSuccessDialog() async {
      return showDialog(
        context: context,
        builder: (BuildContext context) => Container(
          width: MediaQuery.of(context).size.width - (2 * defaultMargin),
          child: AlertDialog(
            backgroundColor: backgroundColor1,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.close,
                        color: primaryTextColor,
                      ),
                    ),
                  ),
                  Image.asset(
                    'assets/icon_success.png',
                    width: 100,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    'Success',
                    style: primaryTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: semibold,
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    'Item added',
                    style: secondaryTextStyle,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 154,
                    height: 44,
                    child: TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                          backgroundColor: primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          )),
                      child: Text(
                        'View Cart',
                        style: primaryTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: medium,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    Widget indicator(int index) {
      return Container(
        width: currentIndex == index ? 16 : 4,
        height: 4,
        margin: EdgeInsets.symmetric(
          horizontal: 2,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: currentIndex == index ? primaryColor : Color(0xffC4C4C4),
        ),
      );
    }

    Widget content() {
      int index = -1;
      return Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            color: backgroundColor1,
            child: Column(
              children: [
                CarouselSlider(
                  items: images
                      .map(
                        (image) => Image.asset(
                          image,
                          width: MediaQuery.of(context).size.width,
                          height: 300,
                          fit: BoxFit.cover,
                        ),
                      )
                      .toList(),
                  options: CarouselOptions(
                    initialPage: 0,
                    onPageChanged: (context, reason) {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                    viewportFraction: 1, // ubah nilai viewportFraction
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 1,
            width: double.infinity,
            color: secondaryTextColor.withOpacity(0.5),
          ),
          Container(
            width: double.infinity,
            padding:
                EdgeInsets.symmetric(vertical: 20, horizontal: defaultMargin),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Servis Rutin",
                  style: secondaryTextStyle.copyWith(
                    fontWeight: semibold,
                  ),
                ),
                Text(
                  "Tune Up / Maintenance Tune Up / Maintenance Tune Up / Maintenance",
                  style: primaryTextStyle.copyWith(
                      fontWeight: semibold, fontSize: 20),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  "Rp. 150,000",
                  style: priceTextStyle.copyWith(
                      fontWeight: semibold, fontSize: 18),
                )
              ],
            ),
          ),
          Container(
            height: 1,
            width: double.infinity,
            color: secondaryTextColor.withOpacity(0.5),
          ),
          Container(
            width: double.infinity,
            margin:
                EdgeInsets.symmetric(horizontal: defaultMargin, vertical: 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Deskripsi",
                  style: primaryTextStyle.copyWith(
                      fontSize: 16, fontWeight: semibold),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur a blandit elit, vitae aliquam urna. Fusce suscipit vitae massa a ultricies. Nulla rutrum ac nulla non accumsan. Nunc consequat luctus tempor. Sed eu diam rutrum, tincidunt lectus ut, iaculis lacus. Maecenas volutpat mi volutpat sem mollis auctor. Sed eget augue sit amet ante ultrices pellentesque. Maecenas id elit nulla. Nullam ac imperdiet tortor, ut egestas felis. Sed nisl est, condimentum sit amet consequat at, fringilla nec justo. Donec a erat sed nunc mollis porta at non nulla. Maecenas in consequat neque. Nam fermentum, orci quis molestie hendrerit, nibh elit luctus orci, ac scelerisque libero diam sed metus. Aliquam sollicitudin auctor volutpat. Nulla posuere metus non malesuada auctor. \n\nIn tellus nunc, porttitor ac volutpat vitae, ullamcorper ut nibh. Etiam nibh nunc, posuere vel augue in, convallis vehicula nisl. Integer fringilla ligula nec orci bibendum lacinia. Mauris et rutrum lacus. Nam ultricies ultrices nunc, in vulputate arcu laoreet a. Nunc in leo in arcu viverra eleifend sit amet ut leo. Maecenas eu faucibus nisi. Pellentesque sit amet sagittis neque. Sed at massa at ex aliquam pharetra non at diam. Donec sed euismod dolor, id sollicitudin mauris. Morbi eu tempus neque. Maecenas congue orci ante, aliquet ornare risus venenatis sed. Donec congue pharetra ipsum rutrum rhoncus. In convallis ipsum sed tortor sollicitudin rhoncus.",
                  style: primaryTextStyle.copyWith(
                    fontWeight: medium,
                  ),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(
                  height: defaultMargin,
                ),
                Text(
                  "Service Lain Dari Prolem Ini",
                  style: primaryTextStyle.copyWith(
                      fontSize: 16, fontWeight: semibold),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 14),
            child: const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: ResponsiveGridRow(
                horizontalGridMargin: 30,
                spacing: 15,
                itemWidth: 150,
                rowItems: [
                  ServiceCardAll(),
                  ServiceCardAll(),
                  ServiceCardAll(),
                ],
              ),
            ),
          )
        ],
      );
    }

    return SafeArea(
      child: Scaffold(
          backgroundColor: backgroundColor1,
          // appBar: AppBar(
          //   toolbarHeight: 60,
          //   backgroundColor: backgroundColor1,
          //   elevation: 0,
          //   title: Text(
          //     "Servis Rutin",
          //     style: primaryTextStyle.copyWith(fontWeight: medium),
          //   ),
          //   centerTitle: true,
          //   leading: GestureDetector(
          //     onTap: () {
          //       Navigator.pop(context);
          //     },
          //     child: Icon(
          //       Icons.chevron_left,
          //       color: blackColor,
          //       size: 30,
          //     ),
          //   ),
          //   actions: <Widget>[
          //     Padding(
          //       padding: const EdgeInsets.all(14.0),
          //       child: Image.asset(
          //         "assets/icon_trolley.png",
          //         color: blackColor,
          //         height: 25,
          //         width: 25,
          //       ),
          //     )
          //   ],
          // ),
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
          body: ListView(
            physics:
                BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            children: [content()],
          ),
          bottomNavigationBar: Container(
            margin:
                EdgeInsets.symmetric(vertical: 10, horizontal: defaultMargin),
            height: 50,
            child: TextButton(
              onPressed: () {
                showSuccessDialog();
              },
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                backgroundColor: primaryColor,
              ),
              child: Text(
                'Add to Cart',
                style: primaryTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: semibold,
                ),
              ),
            ),
          )),
    );
  }
}
