import 'dart:io';

import 'package:barter/constant/color.dart';
import 'package:barter/element/form/appbar/form.dart';
import 'package:barter/screens/member/forms/personal_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';

class RegisterForm extends StatelessWidget {
  RegisterForm({Key? key}) : super(key: key);

  // Toggles the password
  final _passwordVisible = false.obs;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // Pick image
  final ImagePicker _picker = ImagePicker();
  final Rx<File?> image = Rx<File?>(null);

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
                      pickImageAndNavigate(); // Call pickImageAndNavigate instead of Get.to(pickImage())
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
