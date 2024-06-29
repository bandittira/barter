import 'package:barter/constant/color.dart';
import 'package:barter/screens/member/forms/controller/controller.dart';
import 'package:barter/screens/member/forms/controller/validator.dart';
import 'package:barter/screens/member/forms/pick_multi_images.dart';
import 'package:barter/widgets/member/appbar/form.dart';
import 'package:barter/widgets/member/appbar/textformfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

// ignore: must_be_immutable
class StoreForm extends StatelessWidget {
  StoreForm({super.key});

  final MyController _controller = Get.put(MyController());

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppbarForm(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Form(
          key: formKey,
          child: SafeArea(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Text(
                  "ข้อมูลร้านค้า",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    fontFamily: "Prompt",
                  ),
                ),
              ),
              const MyCustomTopic(
                text: "ชื่อร้านค้า",
                left: 35,
                top: 30,
              ),
              MyCustomTextField(
                  keyboardType: TextInputType.text,
                  bottom: 0,
                  hintText: "ตัวอย่าง บาเทอร์",
                  prefixIcon: Iconsax.shop,
                  validator: validateInput,
                  controller: _controller.storeName,
                  horizontal: 30,
                  vertical: 10),
              const MyCustomTopic(
                text: "ชื่อสินค้า",
                left: 35,
                top: 10,
              ),
              MyCustomTextField(
                  keyboardType: TextInputType.text,
                  bottom: 0,
                  hintText: "ตัวอย่าง โรงแรม บาเทอร์",
                  prefixIcon: Iconsax.shop,
                  validator: validateInput,
                  controller: _controller.storeProductName,
                  horizontal: 30,
                  vertical: 10),
              const MyCustomTopic(
                text: "ที่อยู่ร้านค้า",
                left: 35,
                top: 10,
              ),
              MyCustomTextField(
                  keyboardType: TextInputType.streetAddress,
                  bottom: 200,
                  hintText: "ตัวอย่าง 194/86 ต.สว่าง อ.สว่าง จ.ชลบุรี",
                  prefixIcon: Iconsax.map,
                  validator: validateInput,
                  controller: _controller.storeAddress,
                  horizontal: 30,
                  vertical: 10),
              const MyCustomTopic(
                text: "เบอร์โทร ร้านค้า",
                left: 35,
                top: 10,
              ),
              MyCustomTextField(
                  bottom: 300,
                  hintText: "ตัวอย่าง 098-888-8888",
                  prefixIcon: CupertinoIcons.phone,
                  keyboardType: TextInputType.phone,
                  validator: validatePhoneNumberLocal,
                  controller: _controller.storePhone,
                  textInputAction: TextInputAction.next,
                  horizontal: 30,
                  vertical: 10),
              const MyCustomTopic(
                text: "รายละเอียดร้านค้า",
                left: 35,
                top: 10,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: Stack(children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(0),
                      color: Colors.grey.shade100,
                    ),
                  ),
                  TextFormField(
                    style: const TextStyle(fontSize: 14, fontFamily: "Prompt"),
                    controller: _controller.storeDetail,
                    scrollPadding: const EdgeInsets.only(bottom: 500),
                    keyboardType: TextInputType.multiline,
                    maxLines: 4,
                    minLines: 1,
                    validator: validateInput,
                    textInputAction: TextInputAction.newline,
                    decoration: const InputDecoration(
                        hintText: "โปรดกรอก รายละเอียดร้านค้า",
                        hintStyle:
                            TextStyle(fontSize: 14, fontFamily: "Prompt"),
                        prefixIcon: Icon(
                          Iconsax.box,
                          size: 24,
                          color: Constants.grey,
                        ) // Remove bottom border line
                        ),
                  )
                ]),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 50),
                  child: TextButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          Get.to(const MultipleImagePicker());
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
    );
  }
}
