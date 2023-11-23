import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../controller/language_controller.dart';

class EndDialog extends StatelessWidget {
  EndDialog({super.key});

  final languageController = Get.put(LanguageController());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Your custom logic to prevent going back
        // Return true to allow going back, return false to prevent going back
        return true;
      },
      child: AlertDialog(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(2.0))),
        alignment: Alignment.center,
        // insetPadding: EdgeInsets.fromLTRB(30.w, 100.h, 30.w, 200.h),
        insetPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 300.h),
        content: Text(languageController.endMsg),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(false); // 취소
            },
            child: Text(languageController.answerNo),
          ),
          TextButton(
            onPressed: () {
              SystemNavigator.pop();// 종료
            },
            child: Text(languageController.answerYes),
          ),
        ],
      ),
    );
  }
}
