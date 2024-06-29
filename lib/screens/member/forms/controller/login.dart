import 'package:flutter/material.dart';
import 'package:get/get.dart';

RxString message = "".obs;

class LoginController extends GetxController {
  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();
}
