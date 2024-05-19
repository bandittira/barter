import 'dart:io';
import 'package:barter/constant/color.dart';
import 'package:barter/widgets/form/appbar/form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class MultipleImagePicker extends StatefulWidget {
  const MultipleImagePicker({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MultipleImagePickerState createState() => _MultipleImagePickerState();
}

class _MultipleImagePickerState extends State<MultipleImagePicker> {
  final List<File> _images = [];

  Future<void> _pickImages() async {
    final pickedImages = await ImagePicker().pickMultiImage();
    // ignore: unnecessary_null_comparison
    if (pickedImages != null) {
      setState(() {
        _images.addAll(pickedImages.map((e) => File(e.path)));
      });
    }
  }

  void _removeImage(File image) {
    setState(() {
      _images.remove(image);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppbarForm(),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Center(
              child: Text(
                "รูปภาพร้านค้า",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  fontFamily: "Prompt",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Center(
                child: ElevatedButton(
                  onPressed: _pickImages,
                  child: const Text(
                    'เลือกรูปภาพ',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Center(
                child: Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: _images.map((image) {
                    return Stack(
                      children: [
                        Image.file(
                          image,
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                        Positioned(
                          right: 0,
                          top: 0,
                          child: GestureDetector(
                            onTap: () => _removeImage(image),
                            child: Container(
                              decoration: const BoxDecoration(
                                color: Colors.red,
                                shape: BoxShape.circle,
                              ),
                              padding: const EdgeInsets.all(4),
                              child: const Icon(
                                Icons.close,
                                color: Colors.white,
                                size: 16,
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  }).toList(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Container(
                padding: const EdgeInsets.only(left: 30, right: 20),
                child: const Text(
                  "โปรดเลือกรูปภาพร้านค้า 5 รูปขึ้นไป",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 50),
                child: TextButton(
                    onPressed: () {
                      if (_images == []) {
                        Get.snackbar("แจ้งเตือน", "ท่านยังไม่เลือกรูปภาพ");
                        // Get.to(PinputExample(
                        //   phoneNumber: phoneNumberController.text,
                        // ));
                      } else if (_images.length < 5) {
                        Get.snackbar(
                            "แจ้งเตือน", "โปรดเลือกรูปภาพ 5 รูปขึ้นไป");
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Constants.orange,
                      ),
                      width: Get.width / 1.15,
                      height: 40,
                      child: const Center(
                        child: Text(
                          "ถัดไป",
                          style: TextStyle(
                              fontFamily: "Prompt", color: Colors.white),
                        ),
                      ),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
