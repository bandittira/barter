import "package:barter/constant/color.dart";
import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:iconsax/iconsax.dart";
import 'dart:math' as math;

Widget menu() {
  return Container(
    width: Get.width,
    height: Get.height / 3.6,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        TextButton(
          onPressed: () {},
          child: Container(
            padding: const EdgeInsets.all(8),
            width: Get.width / 2.4,
            height: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8), color: Colors.white),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Icon(
                  Iconsax.coin,
                  color: Constants.orange,
                ),
                const Column(
                  children: [
                    Text(
                      "บิ๊กพอยท์",
                      style: TextStyle(
                          fontSize: 12,
                          fontFamily: "Prompt",
                          color: Color.fromARGB(255, 2, 2, 2)),
                    ),
                    Text("เริ่มใช้งาน",
                        style: TextStyle(
                            fontSize: 12,
                            fontFamily: "Prompt",
                            fontWeight: FontWeight.w600,
                            color: Colors.green))
                  ],
                ),
                Transform.rotate(
                  angle: 180 * math.pi / 180,
                  child: const Icon(
                    CupertinoIcons.back,
                    size: 18,
                  ),
                )
              ],
            ),
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Container(
            padding: const EdgeInsets.all(8),
            width: Get.width / 2.4,
            height: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8), color: Colors.white),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Icon(
                  CupertinoIcons.bag_fill,
                  color: Constants.orange,
                ),
                const Column(
                  children: [
                    Text(
                      "กระเป๋าตัง",
                      style: TextStyle(
                          fontSize: 12,
                          fontFamily: "Prompt",
                          color: Colors.black),
                    ),
                    Text("เริ่มใช้งาน",
                        style: TextStyle(
                            fontSize: 12,
                            fontFamily: "Prompt",
                            fontWeight: FontWeight.w600,
                            color: Colors.green))
                  ],
                ),
                Transform.rotate(
                  angle: 180 * math.pi / 180,
                  child: const Icon(
                    CupertinoIcons.back,
                    size: 18,
                  ),
                )
              ],
            ),
          ),
        )
      ],
    ),
  );
}
