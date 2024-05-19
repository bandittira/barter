import 'package:flutter/material.dart';

class CameraOverlay extends StatelessWidget {
  const CameraOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.center,
          child: Container(
            width: 300,
            height: 200,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 2),
            ),
            child: const Stack(
              children: [
                Positioned(
                  top: 10,
                  left: 10,
                  child: Icon(Icons.filter_frames, size: 40, color: Colors.white),
                ),
                Positioned(
                  bottom: 10,
                  right: 10,
                  child: Icon(Icons.person, size: 40, color: Colors.white),
                ),
              ],
            ),
          ),
        ),
        const Positioned(
          bottom: 20,
          left: 20,
          right: 20,
          child: Text(
            'Photo the ID card in the specified frame\nPlease check the image is clear (no glare, no blur and all information is visible)',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
