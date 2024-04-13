import 'package:barter/constant/color.dart';
import 'package:barter/element/member/sign_up/appbar.dart';
import 'package:barter/screens/member/forms/otp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SignUp extends StatelessWidget {
  SignUp({super.key});
  
  final TextEditingController phoneNumberController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'โปรดใส่หมายเลขโทรศัพท์';
    }
    // You can add more complex validation logic here if needed
    return null; // Return null if the input is valid
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const MyAppbarSignUp(),
      body: SafeArea(
          child: Column(
        children: [
          Center(
            child: Lottie.asset("assets/lotties/signup.json",
                width: 200, height: 200),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Form(
              key: formKey,
              child: TextFormField(
                controller: phoneNumberController,
                validator: validatePhoneNumber,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                    hintText: "หมายเลขโทรศัพท์",
                    hintStyle: TextStyle(fontSize: 14, fontFamily: "Prompt"),
                    prefixIcon: Icon(
                      CupertinoIcons.phone,
                      size: 24,
                      color: Colors.black,
                    )),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 14),
            child: TextButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    Get.to(PinputExample(
                      phoneNumber: phoneNumberController.text,
                    ));
                  } else {}
                },
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
          const Padding(
              padding: EdgeInsets.symmetric(vertical: 14),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 50,
                    child: Divider(
                      thickness: 2,
                      height: 2,
                      color: Constants.white,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Text(
                      "หรือ",
                      style: TextStyle(fontFamily: "Prompt"),
                    ),
                  ),
                  SizedBox(
                    width: 50,
                    child: Divider(
                      thickness: 2,
                      height: 2,
                      color: Constants.white,
                    ),
                  )
                ],
              )),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 14),
            child: TextButton(
                onPressed: () {},
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(color: Constants.grey)),
                  width: Get.width / 1.15,
                  height: 40,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: SizedBox(
                          child: Image.asset(
                            "assets/icons/line.png",
                            scale: 2.8,
                          ),
                        ),
                      ),
                      const Spacer(),
                      const Center(
                        child: Text(
                          "สมัครด้วยบัญชี Line",
                          style: TextStyle(
                              fontFamily: "Prompt", color: Colors.black),
                        ),
                      ),
                      const Spacer(),
                      const Spacer()
                    ],
                  ),
                )),
          ),
          const Spacer(),
          Container(
            width: Get.width,
            height: 70,
            color: Colors.grey.shade100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "มีบัญชีผู้ใช้อยู่แล้ว?",
                  style: TextStyle(color: Colors.grey.shade700),
                ),
                TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: const Text("เข้าสู่ระบบ"))
              ],
            ),
          )
        ],
      )),
    );
  }
}
