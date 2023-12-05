import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:growpuang/view/widget/mbti/MbtiDiamond.dart';
import '../widget/mbti/CommonAppBar.dart';
import '../widget/mbti/FirstAppBar.dart';
import 'seventhPage.dart';
import 'eigthPage.dart';
import 'package:get/get.dart';
import 'package:growpuang/controller/language_controller.dart';

class SixthPage extends StatelessWidget {
  final languageController = Get.put(LanguageController());

  final String question;
  final String option1;
  final String option2;

  SixthPage(
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
          Positioned(
            left: 50.w,
            right: 50.w,
            top: 570.h,
            child: GestureDetector(
              onTap: () {
                // Option 1 버튼을 눌렀을 때 수행할 작업을 정의하세요.
                // 여기에서 다음 질문 또는 동작을 정의할 수 있습니다.
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SeventhPage(
                      question: languageController.language == '한국어'
                          ? '더 멋지다고 생각되는 모습은?'
                          : 'Which look do you think\nis cooler?',
                      option1: languageController.language == '한국어'
                          ? '갑작스러운 사고를\n완벽하게 수습하는 나'
                          : 'I perfectly handle\nsudden accidents',
                      option2: languageController.language == '한국어'
                          ? '주어진 일을 완벽하게\n마무리 하는 나'
                          : 'I complete the given\ntask perfectly',
                    ),
                  ),
                );
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
                      option1,
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
          ),
          // 버튼 2 - Option 2
          Positioned(
            left: 50.w,
            right: 50.w,
            top: 740.h,
            child: GestureDetector(
              onTap: () {
                // Option 2 버튼을 눌렀을 때 수행할 작업을 정의하세요.

                // 여기에서 다음 질문 또는 동작을 정의할 수 있습니다.
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EighthPage(
                      question: languageController.language == '한국어'
                          ? '더 멋지다고 생각되는 모습은?'
                          : 'Which look do you think\nis cooler?',
                      option1: languageController.language == '한국어'
                          ? '갑작스러운 사고를 완벽하게\n 수습하는 나'
                          : 'I perfectly handle\nsudden accidents',
                      option2: languageController.language == '한국어'
                          ? '주어진 일을 완벽하게\n마무리 하는 나'
                          : 'I complete the given\ntask perfectly',
                    ),
                  ),
                );
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
                      option2,
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
          ),
        ],
      ),
    );
  }
}
