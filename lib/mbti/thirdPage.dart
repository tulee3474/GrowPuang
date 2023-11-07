import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:growpuang/mbti/FirstPage.dart';
import 'fourthPage.dart';
import 'sixthPage.dart';

class ThirdPage extends StatelessWidget {
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
                image: AssetImage('assets/images/기본-배경.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: GestureDetector(
              onTap: () {
                print('영신관 이미지를 눌렀습니다.');
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
                    image: AssetImage('assets/images/자산.png'),
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
                selectedLanguage == '한국어'
                    ? '나는 어떤일을 할 때?'
                    : 'When I do something?',
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
            left: 50.w,
            right: 50.w,
            top: 460.h,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FourthPage(
                      question: selectedLanguage == '한국어'
                          ? '내가 실패했을 때 두려운 것은?'
                          : 'What do I fear when I fail?',
                      option1: selectedLanguage == '한국어'
                          ? '다른 사람의 평판'
                          : 'someone else\'s reputation',
                      option2:
                          selectedLanguage == '한국어' ? '좌절감' : 'frustration',
                    ),
                  ),
                );
              },
              child: Container(
                width: double.infinity,
                height: 80.h,
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
                      selectedLanguage == '한국어'
                          ? '이 일을 하지 않았을 때 잃게 될 것들을 떠올린다'
                          : 'Think about what you will lose if you don\'t do this.',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.sp,
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
            top: 560.h,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SixthPage(
                      question: selectedLanguage == '한국어'
                          ? '내가 실패했을 때 두려운 것은?'
                          : 'What do I fear when I fail?',
                      option2: selectedLanguage == '한국어'
                          ? '다른 사람의 평판'
                          : 'someone else\'s reputation',
                      option1:
                          selectedLanguage == '한국어' ? '좌절감' : 'frustration',
                    ),
                  ),
                );
              },
              child: Container(
                width: double.infinity,
                height: 80.h,
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
                      selectedLanguage == '한국어'
                          ? '이 일을 해냈을 때 얻게 될 보상을 떠올린다'
                          : 'Think about the reward you will receive when you accomplish this task.',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.sp,
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
