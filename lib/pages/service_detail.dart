import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';
import 'package:serpismotor2/providers/cart_provider.dart';
import 'package:serpismotor2/providers/product_provider.dart';
import 'package:serpismotor2/theme.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:serpismotor2/widgets/service_card.dart';

import '../models/product_model.dart';

class ServiceDetail extends StatefulWidget {
  // const ServiceDetail({super.key});
  ProductModel product;
  ServiceDetail(this.product);

  @override
  State<ServiceDetail> createState() => _ServiceDetailState();
}

class _ServiceDetailState extends State<ServiceDetail> {
  List<ProductModel> similarProducts = [];

  List images = [
    'assets/image_cat.jpg',
    'assets/image_cat.jpg',
    'assets/image_shoes.png',
  ];

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
          Container(
            width: MediaQuery.of(context).size.width,
            color: backgroundColor1,
            child: Column(
              children: [
                CarouselSlider(
                  items: widget.product.galleries
                      .map(
                        (image) => Image.network(
                          'http://dashboard.servismo.me${image.url}',
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.width,
                          fit: BoxFit.cover,
                        ),
                      )
                      .toList(),
                  options: CarouselOptions(
                    initialPage: 0,
                    enableInfiniteScroll: widget.product.galleries.length > 1,
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
                Text(
                  NumberFormat.currency(
                    locale: 'id', // sesuaikan dengan locale yang diinginkan
                    symbol: 'Rp. ',
                    decimalDigits: 0, // jumlah digit dibelakang koma
                  ).format(widget.product.price),
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
                  widget.product.description,
                  style: primaryTextStyle.copyWith(
                    fontWeight: medium,
                  ),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(
                  height: defaultMargin,
                ),
                Text(
                  "Servis yang Serupa",
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
                itemWidth: 150,
                rowMainAxisAlignment: MainAxisAlignment.start,
                rowItems: [
                  ...productProvider.products
                      .map(
                        (product) => ServiceCardAll(product),
                      )
                      .where((product) =>
                          product.category.id == widget.product.category.id)
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
                cartProvider.addCart(widget.product);
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
