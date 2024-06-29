import 'package:animate_do/animate_do.dart';
import 'package:barter/constant/color.dart';
import 'package:barter/utilize/bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class PendingPage extends StatelessWidget {
  const PendingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          Stack(
            children: [
              Center(
                child: Lottie.asset("assets/lotties/celebrate.json",
                    width: 500, height: 250, repeat: true),
              ),
              Center(
                child: FadeInUp(
                  child: Lottie.asset("assets/lotties/correct.json",
                      width: 180, repeat: false),
                ),
              ),
            ],
          ),
          const Text(
            "ลงทะเบียนเสร็จสิ้น",
            style: TextStyle(fontFamily: "Prompt", fontSize: 24),
          ).animate().fade(duration: 500.ms).scale(delay: 500.ms),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            width: Get.width / 1.3,
            child: const Text(
              textAlign: TextAlign.center,
              "ผู้ดูแลได้รับข้อมูลของท่านแล้ว จะดำเนินการตรวจสอบ\n เพื่ออนุมัติการใช้งานให้แก่ท่าน",
              style: TextStyle(fontFamily: "Prompt", fontSize: 12),
            ).animate().fade(duration: 500.ms).scale(delay: 500.ms),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 14),
            child: TextButton(
                onPressed: () {
                  Get.offAll(const Tabview());
                },
                child: Container(
                  color: Constants.white,
                  width: Get.width / 1.15,
                  height: 40,
                  child: const Center(
                    child: Text(
                      "กลับสู่หน้าหลัก",
                      style: TextStyle(
                          fontFamily: "Prompt", color: Constants.black),
                    ),
                  ),
                )),
          ).animate().fade(duration: 500.ms).scale(delay: 500.ms),
          const Spacer()
        ],
      )),
    );
  }
}
