import 'package:barter/constant/color.dart';
import 'package:barter/constant/province.dart';
import 'package:barter/element/form/appbar/form.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class MyController extends GetxController {
  var selectedProvince = "กรุงเทพฯ".obs;
}

//ignore: must_be_immutable
class AddressForm extends StatelessWidget {
  AddressForm({Key? key}) : super(key: key);

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String? validateInput(String? value) {
    if (value == null || value.isEmpty) {
      return 'โปรดกรอกข้อมูล';
    }
    return null; // Return null if validation passes
  }

  final MyController controller = Get.put(MyController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppbarForm(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
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
                    "ที่อยู่",
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
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
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
                        hintText: "111/11",
                        hintStyle:
                            TextStyle(fontSize: 14, fontFamily: "Prompt"),
                        prefixIcon: Icon(
                          Iconsax.location,
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
                    "จังหวัด",
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
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(0),
                      color: Colors.grey.shade100,
                    ),
                  ),
                  DropdownSearch<String>(
                    validator: validateInput,
                    popupProps: PopupProps.menu(
                      showSelectedItems: true,
                      disabledItemFn: (String s) => s.startsWith('I'),
                    ),
                    items: province_th,
                    dropdownDecoratorProps: const DropDownDecoratorProps(
                      dropdownSearchDecoration: InputDecoration(
                          hintText: "country in menu mode",
                          prefixIcon: Icon(Iconsax.map)),
                    ),
                    onChanged: (value) => {
                      controller.selectedProvince.value = value.toString(),
                      print(controller.selectedProvince.value),
                      filterDistrict(controller.selectedProvince.value)
                    },
                    selectedItem: "กรุงเทพฯ",
                  )
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 35, top: 10),
              child: Row(
                children: [
                  Text(
                    "อำเภอ",
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
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
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
                        hintText: "บางซื่อ",
                        hintStyle:
                            TextStyle(fontSize: 14, fontFamily: "Prompt"),
                        prefixIcon: Icon(
                          Iconsax.map_15,
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
                    "ตำบล",
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
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
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
                        hintText: "บางซื่อ",
                        hintStyle:
                            TextStyle(fontSize: 14, fontFamily: "Prompt"),
                        prefixIcon: Icon(
                          Iconsax.map_15,
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
                    "รหัสไปรษณีย์",
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
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(0),
                      color: Colors.grey.shade100,
                    ),
                  ),
                  TextFormField(
                    scrollPadding: const EdgeInsets.only(bottom: 400),
                    keyboardType: TextInputType.number,
                    validator: validateInput,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                        hintText: "10800",
                        hintStyle:
                            TextStyle(fontSize: 14, fontFamily: "Prompt"),
                        prefixIcon: Icon(
                          Iconsax.box,
                          size: 24,
                          color: Constants.grey,
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
    );
  }
}
