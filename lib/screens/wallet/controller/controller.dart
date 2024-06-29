import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WalletController extends GetxController {
  RxInt amount = 0.obs;
  String toCurrency = 'THB'; // Change this to your desired currency
  RxDouble? ftmtempPrice = 0.0.obs;
  RxDouble? rate = 0.0.obs;
  RxInt? baht = 1.obs; // Change

  TextEditingController toAmount = TextEditingController();
  TextEditingController toBaht = TextEditingController();

  RxList type = ["witdraw", "deposit", "witdraw"].obs;
  RxList balance = ["1000", "500", "250"].obs;
}
