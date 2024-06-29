class RegisterRequest {
  String phonenum;
  String password;
  String fname;
  String lname;
  String lineId;
  List<Map<String, dynamic>> address;
  List<Map<String, dynamic>> store;

  RegisterRequest({
    required this.phonenum,
    required this.password,
    required this.fname,
    required this.lname,
    required this.lineId,
    required this.address,
    required this.store,
  });

  Map<String, dynamic> toJson() {
    return {
      'phonenum': phonenum,
      'password': password,
      'fname': fname,
      'lname': lname,
      'lineId': lineId,
      'address': address,
      'store': store,
    };
  }
}
