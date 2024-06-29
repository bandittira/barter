import 'package:barter/constant/color.dart';
import 'package:barter/screens/member/forms/controller/login.dart';
import 'package:barter/screens/member/forms/data/login.dart';
import 'package:barter/widgets/member/sign_in/appbar.dart';
import 'package:barter/screens/member/forgot_pass.dart';
import 'package:barter/screens/member/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lottie/lottie.dart';

// ignore: must_be_immutable
class SignIn extends StatelessWidget {
  SignIn({Key? key}) : super(key: key);

  // Toggles the password
  final _passwordVisible = false.obs;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final LoginController _controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const MyAppbar(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SafeArea(
            child: SizedBox(
          width: Get.width,
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Center(
                  child: Lottie.asset("assets/lotties/signin.json",
                      width: 200, height: 200),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: TextFormField(
                    controller: _controller.username,
                    validator: (value) {
                      if (value == "") {
                        return "กรุณากรอกเบอร์โทรศัพท์";
                      }
                      return null;
                    },
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                        hintText: "เบอร์โทรศัพท์",
                        hintStyle:
                            TextStyle(fontSize: 14, fontFamily: "Prompt"),
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
                        controller: _controller.password,
                        validator: (value) {
                          if (value == "") {
                            return "กรุณากรอกรหัสผ่าน";
                          }
                          return null;
                        },
                        textInputAction: TextInputAction.done,
                        obscureText: !_passwordVisible.value,
                        decoration: InputDecoration(
                            hintText: "รหัสผ่าน",
                            hintStyle: const TextStyle(
                                fontSize: 14, fontFamily: "Prompt"),
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
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          login(_controller.username.text,
                              _controller.password.text);
                        } else {}
                      },
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
                      onPressed: () {
                        startLineLogin();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            border: Border.all(color: Constants.grey)),
                        width: Get.width / 1.15,
                        height: 40,
                        child: Row(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
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
                            const Spacer(),
                          ],
                        ),
                      )),
                ),
                SizedBox(
                  height: Get.height / 8,
                ),
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
            ),
          ),
        )),
      ),
    );
  }
}
