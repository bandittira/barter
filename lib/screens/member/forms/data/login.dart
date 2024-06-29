import 'dart:convert';
import 'package:barter/screens/member/forms/controller/login.dart';
import 'package:barter/utilize/bottom_nav.dart';
import 'package:flutter/services.dart';
import 'package:flutter_line_sdk/flutter_line_sdk.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> login(String phoneNumber, String password) async {
  final url =
      Uri.parse('http://10.0.2.2:8000/login'); // Replace with your API URL
  final headers = {"Content-Type": "application/json"};
  final body = jsonEncode({"username": phoneNumber, "password": password});

  final response = await http.post(url, headers: headers, body: body);

  if (response.statusCode == 200 || response.statusCode == 201) {
    message.value = "";
    final Map<String, dynamic> responseBody = jsonDecode(response.body);
    message.value = responseBody['message'];
    if (message.value == "Login Success") {
      Get.offAll(const Tabview());
    } else if (message.value == "Username or Password does not match") {
      Get.snackbar("แจ้งเตือน", "เบอร์โทร หรือ รหัสผ่าน ไม่ถูกต้อง");
    }
    return responseBody;
  } else {
    Get.snackbar("แจ้งเตือน", "ไม่สามารถเข้าสู่ระบบ โปรดติดต่อผู้ดูแล");
    throw Exception('Failed to login: ${response.body}');
  }
}

Future getAccessToken() async {
  try {
    final result = await LineSDK.instance.currentAccessToken;
    return result?.value;
  } on PlatformException catch (e) {
    print(e.message);
  }
}

void startLineLogin() async {
  try {
    final result = await LineSDK.instance.login(scopes: ["profile"]);
    print(result.toString());
    var accesstoken = await getAccessToken();
    var displayname = result.userProfile?.displayName;
    var statusmessage = result.userProfile?.statusMessage;
    var imgUrl = result.userProfile?.pictureUrl;
    var userId = result.userProfile?.userId;

    print("AccessToken> " + accesstoken);
    print("DisplayName> " + displayname.toString());
    print("StatusMessage> " + statusmessage.toString());
    print("ProfileURL> " + imgUrl.toString());
    print("userId> " + userId.toString());
  } on PlatformException catch (e) {
    print(e);
    switch (e.code.toString()) {
      case "CANCEL":
        Get.snackbar("คุณยกเลิกการเข้าสู่ระบบ",
            "เมื่อสักครู่คุณกดยกเลิกการเข้าสู่ระบบ กรุณาเข้าสู่ระบบใหม่อีกครั้ง");
        print("User Cancel the login");
        break;
      case "AUTHENTICATION_AGENT_ERROR":
        Get.snackbar("คุณไม่อนุญาติการเข้าสู่ระบบด้วย LINE",
            "เมื่อสักครู่คุณกดยกเลิกการเข้าสู่ระบบ กรุณาเข้าสู่ระบบใหม่อีกครั้ง");
        print("User decline the login");
        break;
      default:
        Get.snackbar("เกิดข้อผิดพลาด",
            "เกิดข้อผิดพลาดไม่ทราบสาเหตุ กรุณาเข้าสู่ระบบใหม่อีกครั้ง");
        print("Unknown but failed to login");
        break;
    }
  }
}

void logout(context) async{
    try {
      await LineSDK.instance.logout();
      Get.offAll(context);
    } on PlatformException catch (e) {
      print(e.message);
    }
  }