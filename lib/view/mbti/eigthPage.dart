import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:growpuang/view/widget/mbti/MbtiDiamond.dart';
import '../widget/mbti/CommonAppBar.dart';
import '../widget/mbti/FirstAppBar.dart';
import 'lastPage.dart';
import 'package:get/get.dart';
import 'package:growpuang/controller/language_controller.dart';

class EighthPage extends StatelessWidget {
  final languageController = Get.put(LanguageController());

  final String question;
  final String option1;
  final String option2;

  EighthPage(
      {super.key,
      required this.question,
      required this.option1,
      required this.option2});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Stack(
        children: [
          const CommonAppBar(),
          // 질문 텍스트
          Center(
            child: Padding(
              padding: EdgeInsets.only(top: 130.h),
              child: Text(
                question,
                style: TextStyle(
                  color: const Color(0xFF143264),
                  fontSize: 30.sp,
                  fontFamily: 'YourFontFamily',
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          // 버튼 1 - Option 1
          _buildOptionButton(context, 570, option1,
              languageController.language == '한국어'
              ? '주도적인'
              : 'leading', '주도적인-푸앙.png'),
          // 버튼 2 - Option 2
          _buildOptionButton(context, 740, option2,
              languageController.language == '한국어'
                  ? '지휘적인'
                  : 'commanding', '지적인-푸앙.png'),
        ],
      ),
    );
  }

  void _navigateToLastPage(BuildContext context, String optionText, String pickImage) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => lastPage(
          question: languageController.language == '한국어'
              ? '당신이 졸업시킬 푸앙이는'
              : 'The Puang you will graduate from is',
          option1: optionText,
          option2: languageController.language == '한국어' ? '푸앙이' : 'puang',
          pick_img: pickImage,
        ),
      ),
    );
  }

  Widget _buildOptionButton(BuildContext context, double topPosition, String optionNumber, String optionText, String pickImage) {
    return Positioned(
      left: 50.w,
      right: 50.w,
      top: topPosition.h,
      child: GestureDetector(
        onTap: () {
          _navigateToLastPage(context, optionText, pickImage);
        },
        child: Container(
          width: double.infinity,
          height: 130.h,
          decoration: BoxDecoration(
            color: const Color(0xFF143264),
            borderRadius: BorderRadius.circular(15),
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
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                optionNumber,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.sp,
                  fontFamily: 'YourFontFamily',
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }

}
