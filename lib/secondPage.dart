import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:growpuang/homeScreen.dart';


class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/기본-배경.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Positioned(
            left: 0.w,
            right: 0.w,
            top: 100.h,
            child: Center(
              child: Container(
                width: 318.w,
                height: 350.h,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/자산.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              print('영신관 이미지를 눌렀습니다.');
            },
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: 350.w,
                height: 150.h,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/영신관.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.only(top: 150.h),
              child: Text(
                selectedLanguage == '한국어' ? '어떤 언어로 진행하겠습니까?' : 'Which language would you like to proceed in?',
                style: TextStyle(
                  color: Color(0xFF143264),
                  fontSize: 25.sp,
                  fontFamily: 'YourFontFamily',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Positioned(
            left: 0.0,
            right: 0.0,
            top: 470.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    selectedLanguage = '한국어';
                    print('한국어 선택');
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ThirdPage(),
                      ),
                    );
                  },
                  child: Container(
                    width: 150.w,
                    height: 70.h,
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
                            fontSize: 35.sp,
                            fontFamily: 'YourFontFamily',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 20.w),
                GestureDetector(
                  onTap: () {
                    selectedLanguage = '영어';
                    print('영어 선택');
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ThirdPage(),
                      ),
                    );
                  },
                  child: Container(
                    width: 150.w,
                    height: 70.h,
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
                            fontSize: 35.sp,
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