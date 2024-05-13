import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyController extends GetxController {
  // sign up page
  final TextEditingController phoneNumberController = TextEditingController();

  // form page
  final TextEditingController password = TextEditingController();
  final Rx<File?> image = Rx<File?>(null);

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

}
