import 'package:barter/utilize/bottom_nav.dart';
import 'package:barter/utilize/introduction.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_line_sdk/flutter_line_sdk.dart';

Future<void> main() async {
  Get.testMode = true;
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(const MyApp()));
}

void lineSDKInit() async {
  await LineSDK.instance.setup("2005592993").then((_) {
    print("LineSDK is Prepared");
  });
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void initState() {
    lineSDKInit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Barter',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
          useMaterial3: true,
          tooltipTheme: const TooltipThemeData(preferBelow: false)),
      home: FutureBuilder<bool>(
        future: isFirstTimeOpen(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container(); // Placeholder widget while checking isFirstTimeOpen
          }
          if (snapshot.hasError || snapshot.data == null) {
            return Container(); // Handle error or null response
          }
          return snapshot.data! ? const OnBoardingPage() : const Tabview();
        },
      ),
    );
  }

  Future<bool> isFirstTimeOpen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isFirstTime = prefs.getBool('isFirstTime') ?? true;
    if (isFirstTime) {
      await prefs.setBool('isFirstTime', false);
    }
    return isFirstTime;
  }
}
