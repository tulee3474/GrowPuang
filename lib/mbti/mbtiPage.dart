import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:growpuang/controller/language_controller.dart';
import 'package:growpuang/controller/personal_contoller.dart';
import 'package:growpuang/mbti/FirstPage.dart';
import 'package:growpuang/mainPage.dart';

import '../view/home_screen.dart';

class MBTIPage extends StatelessWidget {
  final languageController = Get.put(LanguageController());
  final personalController = Get.put(PersonalController());
  final String question;
  final String option1;
  final String option2;
  final String pick_img;

  MBTIPage(
      {Key? key,
      required this.question,
      required this.pick_img,
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
                width: 350.w,
                height: 150.h,
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
            top: 200.h, // 원하는 위치로 조정
            child: Center(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      question,
                      style: TextStyle(
                        color: Color(0xFF143264),
                        fontSize: 25.sp,
                        fontFamily: 'YourFontFamily',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h), // 원하는 여백 크기로 조정
                  Container(
                    width: 170.w, // 이미지 너비 조정
                    height: 220.h, // 이미지 높이 조정
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/$pick_img'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),

                  SizedBox(height: 20.h),
                  Text(
                    option1 +
                        ' ' +
                        option2 +
                        (selectedLanguage == '한국어' ? '입니다' : ''),
                    style: TextStyle(
                      color: Color(0xFF143264),
                      fontSize: 25.sp,
                      fontFamily: 'YourFontFamily',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  GestureDetector(
                    onTap: () {
                      //여기서 controller에 할당하게 수정
                      personalController.option1 = option1;
                      personalController.option2 = option2;
                      personalController.pick_img = pick_img;
                      languageController.language = selectedLanguage;

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MainPage(
                              // option1: option1,
                              // option2: option2,
                              // pick_img: pick_img,
                              ),
                        ),
                      );
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
                              color: Color(0xFF143264),
                              fontSize: 30.sp,
                              fontFamily: 'YourFontFamily',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
