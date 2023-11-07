import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'lastPage.dart';
import 'package:get/get.dart';
import 'package:growpuang/controller/language_controller.dart';

class SeventhPage extends StatelessWidget {
  final languageController = Get.put(LanguageController());

  final String question;
  final String option1;
  final String option2;

  SeventhPage(
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
          // 반응형 배경 이미지 설정
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/기본-배경.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          // 영신관 이미지 (상단 중앙에 배치)
          Align(
            alignment: Alignment.topCenter,
            child: GestureDetector(
              onTap: () {
                // 영신관 이미지를 누를 때 수행할 작업을 정의하세요.
                print('영신관 이미지를 눌렀습니다.');
                // 여기에서 다음 질문 또는 동작을 정의할 수 있습니다.
              },
              child: Container(
                width: 550.w,
                height: 200.h,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/영신관.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ),
          // 자산 이미지 크기 및 배치 수정
          Positioned(
            left: 0.w,
            right: 0.w,
            top: 150.h,// // 더 위로 조정
            child: Center(
              child: Container(
                width: 410.w,
                height: 390.h, // 이미지 높이 조정
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/자산.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ),
          // 질문 텍스트
          Center(
            child: Padding(
              padding: EdgeInsets.only(top: 130.h),
              child: Text(
                question,
                style: TextStyle(
                  color: Color(0xFF143264),
                  fontSize: 40.sp,
                  fontFamily: 'YourFontFamily',
                  fontWeight: FontWeight.bold,
                ),
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
                      option1: languageController.language == '한국어' ? '활발한' : 'active',
                      option2: languageController.language == '한국어' ? '푸앙이' : 'puang',
                      pick_img: '활발한-푸앙.png',
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
                      option1: languageController.language == '한국어' ? '주도적인' : 'leading',
                      option2: languageController.language == '한국어' ? '푸앙이' : 'puang',
                      pick_img: '주도적인-푸앙.png',
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
