import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';
import 'package:serpismotor2/providers/cart_provider.dart';
import 'package:serpismotor2/providers/product_provider.dart';
import 'package:serpismotor2/theme.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:serpismotor2/widgets/service_card.dart';
import 'package:serpismotor2/widgets/service_card_bengkel.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/product_model.dart';

class ServiceDetailBengkel extends StatefulWidget {
  // const ServiceDetail({super.key});
  ProductModel product;
  ServiceDetailBengkel(this.product);

  @override
  State<ServiceDetailBengkel> createState() => _ServiceDetailBengkelState();
}

class _ServiceDetailBengkelState extends State<ServiceDetailBengkel> {
  void launchWeb(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }
  List<ProductModel> similarProducts = [];

  int currentIndex = 0;
  bool isWishList = false;
  void initState() {
    super.initState();
    _getSimilarProducts();
  }

  void _getSimilarProducts() async {
    final productProvider =
        Provider.of<ProductProvider>(context, listen: false);
    // Mendapatkan daftar produk dengan kategori yang sama
    final products = await productProvider
        .getProductsByCategory(widget.product.category.name);
    // Menyaring produk agar tidak menampilkan produk yang sedang ditampilkan
    similarProducts = products.where((p) => p.id != widget.product.id).toList();
  }

  @override
  Widget build(BuildContext context) {
    ProductProvider productProvider = Provider.of<ProductProvider>(context);
    CartProvider cartProvider = Provider.of<CartProvider>(context);

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
                      onPressed: () {
                        Navigator.pushNamed(context, '/cart');
                      },
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
          AspectRatio(
            aspectRatio: 16 / 9,
            child: Container(
              width: MediaQuery.of(context).size.width,
              color: backgroundColor1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  widget.product.galleries.isEmpty
                      ? Center(child: Icon(Icons.error))
                      : CarouselSlider(
                          items: widget.product.galleries
                              .map(
                                (image) => Image.network(
                                  'https://dashboard.servismo.me${image.url}',
                                  width: MediaQuery.of(context).size.width,
                                  fit: BoxFit.cover,
                                ),
                              )
                              .toList(),
                          options: CarouselOptions(
                            initialPage: 0,
                            enableInfiniteScroll:
                                widget.product.galleries.length > 1,
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
                  widget.product.category.name,
                  style: secondaryTextStyle.copyWith(
                    fontWeight: semibold,
                  ),
                ),
                Text(
                  widget.product.name,
                  style: primaryTextStyle.copyWith(
                      fontWeight: semibold, fontSize: 20),
                ),
                SizedBox(
                  height: 4,
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
            margin:
                EdgeInsets.symmetric(horizontal: defaultMargin, vertical: 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Alamat dan Deskripsi",
                  style: primaryTextStyle.copyWith(
                      fontSize: 16, fontWeight: semibold),
                ),
                SizedBox(
                  height: 8,
                ),
                ReadMoreText(
                  widget.product.description,
                  style: primaryTextStyle.copyWith(
                    fontWeight: medium,
                  ),
                  textAlign: TextAlign.justify,
                  trimLines: 6,
                  colorClickableText: primaryColor,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: 'Show More',
                  trimExpandedText: 'Show Less',
                ),
                SizedBox(
                  height: defaultMargin,
                ),
                Text(
                  "Rekomendasi Bengkel Lain",
                  style: primaryTextStyle.copyWith(
                      fontSize: 16, fontWeight: semibold),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 14),
            width: double.infinity,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: ResponsiveGridRow(
                horizontalGridMargin: 30,
                spacing: 15,
                itemWidth: 250,
                rowMainAxisAlignment: MainAxisAlignment.start,
                rowItems: [
                  ...productProvider.products
                      .map(
                        (product) => ServiceCardBengkel(product),
                      )
                      .where((product) =>
                          product.category.id == widget.product.category.id &&
                          product.product.id != widget.product.id)
                      .toList(),
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
                launchWeb(widget.product.tags);
              },
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                backgroundColor: primaryColor,
              ),
              child: Text(
                'Lokasi',
                style: primaryTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: semibold,
                ),
              ),
            ),
          )
      ),
    );
  }
}
