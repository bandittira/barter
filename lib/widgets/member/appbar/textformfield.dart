import 'package:barter/constant/color.dart';
import 'package:flutter/material.dart';

class MyCustomTopic extends StatelessWidget {
  final String text;
  final double left;
  final double top;
  const MyCustomTopic(
      {Key? key, required this.text, required this.left, required this.top})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: left, top: top),
      child: Row(
        children: [
          Text(
            text,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              fontFamily: "Prompt",
            ),
          ),
        ],
      ),
    );
  }
}

class MyCustomTextField extends StatelessWidget {
  final String hintText;
  final IconData prefixIcon;
  final String? Function(String?)? validator;
  final TextInputAction textInputAction;
  final TextInputType keyboardType;
  final TextEditingController? controller;
  final double horizontal;
  final double vertical;
  final double bottom;

  const MyCustomTextField({
    Key? key,
    required this.hintText,
    required this.prefixIcon,
    required this.validator,
    this.textInputAction = TextInputAction.next,
    required this.keyboardType,
    required this.controller,
    required this.horizontal,
    required this.vertical,
    required this.bottom,
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
            scrollPadding: EdgeInsets.only(bottom: bottom),
            controller: controller,
            validator: validator,
            textInputAction: textInputAction,
            keyboardType: keyboardType,
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
