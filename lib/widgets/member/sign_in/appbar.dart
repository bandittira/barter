import "package:barter/constant/color.dart";
import "package:flutter/material.dart";

class MyAppbar extends StatelessWidget implements PreferredSizeWidget {
  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(100);
  const MyAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
    title: const Padding(
      padding: EdgeInsets.only(top: 10),
      child: Center(
          child: Text(
        "เข้าสู่ระบบ",
        style: TextStyle(fontFamily: "Prompt"),
      )),
    ),
    leading: IconButton(
      onPressed: () {
        // Navigator.of(context).pushAndRemoveUntil(
        //   CupertinoPageRoute(
        //     builder: (BuildContext context) {
        //       return const HomePage();
        //     },
        //   ),
        //   (_) => false,
        // );
      },
      icon: const Padding(
        padding: EdgeInsets.only(top: 10),
        child: Icon(
          Icons.arrow_back_rounded,
          color: Constants.orange,
        ),
      ),
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.only(top: 10),
        child: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.question_mark_outlined,
            color: Constants.orange,
          ),
        ),
      ),
    ],
  );
  }
}