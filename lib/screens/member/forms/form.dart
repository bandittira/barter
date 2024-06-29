import 'dart:io';
import 'package:barter/constant/color.dart';
import 'package:barter/widgets/member/appbar/form.dart';
import 'package:barter/screens/member/forms/controller/controller.dart';
import 'package:barter/screens/member/forms/personal_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';

class RegisterForm extends StatelessWidget {
  RegisterForm({Key? key}) : super(key: key);

  // Toggles the password
  final _passwordVisible = false.obs;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final MyController _controller = Get.put(MyController());

  // Pick image
  final ImagePicker _picker = ImagePicker();

  Future<void> pickImageAndNavigate() async {
    try {
      final XFile? pickedImage =
          await _picker.pickImage(source: ImageSource.camera);
      if (pickedImage == null) return;
      image.value = File(pickedImage.path);
      // Navigate to the next screen after picking an image
      Get.to(() => NextScreen());
    } catch (e) {
      null;
    }
  }

  @override
  Widget build(BuildContext context) {
    void _showMyDialog(BuildContext context) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  const Center(
                      child: Text('ตัวอย่างการถ่ายรูปบัตรประชาชน',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              fontFamily: "Prompt"))),
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Center(
                        child: Stack(
                      children: [
                        SizedBox(
                            height: 200,
                            child:
                                Image.asset("assets/images/front_citizen.png")),
                        const Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Center(
                            child: Icon(
                              CupertinoIcons.checkmark_alt_circle_fill,
                              color: Colors.green,
                              size: 32,
                            ),
                          ),
                        ),
                      ],
                    )),
                  ),
                  const SizedBox(height: 20),
                  const Center(
                      child: Text('โปรดถ่ายรูปให้ถูกต้อง',
                          style:
                              TextStyle(fontSize: 14, fontFamily: "Prompt"))),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Container(
                            width: Get.width / 4.7,
                            height: 70,
                            color: Colors.transparent,
                            child: Stack(
                              children: [
                                Image.asset(
                                    "assets/images/citizen_conflict1.png"),
                                const Positioned(
                                  bottom: 0,
                                  left: 0,
                                  right: 0,
                                  child: Center(
                                    child: Icon(
                                      CupertinoIcons.clear_circled_solid,
                                      color: Colors.red,
                                      size: 24,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Text(
                            "ออกนอกกรอบ",
                            style:
                                TextStyle(fontFamily: "Prompt", fontSize: 12),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            width: Get.width / 4.7,
                            height: 70,
                            color: Colors.transparent,
                            child: Stack(
                              children: [
                                Image.asset(
                                    "assets/images/citizen_conflict2.png"),
                                const Positioned(
                                  bottom: 0,
                                  left: 0,
                                  right: 0,
                                  child: Center(
                                    child: Icon(
                                      CupertinoIcons.clear_circled_solid,
                                      color: Colors.red,
                                      size: 24,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Text(
                            "ไม่ชัด",
                            style:
                                TextStyle(fontFamily: "Prompt", fontSize: 12),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            width: Get.width / 4.7,
                            height: 70,
                            color: Colors.transparent,
                            child: Stack(
                              children: [
                                Image.asset(
                                    "assets/images/citizen_conflict3.png"),
                                const Positioned(
                                  bottom: 0,
                                  left: 0,
                                  right: 0,
                                  child: Center(
                                    child: Icon(
                                      CupertinoIcons.clear_circled_solid,
                                      color: Colors.red,
                                      size: 24,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Text(
                            "เงาสะท้อน",
                            style:
                                TextStyle(fontFamily: "Prompt", fontSize: 12),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: TextButton(
                      onPressed: () {
                        pickImageAndNavigate();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Constants.orange,
                        ),
                        width: Get.width / 1.15,
                        height: 40,
                        child: const Center(
                          child: Text(
                            "ถัดไป",
                            style: TextStyle(
                                fontFamily: "Prompt", color: Colors.white),
                          ),
                        ),
                      )),
                ),
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
      appBar: const AppbarForm(),
      body: SafeArea(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              const Center(
                child: Text(
                  "ตั้งรหัสผ่าน",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    fontFamily: "Prompt",
                  ),
                ),
              ),
              Obx(() => Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 30),
                    child: TextFormField(
                      textInputAction: TextInputAction.done,
                      obscureText: !_passwordVisible.value,
                      controller: _controller.password,
                      validator: (value) {
                        if (value == "") {
                          return "กรุณากรอกข้อมูล";
                        } else if (value!.length < 6) {
                          return "รหัสผ่านต้องมีมากกว่า 6 ตัว";
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        hintText: "รหัสผ่าน",
                        hintStyle: const TextStyle(
                          fontSize: 14,
                          fontFamily: "Prompt",
                        ),
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
                                  : Icons.visibility_off),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )),
              Container(
                padding: const EdgeInsets.only(left: 30, right: 20),
                child: const Text(
                  "รหัสผ่านควรจะต้องประกอบด้วยตัวอักษรภาษาอังกฤษ 8-16 ตัวอักษร โดยมีตัวพิมพ์ใหญ่และตัวพิมพ์เล็กอย่างน้อยอย่างละ 1 ตัว",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 14),
                child: TextButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      _showMyDialog(context);
                    }
                  },
                  child: Container(
                    color: Constants.white,
                    width: Get.width / 1.15,
                    height: 40,
                    child: const Center(
                      child: Text(
                        "ถัดไป",
                        style: TextStyle(
                          fontFamily: "Prompt",
                          color: Constants.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
