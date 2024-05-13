import 'package:barter/constant/color.dart';
import 'package:barter/widgets/home/carousel.dart';
import 'package:barter/widgets/home/menu.dart';
import 'package:barter/widgets/home/menubar.dart';
import 'package:barter/widgets/home/product.dart';
import 'package:barter/widgets/home/search_bar.dart';
import 'package:barter/screens/member/forms/controller/province.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

String formatPriceWithCommas(String price) {
  return NumberFormat('#,##0').format(int.parse(price));
}

List<String> formattedPrices =
    price.map((p) => formatPriceWithCommas(p)).toList();

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    readJson();
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Constants.white,
          width: Get.width,
          child: Stack(
            children: [
              carousel(),
              SafeArea(
                child: Column(
                  children: [
                    searchbar(),
                    menu(),
                    const SizedBox(
                      height: 5,
                    ),
                    RawScrollbar(
                        thumbColor: Colors.orange.shade700,
                        thickness: 4,
                        radius: const Radius.circular(15),
                        child: menubar()),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      width: Get.width,
                      height: 40,
                      color: Colors.white,
                      child: const Padding(
                        padding: EdgeInsets.only(left: 12),
                        child: Text(
                          "สินค้าใหม่",
                          style: TextStyle(
                              color: Constants.orange,
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              fontFamily: "Prompt"),
                        ),
                      ),
                    ),
                    productCard(images, productName, formattedPrices),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
