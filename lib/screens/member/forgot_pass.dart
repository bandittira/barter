import 'package:barter/constant/color.dart';
import 'package:barter/widgets/member/forgot_password/appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class ForgotPass extends StatelessWidget {
  const ForgotPass({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppbarForgotPass(),
      body: SafeArea(
        child: Column(
          children: [
            Center(
              child: Lottie.asset("assets/lotties/forgotpass.json",
                  width: 200, height: 200),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: TextField(
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                    hintText: "หมายเลขโทรศัพท์ / รหัสผู้ใช้",
                    hintStyle: TextStyle(fontSize: 14, fontFamily: "Prompt"),
                    prefixIcon: Icon(
                      CupertinoIcons.profile_circled,
                      size: 24,
                      color: Colors.black,
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 14),
              child: TextButton(
                  onPressed: () {},
                  child: Container(
                    color: Constants.white,
                    width: Get.width / 1.15,
                    height: 40,
                    child: const Center(
                      child: Text(
                        "ถัดไป",
                        style: TextStyle(
                            fontFamily: "Prompt", color: Constants.black),
                      ),
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
