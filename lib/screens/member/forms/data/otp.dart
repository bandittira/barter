import 'dart:convert';
import 'package:barter/screens/member/forms/controller/controller.dart';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> sendOTP(String phoneNumber) async {
  final url =
      Uri.parse('http://10.0.2.2:8000/getOTP'); // Replace with your API URL
  final headers = {"Content-Type": "application/json"};
  final body = jsonEncode({"phone_number": phoneNumber});

  final response = await http.post(url, headers: headers, body: body);

  if (response.statusCode == 200 || response.statusCode == 201) {
    return jsonDecode(response.body);
  } else {
    throw Exception('Failed to get OTP: ${response.body}');
  }
}

Future<Map<String, dynamic>> verifyOTP(String phoneNumber, String otp) async {
  final url =
      Uri.parse('http://10.0.2.2:8000/verify-otp'); // Replace with your API URL
  final headers = {"Content-Type": "application/json"};
  final body = jsonEncode({"phone_number": phoneNumber, "otp": otp});

  try {
    final response = await http.post(url, headers: headers, body: body);

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseBody = jsonDecode(response.body);
      // Print the response body for debugging purposes
      return responseBody;
    } else {
      throw Exception('Failed to verify OTP: ${response.body}');
    }
  } catch (e) {
    // Log the error and rethrow it
    throw Exception('Failed to connect to the server: $e');
  }
}

Future<Map<String, dynamic>> getOTP(String phoneNumber) async {
  final url = Uri.parse(
      'http://10.0.2.2:8000/get_otp?phonenum=$phoneNumber'); // Replace with your API URL
  final headers = {"Content-Type": "application/json"};
  try {
    final response = await http.get(url, headers: headers);
    final Map<String, dynamic> responseBody = jsonDecode(response.body);
    otp.value = responseBody['otp'];
    return responseBody;
  } catch (e) {
    // Log the error and rethrow it
    throw Exception('Failed to connect to the server: $e');
  }
}
