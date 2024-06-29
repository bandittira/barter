import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget carousel() {
  return CarouselSlider(
    options: CarouselOptions(
      height: Get.height / 2.90,
      viewportFraction: 1,
      autoPlay: true,
    ),
    items: [
      "assets/banner/banner.jpg",
      "assets/banner/1300x800.png",
      "assets/banner/1300x800.png",
      "assets/banner/1300x800.png",
      "assets/banner/1300x800.png"
    ].map((i) {
      return Builder(
        builder: (BuildContext context) {
          return Container(
              width: Get.width,
              decoration: const BoxDecoration(color: Colors.grey),
              child: Image.asset(i, fit: BoxFit.fitWidth)); //1300*1000
        },
      );
    }).toList(),
  );
}
