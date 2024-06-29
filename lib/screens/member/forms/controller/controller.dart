import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

final Rx<File?> image = Rx<File?>(null);
final String? filename = image.value?.path;
final RxList<File> images = <File>[].obs;

List<Map<String, dynamic>> userAddressData = [];
List<Map<String, dynamic>> storeData = [];

RxString otp = "".obs;

class MyController extends GetxController {
  RxString message = "".obs;
  // sign up page
  final TextEditingController phoneNumberController = TextEditingController();

  // form page
  final TextEditingController password = TextEditingController();

  // personal_form
  final TextEditingController fname = TextEditingController();
  final TextEditingController lname = TextEditingController();
  final TextEditingController lineId = TextEditingController();

  // address_form
  var selectedProvince = "".obs;
  var selectedDistrict = "".obs;
  var selectedSubDistrict = "".obs;
  var selectedZipCode = "".obs;
  final TextEditingController address = TextEditingController();
  // store_form
  final TextEditingController storeName = TextEditingController();
  final TextEditingController storeProductName = TextEditingController();
  final TextEditingController storeAddress = TextEditingController();
  final TextEditingController storePhone = TextEditingController();
  final TextEditingController storeDetail = TextEditingController();

  Future<void> pickImages() async {
    final pickedImages = await ImagePicker().pickMultiImage();
    // ignore: unnecessary_null_comparison
    if (pickedImages != null) {
      images.addAll(pickedImages.map((e) => File(e.path)));
    }
  }

  void removeImage(File image) {
    images.remove(image);
  }

  void addUserAddress() {
    userAddressData.clear();
    Map<String, dynamic> addressMap = {
      "address": address.text,
      "province": selectedProvince.value,
      "district": selectedDistrict.value,
      "subdistrict": selectedSubDistrict.value,
      "zipcode": selectedZipCode.value,
    };
    //test1.value = userAddressData[0];
    userAddressData.add(addressMap);
  }

  void addStoreValues() {
    storeData.clear();
    Map<String, dynamic> storeMap = {
      "storeName": storeName.text,
      "storeProductName": storeProductName.text,
      "storeAddress": storeAddress.text,
      "storePhone": storePhone.text,
      "storeDetail": storeDetail.text,
    };
    storeData.add(storeMap);
    //test2.value = storeData[0];
  }
}
