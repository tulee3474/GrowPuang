import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:growpuang/mainPage.dart';

import '../../controller/language_controller.dart';
import '../../controller/personal_contoller.dart';
import '../ending/graduated_puang.dart';

class ActDialog extends StatelessWidget {
  // int activities;

  ActDialog({super.key,
    // required this.activities
  });

  final personalController = Get.put(PersonalController());
  final languageController = Get.put(LanguageController());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Dialog(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(2.0))),
        alignment: Alignment.center,
        // insetPadding: EdgeInsets.fromLTRB(30.w, 100.h, 30.w, 200.h),
        insetPadding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 300.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "활동에 참여하셨습니다\n 남은체력 ${personalController.hpScore}",
              style: TextStyle(fontSize: 25.sp, color: Color(0xFF143264)),
            ),
           SizedBox(
              height: 10.h,
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MainPage(),
                  ),);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.home),
                  Text(
                    languageController.goHome,
                    style: TextStyle(
                      fontSize: 25.sp,
                      color: Color(0xFF143264),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
