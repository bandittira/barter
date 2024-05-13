import "package:barter/constant/color.dart";
import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:iconsax/iconsax.dart";

Widget searchbar() {
  return Padding(
    padding: const EdgeInsets.only(top: 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: Get.width / 1.5,
          height: 35,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 4,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: SizedBox(
            child: TextButton(
              onPressed: () {},
              child: const Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: Icon(
                      CupertinoIcons.search,
                      color: Colors.black,
                      size: 18,
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.only(right: 5),
                    child: Icon(
                      Iconsax.scan,
                      color: Constants.orange,
                      size: 20,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 2,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ], borderRadius: BorderRadius.circular(25), color: Colors.white),
            width: 35,
            height: 35,
            child: IconButton(
              icon: const Icon(
                Iconsax.notification,
                size: 19,
              ),
              alignment: Alignment.center,
              onPressed: () {},
            )),
        Container(
            width: 35,
            height: 35,
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 2,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ], borderRadius: BorderRadius.circular(25), color: Colors.white),
            child: IconButton(
              icon: const Icon(
                Iconsax.shopping_cart,
                size: 19,
              ),
              alignment: Alignment.center,
              onPressed: () {},
            ))
      ],
    ),
  );
}
