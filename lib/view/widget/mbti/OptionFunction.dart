import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:growpuang/controller/language_controller.dart';

final languageController = Get.put(LanguageController());


void navigateToPage(BuildContext context, Widget page) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => page));
}

String getQuestionText(String koreanText, String englishText) {
  return languageController.language == '한국어' ? koreanText : englishText;
}

String getOptionText(String koreanText, String englishText) {
  return languageController.language == '한국어' ? koreanText : englishText;
}

String getButtonText(String koreanText, String englishText) {
  return languageController.language == '한국어' ? koreanText : englishText;
}

Widget buildTitle(String text) {
  return Center(
    child: Padding(
      padding: EdgeInsets.only(top: 130.h),
      child: Text(
        text,
        style: TextStyle(
          color: const Color(0xFF143264),
          fontSize: 30.sp,
          fontFamily: 'YourFontFamily',
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
    ),
  );
}