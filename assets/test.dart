import 'dart:convert';
import 'dart:io';

void main() {
  try {
    File file = File("../assets/location.json");
    if (!file.existsSync()) {
      throw FileSystemException('File not found');
    }
    String fileContents = file.readAsStringSync();
    // Process the file contents as needed
  } catch (e) {
    print('Error accessing file: $e');
    // Handle the error gracefully (e.g., display a message to the user)
  }

  // Applying the 'where' condition to filter based on province
  //List<dynamic> filteredData = jsonData.where((item) => item['province'] == "ชลบุรี").toList();
  // List<dynamic> filteredData2 =
  //     jsonData.where((item) => item['amphoe'] == "บางละมุง").toList();

  // Using a Set to store unique amphoe values
  //Set<String> uniqueAmphoes = Set<String>();
  Set<String> uniqueAmphoes2 = Set<String>();

  // Adding unique amphoe values to the Set
  //filteredData.forEach((item) => uniqueAmphoes.add(item['amphoe']));
  //filteredData2.forEach((item) => uniqueAmphoes2.add(item['district']));

  // Printing the unique amphoe values
  //uniqueAmphoes.forEach((amphoe) => print(amphoe));
  uniqueAmphoes2.forEach((district) => print(district));
}

var province_th = [
  'กรุงเทพฯ',
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
