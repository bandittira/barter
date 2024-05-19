import 'package:barter/constant/color.dart';
import 'package:barter/screens/member/forms/controller/province.dart';
import 'package:barter/widgets/form/appbar/form.dart';
import 'package:barter/screens/member/forms/controller/controller.dart';
import 'package:barter/screens/member/forms/controller/validator.dart';
import 'package:barter/screens/member/forms/store_form.dart';
import 'package:barter/widgets/form/appbar/textformfield.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

//ignore: must_be_immutable
class AddressForm extends StatelessWidget {
  AddressForm({Key? key}) : super(key: key);

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final MyController _controller = Get.put(MyController());

  @override
  Widget build(BuildContext context) {
    // void _onLoading(void Function() anotherfunction) {
    //   showDialog(
    //     context: context,
    //     barrierDismissible: false,
    //     builder: (BuildContext context) {
    //       return const Center(child: CircularProgressIndicator());
    //     },
    //   );
    //   Future.delayed(const Duration(milliseconds: 200), () {
    //     anotherfunction();
    //     Get.back();
    //   });
    // }

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
                  "กรอกที่อยู่",
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
              MyCustomTextField(
                keyboardType: TextInputType.text,
                hintText: "ตัวอย่าง 111/11",
                prefixIcon: Iconsax.location,
                horizontal: 30,
                vertical: 10,
                validator: validateInput,
                controller: _controller.address,
                bottom: 0,
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
                    DropdownSearch<String>(
                      validator: (String? item) {
                        if (item == "โปรดเลือก") {
                          return "โปรดเลือกจังหวัด";
                        } else {
                          return null;
                        }
                      },
                      popupProps: PopupProps.menu(
                        showSelectedItems: true,
                        disabledItemFn: (String s) => s.startsWith('I'),
                      ),
                      items: province_th,
                      dropdownDecoratorProps: const DropDownDecoratorProps(
                        dropdownSearchDecoration: InputDecoration(
                            hintText: "country in menu mode",
                            prefixIcon: Icon(Iconsax.map_15)),
                      ),
                      onChanged: (value) => {
                        tempAddress.value = [],
                        _controller.selectedProvince.value = value.toString(),
                        filterDistrict(_controller.selectedProvince.value)
                      },
                      selectedItem: "โปรดเลือก",
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
                    Obx(() => DropdownSearch<String>(
                          validator: (String? item) {
                            if (item == "โปรดเลือก") {
                              return "โปรดเลือกจังหวัด";
                            } else {
                              return null;
                            }
                          },
                          popupProps: PopupProps.menu(
                            showSelectedItems: true,
                            disabledItemFn: (String s) => s.startsWith('I'),
                          ),
                          items: tempAddress.toList().cast<String>(),
                          dropdownDecoratorProps: const DropDownDecoratorProps(
                            dropdownSearchDecoration: InputDecoration(
                                hintText: "country in menu mode",
                                prefixIcon: Icon(Iconsax.map)),
                          ),
                          onChanged: (value) => {
                            tempsubdistrict.value = [],
                            _controller.selectedDistrict.value =
                                value.toString(),
                            filterSubDistrict(
                                _controller.selectedDistrict.value)
                          },
                          selectedItem: "โปรดเลือก",
                        ))
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
                    Obx(() => DropdownSearch<String>(
                          validator: (String? item) {
                            if (item == "โปรดเลือก") {
                              return "โปรดเลือกจังหวัด";
                            } else {
                              return null;
                            }
                          },
                          popupProps: PopupProps.menu(
                            showSelectedItems: true,
                            disabledItemFn: (String s) => s.startsWith('I'),
                          ),
                          items: tempsubdistrict.toList().cast<String>(),
                          dropdownDecoratorProps: const DropDownDecoratorProps(
                            dropdownSearchDecoration: InputDecoration(
                                hintText: "country in menu mode",
                                prefixIcon: Icon(Iconsax.map)),
                          ),
                          onChanged: (value) => {
                            _controller.selectedSubDistrict.value =
                                value.toString(),
                            filterPostCode(
                                _controller.selectedProvince.value,
                                _controller.selectedDistrict.value,
                                _controller.selectedSubDistrict.value)
                          },
                          selectedItem: "โปรดเลือก",
                        ))
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: Stack(children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(0),
                      color: Colors.grey.shade100,
                    ),
                  ),
                  Obx(() => TextFormField(
                        style:
                            const TextStyle(fontSize: 14, fontFamily: "Prompt"),
                        controller: TextEditingController(
                            text: _controller.selectedZipCode.value),
                        scrollPadding: const EdgeInsets.only(bottom: 400),
                        keyboardType: TextInputType.number,
                        validator: validateInput,
                        textInputAction: TextInputAction.next,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                          // ให้รับเฉพาะตัวเลข 1-10
                        ],
                        decoration: const InputDecoration(
                            hintText: "ตัวอย่าง 10800",
                            hintStyle:
                                TextStyle(fontSize: 14, fontFamily: "Prompt"),
                            prefixIcon: Icon(
                              Iconsax.box,
                              size: 24,
                              color: Constants.grey,
                            ) // Remove bottom border line
                            ),
                      ))
                ]),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 50),
                  child: TextButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          Get.to(StoreForm());
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
