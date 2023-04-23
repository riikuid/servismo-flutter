import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:serpismotor2/theme.dart';

class BannerServiceOne extends StatelessWidget {
  const BannerServiceOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 150,
      color: primaryColor,
      decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: whiteColor),
    );
  }
}
