import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';
import 'package:serpismotor2/providers/product_provider.dart';
import 'package:serpismotor2/theme.dart';
import 'package:serpismotor2/widgets/servis_rutin_card.dart';
import 'package:serpismotor2/widgets/spare_part_card.dart';

class ServisRutin extends StatefulWidget {
  const ServisRutin({super.key});

  @override
  State<ServisRutin> createState() => _ServisRutinState();
}

class _ServisRutinState extends State<ServisRutin> {
  String searchKeyword = '';
  @override
  Widget build(BuildContext context) {
    ProductProvider productProvider = Provider.of<ProductProvider>(context);
    Widget header() {
      return AppBar(
        backgroundColor: backgroundColor1,
        centerTitle: true,
        toolbarHeight: 80,
        title: Text(
          "Servis Rutin",
          style: primaryTextStyle.copyWith(fontWeight: semibold),
        ),
        elevation: 0,
        automaticallyImplyLeading: false,
      );
    }

    Widget searchBar() {
      return Container(
        margin: EdgeInsets.only(
            right: defaultMargin, left: defaultMargin, bottom: 14),
        height: 50,
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(100), boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 2,
              offset: Offset(0, 0))
        ]),
        child: TextField(
          onChanged: (value) {
            setState(() {
              searchKeyword = value;
            });
          },
          style: primaryTextStyle.copyWith(fontWeight: semibold),
          cursorColor: primaryColor,
          decoration: InputDecoration(
            hintText: "Cari kebutuhan kendaraanmu",
            hintStyle: subtitleTextStyle.copyWith(fontWeight: medium),
            contentPadding:
                const EdgeInsets.only(top: 10, bottom: 10, left: 25),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(100),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: whiteColor,
            suffixIcon: Container(
              margin: const EdgeInsets.all(5),
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Icon(
                Icons.search,
                size: 28,
                color: blackColor,
              ),
            ),
          ),
        ),
      );
    }

    Widget content() {
      return Expanded(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: defaultMargin),
          child: ResponsiveGridList(
            minItemWidth: MediaQuery.of(context).size.width / 3.5,
            maxItemsPerRow: 2,
            horizontalGridSpacing: 15,
            rowMainAxisAlignment: MainAxisAlignment.start,
            verticalGridSpacing: 15,
            verticalGridMargin: 15,
            children: [
              ...productProvider.products
                  .map(
                    (product) => ServisRutinCard(product),
                  )
                  .where((product) => product.category.id == 2)
                  .where((product) =>
                      product.product.name
                          .toLowerCase()
                          .contains(searchKeyword.toLowerCase()) ||
                      product.category.name
                          .toLowerCase()
                          .contains(searchKeyword.toLowerCase()))
                  .toList(),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      floatingActionButton: Padding(
        padding: EdgeInsets.only(left: 11, top: 14),
        child: FloatingActionButton(
          heroTag: null,
          mini: true,
          onPressed: () {
            Navigator.pushNamed(context, '/home');
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
      backgroundColor: backgroundColor1,
      body: Column(
        children: [
          header(),
          searchBar(),
          content(),
          // SizedBox(
          //   height: 14,
          // )
        ],
      ),
    );
  }
}
