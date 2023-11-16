import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:growpuang/controller/language_controller.dart';
import 'package:growpuang/controller/personal_contoller.dart';
import 'package:growpuang/mainPage.dart';
import 'package:get/get.dart';
import 'package:growpuang/controller/language_controller.dart';
import 'package:growpuang/view/widget/appBar.dart';

class lastPage extends StatelessWidget {
  final languageController = Get.put(LanguageController());
  final personalController = Get.put(PersonalController());
  final String question;
  final String option1;
  final String option2;
  final String pick_img;

  lastPage(
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
          appBar(),
          // 자산 이미지 크기 및 배치 수정
          Positioned(
            left: 0.w,
            right: 0.w,
            top: 250.h, // 원하는 위치로 조정
            child: Center(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
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
                  SizedBox(height: 40.h), // 원하는 여백 크기로 조정
                  Container(
                    width: 300.w, // 이미지 너비 조정
                    height: 280.h,// 이미지 높이 조정
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/$pick_img'),
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),

                  SizedBox(height: 40.h),
                  Text(
                    option1 +
                        ' ' +
                        option2 +
                        (languageController.language == '한국어' ? '입니다' : ''),
                    style: TextStyle(
                      color: Color(0xFF143264),
                      fontSize: 40.sp,
                      fontFamily: 'YourFontFamily',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  GestureDetector(
                    onTap: () {
                      //여기서 controller에 할당하게 수정
                      personalController.option1 = option1;
                      personalController.option2 = option2;
                      personalController.pick_img = pick_img;
                      languageController.language = languageController.language;

                      // 현재 화면을 스택에서 제거
                      Navigator.of(context).pop();

                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: (context) => MainPage(),
                          //NewScreen()은 새로운 시작화면입니다. 여기에 원하는 화면 위젯을 넣으세요.
                        ),
                        (Route<dynamic> route) => false,
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
                              fontSize: 50.sp,
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
