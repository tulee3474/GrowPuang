import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:growpuang/knowledge/KnowledgeMainPage.dart';

import '../view/home_screen.dart';

String selectedLanguage = '한국어';

class firstQuizPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
                    image: AssetImage('assets/images/영신관.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 30.w,
            top: 211.h,
            child: Container(
              width: 311.w,
              height: 237.h,
              decoration: BoxDecoration(color: Color(0xFF9ACA58)),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 311.w,
                    height: 237.h,
                    decoration: ShapeDecoration(
                      color: Color(0xFFC9EB9B),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3)),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 53.w,
            top: 370.h,
            child: Container(
              width: 125.w,
              height: 30.h,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 125.w,
                    height: 30.h,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3)),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 197.w,
            top: 370.h,
            child: Container(
              width: 125.w,
              height: 30.h,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 125.w,
                    height: 30.h,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3)),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 32,
            top: 211,
            child: Container(
              width: 311,
              height: 237,
              decoration: BoxDecoration(color: Color(0xFF9ACA58)),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 311,
                    height: 237,
                    decoration: ShapeDecoration(
                      color: Color(0xFFC9EB9B),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3)),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 120,
            top: 296,
            child: Container(
              width: 133,
              height: 18,
              child: Stack(
                children: [
                  Positioned(
                    left: -67,
                    top: -6,
                    child: Container(
                      width: 266,
                      height: 30,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 266,
                            height: 30,
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(3)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    top: 0,
                    child: SizedBox(
                      width: 133,
                      child: Text(
                        '선형탐색 알고리즘',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF143264),
                          fontSize: 13,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w900,
                          height: 0.11,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 53,
            top: 330,
            child: Container(
              width: 266,
              height: 30,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    top: 0,
                    child: Container(
                      width: 266,
                      height: 30,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 266,
                            height: 30,
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(3)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 17,
                    top: 6,
                    child: SizedBox(
                      width: 233,
                      child: Text(
                        '이진탐색 알고리즘',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF143264),
                          fontSize: 13,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w900,
                          height: 0.11,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 53,
            top: 370,
            child: Container(
              width: 266,
              height: 30,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    top: 0,
                    child: Container(
                      width: 266,
                      height: 30,
                      decoration: ShapeDecoration(
                        color: Color(0xFF143264),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(3)),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    top: 6,
                    child: SizedBox(
                      width: 266,
                      child: Text(
                        '해시탐색 알고리즘',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w900,
                          height: 0.11,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 61,
            top: 479,
            child: Container(
              width: 258,
              height: 19,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    top: 1,
                    child: Text(
                      '지식지수',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF143264),
                        fontSize: 13,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w900,
                        height: 0.11,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 222,
                    top: 1,
                    child: Text(
                      '15/30',
                      style: TextStyle(
                        color: Color(0xFF143264),
                        fontSize: 13,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                        height: 0.11,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 59,
                    top: 0,
                    child: Container(
                      width: 155,
                      height: 19,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 0,
                            top: 0,
                            child: Container(
                              width: 155,
                              height: 19,
                              decoration: ShapeDecoration(
                                color: Color(0x7F6BBEE2),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(13),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 6,
                            top: 3,
                            child: Container(
                              width: 77,
                              height: 12,
                              decoration: ShapeDecoration(
                                color: Color(0xFF143264),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(13),
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
            ),
          ),
          Positioned(
            left: 53.w,
            top: 225.h,
            child: SizedBox(
              width: 266.w,
              height: 65.h,
              child: Text(
                '다음 중 맨 앞이나 맨 뒤부터 순서대로\n하나하나 짚어보는 알고리즘은?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF143264),
                  fontSize: 14,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w900,
                  height: 0.10,
                ),
              ),
            ),
          ),
          Positioned(
            left: 260.w,
            top: 417.h,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(),
                  ),
                );
              },
              child: Align(
                alignment: Alignment.topCenter,
                child: Container(
                  width: 60.w,
                  decoration: const BoxDecoration(
                    color: Colors.transparent,
                    border: null,
                  ),
                  child: Text(
                    '제출하기 >',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Color(0xFF143264),
                      fontSize: 13,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                      height: 0.11,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 51.w,
            top: 417.h,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => KnowledgeMainPage(),
                  ),
                );
              },
              child: Align(
                alignment: Alignment.topCenter,
                child: Container(
                  width: 60.w,
                  decoration: const BoxDecoration(
                    color: Colors.transparent,
                    border: null,
                  ),
                  child: Text(
                    '< 수강취소',
                    style: TextStyle(
                      color: Color(0xFF143264),
                      fontSize: 13,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                      height: 0.11,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 20.w,
            right: 20.w,
            bottom: 20.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // 이미지 버튼 1
                InkWell(
                  onTap: () {
                    // 이미지 버튼 1을 탭했을 때 수행할 작업을 정의
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => KnowledgeMainPage(),
                      ),
                    );
                  },
                  child: Container(
                    width: 80.w,
                    height: 80.h,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/지식지수.png'),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                // 이미지 버튼 2 (기존 UI 유지)
                InkWell(
                  onTap: () {
                    // 이미지 버튼 2를 탭했을 때 수행할 작업을 정의
                  },
                  child: Container(
                    width: 80.w,
                    height: 80.h,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/활동지수.png'),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                // 이미지 버튼 3 (기존 UI 유지)
                InkWell(
                  onTap: () {
                    // 이미지 버튼 3을 탭했을 때 수행할 작업을 정의
                  },
                  child: Container(
                    width: 80.w,
                    height: 80.h,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/사교지수.png'),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                // 이미지 버튼 4 (기존 UI 유지)
                InkWell(
                  onTap: () {
                    // 이미지 버튼 4를 탭했을 때 수행할 작업을 정의
                  },
                  child: Container(
                    width: 80.w, //이미지는 나중에 크기 수정하면 됨
                    height: 80.h,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/도움말.png'),
                        fit: BoxFit.contain,
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
