import 'package:dio/dio.dart';
import 'package:get/get.dart';

RxString validate = "".obs;
RxString isDuplicate = "false".obs;
final dio = Dio();

String? validateInput(String? value) {
  if (value == null || value.isEmpty) {
    return 'โปรดกรอกข้อมูล';
  }
  return null; // Return null if validation passes
}

String? validatePhoneNumberLocal(String? value) {
  if (value == null || value.isEmpty) {
    return "โปรดกรอกเบอร์โทรศัพท์";
  }
  // You can add more complex validation logic here if needed
  return null; // Return null if the input is valid
}

String? validatePhoneNumber(String? value) {
  if (value == null || value.isEmpty) {
    validate.value = "โปรดกรอกเบอร์โทรศัพท์";
    return validate.value;
  } else if (isDuplicate == "true") {
    validate.value = "เบอร์โทรถูกใช้แล้ว";
    return validate.value;
  } else if (isDuplicate == "error") {
    validate.value = "ไม่สามารถตรวจสอบ กรุณาติดต่อผู้ดูแล";
    return validate.value;
  }
  // You can add more complex validation logic here if needed
  return null; // Return null if the input is valid
}

Future<void> duplicate(String phonenum) async {
  try {
    final response = await Dio().get('http://10.0.2.2:8000/duplicated',
        queryParameters: {'phonenum': phonenum});

    if (response.statusCode == 200) {
      final data = response.data;
      if (data != null && data is bool) {
        isDuplicate.value = data.toString();
        if (data) {
          print(isDuplicate.value);
        }
      } else {
        throw Exception("Unexpected response data: $data");
      }
    } else {
      throw Exception(
          "Failed to load data, status code: ${response.statusCode}");
    }
  } on DioException catch (dioError) {
    if (dioError.type == DioExceptionType.connectionError) {
      // Handle no internet connection
      isDuplicate.value = "no connection";
      print("No internet connection: ${dioError.message}");
    } else {
      isDuplicate.value = "error";
      print("Dio error occurred: ${dioError.message}");
    }
  } catch (e) {
    isDuplicate.value = "error";
    print("Error occurred: $e");
    // Handle the error accordingly, e.g., show a message to the user
  }
}
