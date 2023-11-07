import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:growpuang/view/widget/appBar.dart';
import 'package:growpuang/view/widget/mbti_diamond.dart';
import 'fourthPage.dart';
import 'sixthPage.dart';
import 'package:get/get.dart';
import 'package:growpuang/controller/language_controller.dart';

class ThirdPage extends StatelessWidget {
  final languageController = Get.put(LanguageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Stack(
        children: [
          appBar(),
          mbti_diamond.goUp(),
          Center(
            child: Padding(
              padding: EdgeInsets.only(top: 130.h),
              child: Text(
                languageController.language == '한국어'
                    ? '나는 어떤일을 할 때?'
                    : 'When I do something?',
                style: TextStyle(
                  color: Color(0xFF143264),
                  fontSize: 40.sp,
                  fontFamily: 'YourFontFamily',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Positioned(
            left: 50.w,
            right: 50.w,
            top: 570.h,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FourthPage(
                      question: languageController.language == '한국어'
                          ? '내가 실패했을 때 두려운 것은?'
                          : 'What do I fear when I fail?',
                      option1: languageController.language == '한국어'
                          ? '다른 사람의 평판'
                          : 'someone else\'s reputation',
                      option2:
                      languageController.language == '한국어' ? '좌절감' : 'frustration',
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
                      languageController.language == '한국어'
                          ? '이 일을 하지 않았을 때 잃게 될 것들을 떠올린다'
                          : 'Think about what you will lose if you don\'t do this.',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40.sp,
                        fontFamily: 'YourFontFamily',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 50.w,
            right: 50.w,
            top: 740.h,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SixthPage(
                      question: languageController.language == '한국어'
                          ? '내가 실패했을 때 두려운 것은?'
                          : 'What do I fear when I fail?',
                      option2: languageController.language == '한국어'
                          ? '다른 사람의 평판'
                          : 'someone else\'s reputation',
                      option1:
                      languageController.language == '한국어' ? '좌절감' : 'frustration',
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
                      languageController.language == '한국어'
                          ? '이 일을 해냈을 때 얻게 될 보상을 떠올린다'
                          : 'Think about the reward you will receive when you accomplish this task.',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40.sp,
                        fontFamily: 'YourFontFamily',
                        fontWeight: FontWeight.bold,
                      ),
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
