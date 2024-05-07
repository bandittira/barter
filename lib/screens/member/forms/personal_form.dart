import 'package:barter/constant/color.dart';
import 'package:barter/element/form/appbar/form.dart';
import 'package:barter/screens/member/forms/address_form.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class NextScreen extends StatelessWidget {
  NextScreen({super.key});

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String? validateInput(String? value) {
    if (value == null || value.isEmpty) {
      return 'โปรดกรอกข้อมูล';
    }
    return null; // Return null if validation passes
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: const AppbarForm(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          color: Colors.white,
          width: Get.width,
          child: Form(
            key: formKey,
            child: SafeArea(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                  child: Text(
                    "กรอกข้อมูลผู้ใช้",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Prompt",
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 35, top: 30),
                  child: Row(
                    children: [
                      Text(
                        "ชื่อ",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          fontFamily: "Prompt",
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(0),
                          color: Colors.grey.shade100,
                        ),
                      ),
                      TextFormField(
                        validator: validateInput,
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(
                            hintText: "ชื่อจริง (ภาษาไทย)",
                            hintStyle:
                                TextStyle(fontSize: 14, fontFamily: "Prompt"),
                            prefixIcon: Icon(
                              Iconsax.profile_circle,
                              size: 24,
                              color: Constants.grey,
                            ) // Remove bottom border line
                            ),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 35, top: 10),
                  child: Row(
                    children: [
                      Text(
                        "นามสกุล",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          fontFamily: "Prompt",
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(0),
                          color: Colors.grey.shade100,
                        ),
                      ),
                      TextFormField(
                        validator: validateInput,
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(
                            hintText: "นามสกุล (ภาษาไทย)",
                            hintStyle:
                                TextStyle(fontSize: 14, fontFamily: "Prompt"),
                            prefixIcon: Icon(
                              Iconsax.profile_circle,
                              size: 24,
                              color: Constants.grey,
                            ) // Remove bottom border line
                            ),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 35, top: 10),
                  child: Row(
                    children: [
                      Text(
                        "เบอร์โทรศัพท์",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          fontFamily: "Prompt",
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(0),
                          color: Colors.grey.shade100,
                        ),
                      ),
                      TextFormField(
                        validator: validateInput,
                        keyboardType: TextInputType.phone,
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(
                            hintText: "086-666-6666",
                            hintStyle:
                                TextStyle(fontSize: 14, fontFamily: "Prompt"),
                            prefixIcon: Icon(
                              Iconsax.call,
                              size: 24,
                              color: Constants.grey,
                            ) // Remove bottom border line
                            ),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 35, top: 10),
                  child: Row(
                    children: [
                      Text(
                        "ไอดีไลน์",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          fontFamily: "Prompt",
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(0),
                          color: Colors.grey.shade100,
                        ),
                      ),
                      TextFormField(
                        scrollPadding: const EdgeInsets.only(bottom: 200),
                        validator: validateInput,
                        textInputAction: TextInputAction.done,
                        decoration: const InputDecoration(
                            hintText: "โปรดกรอกไอดีไลน์",
                            hintStyle:
                                TextStyle(fontSize: 14, fontFamily: "Prompt"),
                            prefixIcon: Icon(
                              FontAwesomeIcons.line,
                              size: 24,
                              color: Colors.green,
                            ) // Remove bottom border line
                            ),
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 50),
                    child: TextButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            // Get.to(PinputExample(
                            //   phoneNumber: phoneNumberController.text,
                            // ));
                            Get.to(AddressForm());
                          } else {}
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
            )),
          ),
        ),
      ),
    );
  }
}
