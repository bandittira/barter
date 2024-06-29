import 'package:barter/constant/color.dart';
import 'package:barter/screens/member/forms/controller/controller.dart';
import 'package:barter/screens/member/forms/data/register.dart';
import 'package:barter/screens/member/forms/models/register_model.dart';
import 'package:barter/screens/member/pending.dart';
import 'package:barter/widgets/member/appbar/form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MultipleImagePicker extends StatelessWidget {
  const MultipleImagePicker({super.key});

  @override
  Widget build(BuildContext context) {
    final MyController controller = Get.put(MyController());

    return Scaffold(
      appBar: const AppbarForm(),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Center(
              child: Text(
                "รูปภาพร้านค้า",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  fontFamily: "Prompt",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Center(
                child: ElevatedButton(
                  onPressed: controller.pickImages,
                  child: const Text(
                    'เลือกรูปภาพ',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Center(
                child: Obx(() {
                  return Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: images.map((image) {
                      return Stack(
                        children: [
                          Image.file(
                            image,
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                          Positioned(
                            right: 0,
                            top: 0,
                            child: GestureDetector(
                              onTap: () => controller.removeImage(image),
                              child: Container(
                                decoration: const BoxDecoration(
                                  color: Colors.red,
                                  shape: BoxShape.circle,
                                ),
                                padding: const EdgeInsets.all(4),
                                child: const Icon(
                                  Icons.close,
                                  color: Colors.white,
                                  size: 16,
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    }).toList(),
                  );
                }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Container(
                padding: const EdgeInsets.only(left: 30, right: 20),
                child: const Text(
                  "โปรดเลือกรูปภาพร้านค้า 5 รูปขึ้นไป",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 50),
                child: TextButton(
                  onPressed: () {
                    if (images.isEmpty) {
                      Get.snackbar("แจ้งเตือน", "ท่านยังไม่เลือกรูปภาพ");
                    } else if (images.length < 5) {
                      Get.snackbar("แจ้งเตือน", "โปรดเลือกรูปภาพ 5 รูปขึ้นไป");
                    } else {
                      // controller.addUserAddress();
                      // controller.addStoreValues();
                      // uploadFormData(RegisterRequest(
                      //     phonenum: controller.phoneNumberController.text,
                      //     password: controller.password.text,
                      //     fname: controller.fname.text,
                      //     lname: controller.lname.text,
                      //     lineId: controller.lineId.text,
                      //     address: userAddressData,
                      //     store: storeData));
                      Get.to(PendingPage());
                    }
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
                          fontFamily: "Prompt",
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
