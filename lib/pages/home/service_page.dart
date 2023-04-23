import 'package:flutter/material.dart';
import 'package:serpismotor2/theme.dart';
import 'package:serpismotor2/widgets/wishlist_card.dart';
import 'package:serpismotor2/widgets/service_card.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';

class ServicePage extends StatefulWidget {
  const ServicePage({super.key});

  @override
  State<ServicePage> createState() => _ServicePageState();
}

class _ServicePageState extends State<ServicePage> {
  @override
  Widget build(BuildContext context) {
    Widget header() {
      return AppBar(
        backgroundColor: backgroundColor1,
        centerTitle: true,
        toolbarHeight: 80,
        title: Text(
          "Semua Servis",
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
          width: double.infinity,
          margin: EdgeInsets.symmetric(
            horizontal: 30,
          ),
          // padding: EdgeInsets.symmetric(vertical: 14),
          child: ResponsiveGridList(
            minItemWidth: MediaQuery.of(context).size.width / 3.5,
            maxItemsPerRow: 2,
            horizontalGridSpacing: 15,
            verticalGridSpacing: 15,
            children: [
              ServiceCardAll(),
              ServiceCardAll(),
              ServiceCardAll(),
              ServiceCardAll(),
              ServiceCardAll(),
              // ServiceCardAll(),
            ],
          ),
        ),
      );
    }

    return Column(
      children: [
        header(),
        searchBar(),
        content(),
        // SizedBox(
        //   height: 14,
        // )
      ],
    );
  }
}