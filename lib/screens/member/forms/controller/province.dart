import 'dart:convert';
import 'package:barter/screens/member/forms/controller/controller.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

// ignore: non_constant_identifier_names
List<String> province_th = [
  'กรุงเทพมหานคร',
  'กระบี่',
  'กาญจนบุรี',
  'กาฬสินธุ์',
  'กำแพงเพชร',
  'ขอนแก่น',
  'จันทบุรี',
  'ฉะเชิงเทรา',
  'ชลบุรี',
  'ชัยนาท',
  'ชัยภูมิ',
  'ชุมพร',
  'เชียงใหม่',
  'เชียงราย',
  'ตรัง',
  'ตราด',
  'ตาก',
  'นครนายก',
  'นครปฐม',
  'นครพนม',
  'นครราชสีมา',
  'นครศรีธรรมราช',
  'นครสวรรค์',
  'นนทบุรี',
  'นราธิวาส',
  'น่าน',
  'บึงกาฬ',
  'บุรีรัมย์',
  'ปทุมธานี',
  'ประจวบคีรีขันธ์',
  'ปราจีนบุรี',
  'ปัตตานี',
  'พระนครศรีอยุธยา',
  'พะเยา',
  'พังงา',
  'พัทลุง',
  'พิจิตร',
  'พิษณุโลก',
  'เพชรบุรี',
  'เพชรบูรณ์',
  'แพร่',
  'ภูเก็ต',
  'มหาสารคาม',
  'มุกดาหาร',
  'แม่ฮ่องสอน',
  'ยโสธร',
  'ยะลา',
  'ร้อยเอ็ด',
  'ระนอง',
  'ระยอง',
  'ราชบุรี',
  'ลพบุรี',
  'ลำปาง',
  'ลำพูน',
  'เลย',
  'ศรีสะเกษ',
  'สกลนคร',
  'สงขลา',
  'สตูล',
  'สมุทรปราการ',
  'สมุทรสงคราม',
  'สมุทรสาคร',
  'สระแก้ว',
  'สระบุรี',
  'สิงห์บุรี',
  'สุโขทัย',
  'สุพรรณบุรี',
  'สุราษฎร์ธานี',
  'สุรินทร์',
  'หนองคาย',
  'หนองบัวลำภู',
  'อ่างทอง',
  'อำนาจเจริญ',
  'อุดรธานี',
  'อุตรดิตถ์',
  'อุทัยธานี',
  'อุบลราชธานี',
];

List<dynamic> jsonData = [];
RxList tempAddress = [].obs;
RxList tempsubdistrict = [].obs;

Future<void> readJson() async {
  try {
    String jsonString = await rootBundle.loadString('assets/location.json');
    List<dynamic> data = jsonDecode(jsonString);
    jsonData = data;
  } catch (e) {
    // ignore: avoid_print
    print('Error reading JSON file: $e');
  }
}

Future<void> filterDistrict(String address) async {
  List<dynamic> filteredData =
      jsonData.where((item) => item['province'] == address).toList();
  for (var item in filteredData) {
    String amphoe = item['amphoe'];
    if (!tempAddress.contains(amphoe)) {
      tempAddress.add(amphoe);
    }
  }
}

Future<void> filterSubDistrict(String amphoe) async {
  List<dynamic> filteredData =
      jsonData.where((item) => item['amphoe'] == amphoe).toList();
  for (var item in filteredData) {
    String district = item['district'];
    if (!tempsubdistrict.contains(district)) {
      tempsubdistrict.add(district);
    }
  }
}

Future<void> filterPostCode(
    String province, String amphoe, String district) async {
  final MyController controller = Get.put(MyController());
  await readJson(); // Wait for JSON data to be loaded and parsed
  List<dynamic> filteredData = jsonData
      .where((item) =>
          item['province'] == province &&
          item['amphoe'] == amphoe &&
          item['district'] == district)
      .toList();
  for (var item in filteredData) {
    String myzipcode = item['zipcode'].toString();
    controller.selectedZipCode.value = myzipcode;
  }
}
