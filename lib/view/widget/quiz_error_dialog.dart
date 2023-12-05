import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../controller/language_controller.dart';

class QuizErrorDialog extends StatelessWidget {
  QuizErrorDialog({super.key});

  final languageController = Get.put(LanguageController());

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(2.0))),
      alignment: Alignment.center,
      // insetPadding: EdgeInsets.fromLTRB(30.w, 100.h, 30.w, 200.h),
      content: SizedBox(
        width: 400.w,
        height: 70.h,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.warning_amber_rounded,
                color: Colors.red,
              ),
              SizedBox(
                width: 5.w,
              ),
              Text(
                languageController.answerInfo,
                style: TextStyle(fontSize: 20.sp, color: const Color(0xFF143264)),
              ),
              const Icon(
                Icons.warning_amber_rounded,
                color: Colors.red,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
