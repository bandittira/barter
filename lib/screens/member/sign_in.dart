import 'package:barter/constant/color.dart';
import 'package:barter/element/member/sign_in/appbar.dart';
import 'package:barter/screens/member/forgot_pass.dart';
import 'package:barter/screens/member/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lottie/lottie.dart';

class SignIn extends StatelessWidget {
  SignIn({Key? key}) : super(key: key);

  // Toggles the password
  final _passwordVisible = false.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const MyAppbar(),
      body: SafeArea(
          child: Column(
        children: [
          Center(
            child: Lottie.asset("assets/lotties/signin.json",
                width: 200, height: 200),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: TextField(
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                  hintText: "รหัสผู้ใช้",
                  hintStyle: TextStyle(fontSize: 14, fontFamily: "Prompt"),
                  prefixIcon: Icon(
                    Iconsax.profile_circle,
                    size: 24,
                    color: Colors.black,
                  )),
            ),
          ),
          Obx(() => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: TextFormField(
                  textInputAction: TextInputAction.done,
                  obscureText: !_passwordVisible.value,
                  decoration: InputDecoration(
                      hintText: "รหัสผ่าน",
                      hintStyle:
                          const TextStyle(fontSize: 14, fontFamily: "Prompt"),
                      prefixIcon: const Icon(
                        Iconsax.lock,
                        size: 24,
                        color: Colors.black,
                      ),
                      suffixIcon: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                              onPressed: () {
                                _passwordVisible.toggle();
                              },
                              icon: Icon(_passwordVisible.value
                                  ? Icons.visibility
                                  : Icons.visibility_off)),
                          const SizedBox(
                            height: 15,
                            child: VerticalDivider(
                              color: Constants.white,
                              thickness: 2,
                              width: 10,
                            ),
                          ),
                          TextButton(
                              onPressed: () {
                                Get.to(const ForgotPass());
                              },
                              child: SizedBox(
                                child: Text(
                                  "ลืมรหัสผ่าน?",
                                  style: TextStyle(
                                      fontFamily: "Prompt",
                                      color: Colors.blue.shade800),
                                ),
                              ))
                        ],
                      )),
                ),
              )),
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
                      "เข้าสู่ระบบ",
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
                          "ดำเนินการต่อด้วย Line",
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
                  "ยังไม่มีบัญชีผู้ใช้?",
                  style: TextStyle(color: Colors.grey.shade700),
                ),
                TextButton(
                    onPressed: () {
                      Get.to(SignUp());
                    },
                    child: const Text("สมัครเลย"))
              ],
            ),
          )
        ],
      )),
    );
  }
}
