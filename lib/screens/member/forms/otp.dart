import 'package:barter/constant/color.dart';
import 'package:barter/element/otp/appbar.dart';
import 'package:barter/element/otp/pinput.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PinputExample extends StatelessWidget {
  final String phoneNumber;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  PinputExample({Key? key, required this.phoneNumber}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppbarOTP(),
      body: FractionallySizedBox(
        widthFactor: 1,
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Text("คุณจะได้รับรหัสยืนยันผ่านทาง SMS ไปที่"),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: Text(
                  "(+66) ${formatPhoneNumber(phoneNumber.substring(1))}",
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w500),
                ),
              ),
              pinput(), // Make sure pinput is a valid widget and imported correctly
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 22),
                child: TextButton(
                  onPressed: () {
                    formKey.currentState!.validate();
                    if (formKey.currentState!.validate()) {
                      print('true');
                      // Navigate to the next screen or perform other actions
                    } else {
                      print('false');
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
                            fontFamily: "Prompt", color: Constants.black),
                      ),
                    ),
                  ),
                ),
              ),
              const Spacer()
            ],
          ),
        ),
      ),
    );
  }

  static String formatPhoneNumber(String number) {
    final sanitizedNumber = number.replaceAll(
        RegExp(r'[^\d]'), ''); // Remove non-numeric characters
    if (sanitizedNumber.length <= 2) {
      return sanitizedNumber;
    }
    final parts = <String>[];
    parts.add(sanitizedNumber.substring(0, 2)); // Add first group of two digits
    int index = 2;
    while (index < sanitizedNumber.length - 4) {
      parts.add(sanitizedNumber.substring(index, index + 3));
      index += 3;
    }
    parts.add(sanitizedNumber
        .substring(index)); // Add the last group without splitting
    return parts.join(' '); // Join parts with space
  }
}
