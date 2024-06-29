import 'dart:convert';
import 'package:barter/screens/member/forms/controller/controller.dart';
import 'package:barter/screens/member/forms/models/register_model.dart';
import 'package:http/http.dart' as http;

Future<void> uploadFormData(RegisterRequest registerRequest) async {
  //String url = 'http://49.0.192.147:8000/insertProduct';
  String url = 'http://10.0.2.2:8000/register';
  Map<String, String> requestData = {
    "phonenum": registerRequest.phonenum,
    "password": registerRequest.password,
    "fname": registerRequest.fname,
    "lname": registerRequest.lname,
    "lineId": registerRequest.lineId,
    "userAddress": jsonEncode(registerRequest.address),
    "storeDetails": jsonEncode(registerRequest.store),
  };
  try {
    var request = http.MultipartRequest('POST', Uri.parse(url));
    // Add form fields
    requestData.forEach((key, value) {
      request.fields[key] = value;
    });

    for (var x in images) {
      List<int> imageBytes1 = await x.readAsBytes();
      String fileName1 = x.path.split('/').last;
      request.files.add(http.MultipartFile.fromBytes('files', imageBytes1,
          filename: fileName1));
    }

    // Convert the image file to MultipartFile
    List<int> imageBytes = await image.value!.readAsBytes();
    String fileName = image.value!.path.split('/').last;
    request.files.add(
        http.MultipartFile.fromBytes('file', imageBytes, filename: fileName));

    // Send the request and get the response
    var response = await request.send();

    if (response.statusCode == 200) {
      // Request successful, handle the response
      var responseData = await response.stream.bytesToString();
      print('Response: ${json.decode(responseData)}');
    } else {
      // Request failed with an error status code
      print('Request failed with status: ${response.statusCode}');
    }
  } catch (e) {
    // Error occurred during the request
    print('Error: $e');
  }
}
