import 'package:barter/constant/color.dart';
import 'package:barter/element/form/appbar/form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class NextScreen extends StatelessWidget {
  const NextScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppbarForm(),
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                  hintText: "ชื่อ (ภาษาไทย)",
                  hintStyle: TextStyle(fontSize: 14, fontFamily: "Prompt"),
                  prefixIcon: Icon(
                    Iconsax.profile_circle,
                    size: 24,
                    color: Constants.grey,
                  )),
            ),
          ),
        ],
      )),
    );
  }
}
