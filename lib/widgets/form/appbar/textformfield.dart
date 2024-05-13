import 'package:barter/constant/color.dart';
import 'package:flutter/material.dart';

class MyCustomTextField extends StatelessWidget {
  final String hintText;
  final IconData prefixIcon;
  final String? Function(String?)? validator;
  final TextInputAction textInputAction;
  final TextEditingController? controller;
  final double horizontal;
  final double vertical;

  const MyCustomTextField({
    Key? key,
    required this.hintText,
    required this.prefixIcon,
    this.validator,
    this.textInputAction = TextInputAction.next,
    this.controller,
    required this.horizontal,
    required this.vertical,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(0),
              color: Colors.grey.shade100,
            ),
          ),
          TextFormField(
            controller: controller,
            validator: validator,
            textInputAction: textInputAction,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: const TextStyle(fontSize: 14, fontFamily: "Prompt"),
              prefixIcon: Icon(
                prefixIcon,
                size: 24,
                color: Constants.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
