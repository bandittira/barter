import "package:barter/constant/color.dart";
import "package:barter/screens/member/forms/form.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:google_fonts/google_fonts.dart";
import "package:pinput/pinput.dart";

const focusedBorderColor = Color.fromRGBO(23, 171, 144, 1);
const fillColor = Color.fromRGBO(243, 246, 249, 0);
const borderColor = Constants.grey;

final defaultPinTheme = PinTheme(
  width: 50,
  height: 50,
  textStyle: GoogleFonts.poppins(
    fontSize: 20,
    color: const Color.fromRGBO(70, 69, 66, 1),
  ),
  decoration: BoxDecoration(
    color: const Color.fromARGB(94, 201, 204, 211),
    borderRadius: BorderRadius.circular(24),
  ),
);

final cursor = Align(
  alignment: Alignment.bottomCenter,
  child: Container(
    width: 21,
    height: 1,
    margin: const EdgeInsets.only(bottom: 12),
    decoration: BoxDecoration(
      color: const Color.fromARGB(255, 107, 113, 124),
      borderRadius: BorderRadius.circular(8),
    ),
  ),
);

final pinController = TextEditingController();
final focusNode = FocusNode();
final formKey = GlobalKey<FormState>();

Widget pinput() {
  WidgetsBinding.instance.addPostFrameCallback((_) {
    // Focus on the first node after the frame is built
    focusNode.requestFocus();
  });

  return Directionality(
    textDirection: TextDirection.ltr,
    child: Pinput(
      length: 6,
      controller: pinController,
      focusNode: focusNode,
      androidSmsAutofillMethod: AndroidSmsAutofillMethod.smsUserConsentApi,
      listenForMultipleSmsOnAndroid: true,
      defaultPinTheme: defaultPinTheme,
      separatorBuilder: (index) => const SizedBox(width: 8),
      validator: (value) {
        if (value == '222222') {
          return null;
        } else if (value == '') {
          return "โปรดใส่รหัส ที่ได้รับจาก SMS";
        } else {
          return "รหัสไม่ถูกต้อง";
        }
      },
      errorTextStyle: TextStyle(fontSize: 14, color: Colors.grey.shade800),
      hapticFeedbackType: HapticFeedbackType.lightImpact,
      onCompleted: (pin) {
        debugPrint('onCompleted: $pin');
        if (pin == "222222") {
          Get.to(RegisterForm());
        }
      },
      onChanged: (value) {
        debugPrint('onChanged: $value');
      },
      focusedPinTheme: defaultPinTheme.copyWith(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.05999999865889549),
              offset: Offset(0, 3),
              blurRadius: 16,
            ),
          ],
        ),
      ),
      cursor: cursor,
      showCursor: true,
    ),
  );
}
