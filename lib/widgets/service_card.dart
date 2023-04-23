import 'package:flutter/material.dart';
import 'package:serpismotor2/theme.dart';

class ServiceCardAll extends StatelessWidget {
  const ServiceCardAll({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/product');
      },
      child: Container(
        // width: MediaQuery.of(context).size.width / 3.5,
        // height: MediaQuery.of(context).size.height / 4,
        // width: 150,
        // height: 230,
        // margin: EdgeInsets.only(
        //   right: defaultMargin,
        // ),
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: whiteColor),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AspectRatio(
              aspectRatio: 1 / 1,
              child: Image.asset(
                'assets/image_shoes.png',
                fit: BoxFit.cover,
              ),
            ),
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
                    'Servis Rutin',
                    style: blackTextStyle.copyWith(fontWeight: semibold),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    'Rp. 150,000',
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
                    'Tune Up',
                    style: secondaryTextStyle.copyWith(
                        fontSize: 12, fontWeight: semibold),
                    overflow: TextOverflow.ellipsis,
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
