import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:growpuang/mainPage.dart';

import '../../controller/language_controller.dart';
import '../../controller/personal_contoller.dart';
import '../ending/graduated_puang.dart';

class QuizDialog extends StatelessWidget {
  int addScore;

  QuizDialog({super.key, required this.addScore});

  final personalController = Get.put(PersonalController());
  final languageController = Get.put(LanguageController());

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(2.0))),
      alignment: Alignment.center,
      // insetPadding: EdgeInsets.fromLTRB(30.w, 100.h, 30.w, 200.h),
      content: Container(
        width: 400.w,
        height: 150.h,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                (addScore > 0)
                    ? languageController.correct
                    : languageController.incorrect,
                style: TextStyle(fontSize: 20.sp, color: Color(0xFF143264)),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                "+${addScore}",
                style: TextStyle(
                  fontSize: 20.sp,
                  color: Color(0xFF143264),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                "${languageController.nowScore} ${personalController.intellectScore}",
                style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF143264)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
