import 'package:barter/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

List menuText = [
  "สินค้าทั้งหมด",
  "กระเป๋าตัง",
  "วิธีการใช้",
  "รายการสั่งซื้อ",
  "รายการถูกใจ",
  "ติดต่อบริษัท",
];

List<Icon> icons = const [
  Icon(
    Icons.shop_outlined,
    color: Constants.orange,
  ),
  Icon(Icons.wallet, color: Constants.orange),
  Icon(Icons.book, color: Constants.orange),
  Icon(Icons.list, color: Constants.orange),
  Icon(Icons.heart_broken, color: Constants.orange),
  Icon(Icons.message, color: Constants.orange)
];

Widget menubar() {
  return Container(
    width: Get.width,
    height: 100,
    color: Colors.white,
    child: SingleChildScrollView(
      primary: true,
      scrollDirection: Axis.horizontal,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        for (int i = 0; i < 6; i++)
          Padding(
            padding: const EdgeInsets.only(left: 2, right: 2, top: 5),
            child: TextButton(
              onPressed: () {},
              child: Column(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey.shade100),
                    child: Center(child: icons[i]),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Text(
                      menuText[i],
                      style: const TextStyle(
                          fontFamily: "Prompt",
                          color: Constants.black,
                          fontSize: 13),
                    ),
                  )
                ],
              ),
            ),
          ),
      ]),
    ),
  );
}
