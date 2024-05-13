import 'package:barter/widgets/form/appbar/form.dart';
import 'package:flutter/material.dart';

class StoreForm extends StatelessWidget {
  const StoreForm({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppbarForm(),
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              "ข้อมูลร้านค้า",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                fontFamily: "Prompt",
              ),
            ),
          ),
        ],
      )),
    );
  }
}
