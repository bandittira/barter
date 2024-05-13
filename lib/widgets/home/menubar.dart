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

Widget menubar() {
  return Container(
    width: Get.width,
    height: 120,
    color: Colors.white,
    child: SingleChildScrollView(
      primary: true,
      scrollDirection: Axis.horizontal,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        for (int i = 0; i < 6; i++)
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: TextButton(
              onPressed: () {},
              child: Column(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Constants.grey),
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
