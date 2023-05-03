import 'package:flutter/material.dart';
import 'package:serpismotor2/models/product_model.dart';
import 'package:serpismotor2/pages/home/service_page.dart';
import 'package:serpismotor2/pages/service_detail.dart';
import 'package:serpismotor2/theme.dart';
import '../models/category_model.dart';
import 'package:shimmer/shimmer.dart';

class SkeletonCard extends StatelessWidget {
  const SkeletonCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AspectRatio(
            aspectRatio: 1 / 1,
            child: Container(
              color: whiteColor,
            )),
        SizedBox(
          height: 15,
        ),
        Container(
          width: double.infinity,
          // margin: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 14,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10), color: whiteColor),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                width: 80,
                height: 14,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10), color: whiteColor),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                width: 100,
                height: 12,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10), color: whiteColor),
              ),
            ],
          ),
        )
      ],
    );
  }
}
