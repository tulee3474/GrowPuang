import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:growpuang/view/widget/appBar.dart';
import 'package:growpuang/view/widget/mbti_diamond.dart';

import '../../controller/language_controller.dart';
import 'thirdPage.dart';

class SecondPage extends StatelessWidget {
  final languageController = Get.put(LanguageController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Stack(
        children: [
          appBar(),
          mbti_diamond(),
          Center(
            child: Padding(
              padding: EdgeInsets.only(top: 400.h),
              child: Text(
                languageController.language == '한국어'
                    ? '어떤 언어로 진행하겠습니까?'
                    : 'Which language would you like to proceed in?',
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
            left: 0.0,
            right: 0.0,
            top: 700.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    languageController.language = '한국어';
                    print('한국어 선택');
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ThirdPage(),
                      ),
                    );
                  },
                  child: Container(
                    width: 200.w,
                    height: 90.h,
                    decoration: BoxDecoration(
                      color: Color(0xFF143264),
                      borderRadius: BorderRadius.circular(15.w),
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
                        padding: const EdgeInsets.all(0.0),
                        child: Text(
                          '한국어',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 50.sp,
                            fontFamily: 'YourFontFamily',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 40.w),
                GestureDetector(
                  onTap: () {
                    languageController.language = '영어';
                    print('영어 선택');
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ThirdPage(),
                      ),
                    );
                  },
                  child: Container(
                    width: 200.w,
                    height: 90.h,
                    decoration: BoxDecoration(
                      color: Color(0xFF143264),
                      borderRadius: BorderRadius.circular(15.w),
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
                        padding: const EdgeInsets.all(0.0),
                        child: Text(
                          'English',
                          style: TextStyle(
                            color: Colors.white,
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
        ],
      ),
    );
  }
}
