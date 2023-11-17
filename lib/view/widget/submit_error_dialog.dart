import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:growpuang/mainPage.dart';

import '../../controller/language_controller.dart';
import '../../controller/personal_contoller.dart';
import '../ending/graduated_puang.dart';

class SubmitErrorDioalog extends StatelessWidget {
  SubmitErrorDioalog({super.key});

  final languageController = Get.put(LanguageController());

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(2.0))),
      alignment: Alignment.center,
      // insetPadding: EdgeInsets.fromLTRB(30.w, 100.h, 30.w, 200.h),
      child: Container(
        height: 150.h,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              languageController.submitError,
              style: TextStyle(fontSize: 25.sp, color: Color(0xFF143264)),
            ),
          ],
        ),
      ),
    );
  }
}
