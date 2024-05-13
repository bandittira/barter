  String? validateInput(String? value) {
    if (value == null || value.isEmpty) {
      return 'โปรดกรอกข้อมูล';
    }
    return null; // Return null if validation passes
  }

    String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'โปรดใส่หมายเลขโทรศัพท์';
    }
    // You can add more complex validation logic here if needed
    return null; // Return null if the input is valid
  }
