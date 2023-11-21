import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:growpuang/controller/language_controller.dart';
import 'package:growpuang/view/widget/appBar.dart';
import 'package:growpuang/view/widget/mbti_diamond.dart';
import '../widget/first_appBar.dart';
import 'lastPage.dart';

class FifthPage extends StatelessWidget {
  final languageController = Get.put(LanguageController());

  final String question;
  final String option1;
  final String option2;

  FifthPage(
      {Key? key,
      required this.question,
      required this.option1,
      required this.option2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Stack(
        children: [
          firstappBar(),
          mbti_diamond.goUp(),
          // 질문 텍스트
          Center(
            child: Padding(
              padding: EdgeInsets.only(top: 130.h),
              child: Text(
                question,
                style: TextStyle(
                  color: Color(0xFF143264),
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
                print('Option 1을 선택했습니다.');
                // 여기에서 다음 질문 또는 동작을 정의할 수 있습니다.
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => lastPage(
                      question: languageController.language == '한국어'
                          ? '당신이 졸업시킬 푸앙이는'
                          : 'The Puang you will graduate from is',
                      option1: languageController.language == '한국어'
                          ? '모범적인'
                          : 'exemplary',
                      option2: languageController.language == '한국어'
                          ? '푸앙이'
                          : 'puang',
                      pick_img: '모범-푸앙.png',
                    ),
                  ),
                );
              },
              child: Container(
                width: double.infinity,
                height: 130.h,
                decoration: BoxDecoration(
                  color: Color(0xFF143264),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
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
                print('Option 2를 선택했습니다.');
                // 여기에서 다음 질문 또는 동작을 정의할 수 있습니다.
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => lastPage(
                      question: languageController.language == '한국어'
                          ? '당신이 졸업시킬 푸앙이는'
                          : 'The Puang you will graduate from is',
                      option1:
                          languageController.language == '한국어' ? '너드한' : 'nerd',
                      option2: languageController.language == '한국어'
                          ? '푸앙이'
                          : 'puang',
                      pick_img: '너드한-푸앙.png',
                    ),
                  ),
                );
              },
              child: Container(
                width: double.infinity,
                height: 130.h,
                decoration: BoxDecoration(
                  color: Color(0xFF143264),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
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
