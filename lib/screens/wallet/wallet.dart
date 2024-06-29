import 'dart:async';

import 'package:barter/constant/color.dart';
import 'package:barter/screens/wallet/controller/controller.dart';
import 'package:barter/screens/wallet/data/data.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _WalletPageState createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  Timer? _timer;
  final ApiService apiService = ApiService();

  @override
  void initState() {
    super.initState();
    _timer =
        Timer.periodic(const Duration(seconds: 10), (timer) => fetchPrice());
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  Future<void> fetchPrice() async {
    final WalletController _controller = Get.put(WalletController());
    try {
      final fetchedPrice =
          await apiService.getFantomPriceInCurrency(_controller.toCurrency);
      _controller.ftmtempPrice!.value = (fetchedPrice + 1);
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    fetchPrice();
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          fetchPrice();
        },
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SizedBox(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _header(),
                    _card(),
                    _ftm(),
                    _menu(),
                    _buyFTM(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _header() {
    return Padding(
      padding: const EdgeInsets.only(right: 40, left: 40, top: 20, bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "กระเป๋าตัง",
            style: TextStyle(
              fontFamily: "Prompt",
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 8,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
              borderRadius: BorderRadius.circular(25),
              color: Colors.white,
            ),
            width: 35,
            height: 35,
            child: IconButton(
              icon: const Icon(
                Iconsax.notification,
                size: 19,
              ),
              alignment: Alignment.center,
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }

// ignore: unused_element
  Widget _card() {
    return Container(
      width: Get.width / 1.1,
      height: 235,
      decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xff262626), Color(0xff303030)],
            stops: [0, 1],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(0, 197, 197, 197).withOpacity(1),
              offset: const Offset(0, 4),
              blurRadius: 10,
              spreadRadius: 2,
            )
          ]),
      child: Padding(
        padding: const EdgeInsets.only(top: 30, right: 30, left: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "POINT คงเหลือ",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontFamily: "Prompt"),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "250,230 P",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Tooltip(
                  message: "Fantom chain ERC20",
                  child: Image.asset(
                    "assets/icons/fantom.png",
                    scale: 30,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              height: 4,
              color: Color.fromARGB(255, 51, 51, 51),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Constants.black,
                        ),
                        width: 45,
                        height: 45,
                        child: IconButton(
                          icon: const Icon(
                            EvaIcons.arrowUpward,
                            size: 24,
                            color: Colors.white,
                          ),
                          alignment: Alignment.center,
                          onPressed: () {},
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        "โอน",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontFamily: "Prompt"),
                      )
                    ],
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Constants.black,
                        ),
                        width: 45,
                        height: 45,
                        child: IconButton(
                          icon: const Icon(
                            EvaIcons.arrowDownward,
                            size: 24,
                            color: Colors.white,
                          ),
                          alignment: Alignment.center,
                          onPressed: () {},
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        "รับ",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontFamily: "Prompt"),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _ftm() {
    return Padding(
      padding: const EdgeInsets.only(top: 20, right: 30, left: 30),
      child: SizedBox(
        width: Get.width / 1.1,
        height: 40,
        child: const Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Tooltip(
                  message:
                      "เหรียญ FTM ใช้สำหรับชำระค่า Transaction fee และ Gas",
                  child: Text(
                    "FTM คงเหลือ",
                    style: TextStyle(
                        fontFamily: "Prompt",
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                Text(
                  "23.238 FTM",
                  style: TextStyle(
                      fontFamily: "Prompt",
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.w700),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _menu() {
    final WalletController _controller = Get.put(WalletController());
    return Container(
      width: Get.width / 1.1,
      height: 230,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(0, 231, 231, 231).withOpacity(1),
              offset: const Offset(0, 2),
              blurRadius: 6,
              spreadRadius: 1,
            )
          ]),
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 4),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "ประวัติการทำรายการ",
                  style: TextStyle(
                      fontFamily: "Prompt",
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                ),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      "ดูทั้งหมด",
                      style: TextStyle(
                        fontFamily: "Prompt",
                        color: Colors.blue.shade600,
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    )),
              ],
            ),
            Column(
              children: List.generate(_controller.type.length, (index) {
                return Column(
                  children: [
                    _transaction(
                        _controller.type[index], _controller.balance[index]),
                    if (index != _controller.type.length - 1)
                      const Padding(
                        padding: EdgeInsets.only(top: 10, bottom: 10),
                        child: Divider(
                          height: 3,
                          color: Color.fromARGB(255, 241, 241, 241),
                        ),
                      ),
                  ],
                );
              }),
            )
          ],
        ),
      ),
    );
  }

  Widget _transaction(String type, String balance) {
    String formatPriceWithCommas(String price) {
      return NumberFormat('#,##0.00').format(double.parse(price));
    }

    return Row(children: [
      Container(
        width: 25,
        height: 25,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Constants.grey,
        ),
        child: Icon(
          type == "witdraw" ? EvaIcons.arrowUpward : EvaIcons.arrowDownward,
          color: Colors.white,
        ),
      ),
      const SizedBox(
        width: 10,
      ),
      const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Transfer",
            style: TextStyle(fontFamily: "Prompt", fontSize: 13),
          ),
          Text("From 0x46f30...Ee78d65",
              style: TextStyle(
                  fontFamily: "Prompt", fontSize: 12, color: Constants.grey)),
        ],
      ),
      const Spacer(),
      Text(
          "${type == "witdraw" ? "-" : "+"} ${formatPriceWithCommas("1000")} P",
          style: const TextStyle(
            fontFamily: "Prompt",
            fontSize: 13,
          ))
    ]);
  }

  Widget _buyFTM() {
    String formatPriceWithCommas(String price) {
      return NumberFormat('#,##0.00').format(double.parse(price));
    }

    final WalletController _controller = Get.put(WalletController());
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Container(
        width: Get.width,
        height: Get.height / 1.5,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            boxShadow: [
              BoxShadow(
                color: const Color.fromARGB(0, 231, 231, 231).withOpacity(1),
                offset: const Offset(0, 2),
                blurRadius: 6,
                spreadRadius: 1,
              )
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 32),
              child: Text(
                "ซื้อ Fantom",
                style: TextStyle(
                    fontSize: 18,
                    fontFamily: "Prompt",
                    fontWeight: FontWeight.w600),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/icons/fantom.png",
                    scale: 50,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Obx(() => Tooltip(
                        message: "ราคาจะปรับเปลี่ยนตามราคาตลาดทุก ๆ 10 วินาที",
                        child: Text(
                          "1 FTM = ${formatPriceWithCommas(_controller.ftmtempPrice!.value.toStringAsFixed(2))} บาท",
                          style: const TextStyle(
                              fontFamily: "Prompt", fontSize: 16),
                        ),
                      ))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 10),
              child: Center(
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color.fromARGB(255, 241, 241, 241),
                    ),
                    width: Get.width / 1.3,
                    height: 70,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          const Text(
                            "จำนวน",
                            style:
                                TextStyle(fontFamily: "Prompt", fontSize: 16),
                          ),
                          Flexible(
                              child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: TextFormField(
                              scrollPadding: const EdgeInsets.only(bottom: 300),
                              controller: _controller.toBaht,
                              onChanged: (value) {
                                // ignore: unrelated_type_equality_checks
                                if (value != "") {
                                  _controller.toAmount.text =
                                      (int.parse(value) /
                                              _controller.ftmtempPrice!.value)
                                          .toStringAsFixed(2)
                                          .toString();
                                } else {
                                  _controller.toAmount.text = "";
                                }
                              },
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              textAlign: TextAlign.end,
                              style: const TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.w600),
                              decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "0",
                                  hintStyle: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w600)),
                            ),
                          )),
                          const Text("บาท",
                              style: TextStyle(
                                  fontFamily: "Prompt",
                                  fontWeight: FontWeight.w600))
                        ],
                      ),
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Center(
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color.fromARGB(255, 241, 241, 241),
                    ),
                    width: Get.width / 1.3,
                    height: 80,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          const Text(
                            "จำนวน",
                            style:
                                TextStyle(fontFamily: "Prompt", fontSize: 16),
                          ),
                          Flexible(
                              child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: TextFormField(
                              controller: _controller.toAmount,
                              scrollPadding: const EdgeInsets.only(bottom: 200),
                              onChanged: (value) {
                                if (value != "") {
                                  _controller.amount.value = int.parse(value);
                                  _controller.toBaht.text =
                                      (_controller.amount.value *
                                              _controller.ftmtempPrice!.value)
                                          .toStringAsFixed(2)
                                          .toString();
                                } else {
                                  _controller.amount.value = 0;
                                  _controller.toBaht.text = "";
                                }
                              },
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              textAlign: TextAlign.end,
                              style: const TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.w600),
                              decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "0",
                                  hintStyle: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w600)),
                            ),
                          )),
                          const Text("FTM",
                              style: TextStyle(
                                  fontFamily: "Prompt",
                                  fontWeight: FontWeight.w600))
                        ],
                      ),
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Center(
                child: TextButton(
                    onPressed: () {},
                    child: Container(
                      width: Get.width / 1.3,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Constants.orange),
                      child: const Center(
                          child: Text(
                        "ชำระเงิน",
                        style: TextStyle(
                            fontFamily: "Prompt",
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      )),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
