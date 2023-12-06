import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:growpuang/controller/language_controller.dart';
import 'package:growpuang/controller/personal_contoller.dart';
import 'package:growpuang/mainPage.dart';

import '../widget/mbti/FirstAppBar.dart';

class lastPage extends StatelessWidget {
  final languageController = Get.put(LanguageController());
  final personalController = Get.put(PersonalController());
  final String question;
  final String option1;
  final String option2;
  final String pickImg;

  lastPage(
      {super.key,
      required this.question,
      required this.pickImg,
      required this.option1,
      required this.option2});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Stack(
        children: [
          const FirstAppBar(),
          // 자산 이미지 크기 및 배치 수정
          Positioned(
            left: 0.w,
            right: 0.w,
            top: 250.h, // 원하는 위치로 조정
            child: Center(
              child: Column(
                children: [
                  _buildText(question, 30.sp, FontWeight.bold),
                  SizedBox(height: 20.h),
                  _buildImage('assets/images/$pickImg', 270.w, 230.h),
                  SizedBox(height: 20.h),
                  _buildText('$option1 $option2${_getLanguageSuffix()}',
                      30.sp, FontWeight.bold),
                  SizedBox(height: 20.h),
                  _buildNextButton(context),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }


  Widget _buildText(String text, double fontSize, FontWeight fontWeight) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Text(
        text,
        style: TextStyle(
          color: const Color(0xFF143264),
          fontSize: fontSize,
          fontFamily: 'YourFontFamily',
          fontWeight: fontWeight,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildImage(String imagePath, double width, double height) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }

  String _getLanguageSuffix() {
    return languageController.language == '한국어' ? '입니다' : '';
  }

  Widget _buildNextButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _updateControllersAndNavigate(context);
      },
      child: Align(
        alignment: Alignment.topCenter,
        child: Container(
          width: 200.w,
          decoration: const BoxDecoration(
            color: Colors.transparent,
            border: null,
          ),
          child: Center(
            child: Text(
              'Next >',
              style: TextStyle(
                color: const Color(0xFF143264),
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

  void _updateControllersAndNavigate(BuildContext context) {
    personalController.option1 = option1;
    personalController.option2 = option2;
    personalController.pick_img = pickImg;
    languageController.language = languageController.language;

    Navigator.of(context).pop();

    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (context) => MainPage(),
      ),
          (Route<dynamic> route) => false,
    );
  }

}
