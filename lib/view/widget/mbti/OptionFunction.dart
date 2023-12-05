import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:growpuang/controller/language_controller.dart';

import '../../mbti/lastPage.dart';

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

void navigateToLastPage(BuildContext context, String optionText, String pickImage) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => lastPage(
        question: languageController.language == '한국어'
            ? '당신이 졸업시킬 푸앙이는'
            : 'The Puang you will graduate from is',
        option1: optionText,
        option2: languageController.language == '한국어' ? '푸앙이' : 'puang',
        pickImg: pickImage,
      ),
    ),
  );
}