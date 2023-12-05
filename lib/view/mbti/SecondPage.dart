import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../controller/language_controller.dart';
import '../widget/mbti/MbtiBackground.dart';
import 'ThirdPage.dart';

class SecondPage extends StatelessWidget {
  final languageController = Get.put(LanguageController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Stack(
        children: [
          const MbtiBackground(),
          _buildTextSection(),
          _buildLanguageSelectionRow(context),
        ],
      ),
    );
  }

  Widget _buildTextSection() {
    return Center(
      child: Padding(

        padding: EdgeInsets.only(top: 400.h),
        child: Text(
          languageController.language == '한국어'
              ? '어떤 언어로 진행하겠습니까?'
              : 'Which language would you like to proceed in?',
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

  Widget _buildLanguageSelectionRow(BuildContext context) {
    return Positioned(
      left: 0.0,
      right: 0.0,
      top: 700.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildLanguageOption('한국어', () {
            _setLanguageAndNavigate(context, '한국어');
          }),
          SizedBox(width: 40.w),
          _buildLanguageOption('English', () {
            _setLanguageAndNavigate(context, '영어');
          }),
        ],
      ),
    );
  }

  Widget _buildLanguageOption(String language, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 200.w,
        height: 90.h,
        decoration: BoxDecoration(
          color: const Color(0xFF143264),
          borderRadius: BorderRadius.circular(15.w),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(0.0),
            child: Text(
              language,
              style: TextStyle(
                color: Colors.white,
                fontSize: 30.sp,
                fontFamily: 'YourFontFamily',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
  void _setLanguageAndNavigate(BuildContext context, String language) {
    languageController.language = language;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ThirdPage(),
      ),
    );
  }
}
