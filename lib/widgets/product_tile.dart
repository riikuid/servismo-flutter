import 'package:flutter/material.dart';
import 'package:serpismotor2/theme.dart';

class ProductTile extends StatelessWidget {
  const ProductTile({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/product');
      },
      child: Container(
          margin: EdgeInsets.only(
              left: defaultMargin, right: defaultMargin, bottom: defaultMargin),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  'assets/image_shoes.png',
                  height: 120,
                  width: 120,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                width: 12,
              ),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Football',
                    style: secondaryTextStyle.copyWith(
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    'Predator 20.3 Firm Ground',
                    style: primaryTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semibold,
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    '\$68,47',
                    style: priceTextStyle.copyWith(
                      fontWeight: medium,
                    ),
                  )
                ],
              ))
            ],
          )),
    );
  }
}
