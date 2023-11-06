import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:growpuang/knowledge/firstQuizPage.dart';
import 'package:growpuang/mainPage.dart';

import '../view/home_screen.dart';

class KnowledgeMainPage extends StatelessWidget {

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
                  image: AssetImage('images/기본-배경.png'),
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
                      image: AssetImage('images/영신관.png'),
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
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
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
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
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
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 103.w,
              top: 239.h,
              child: SizedBox(
                width: 169.w,
                height: 33.h,
                child: Text(
                  '수강할 과목을 골라주세요',
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
              left: 197.w,
              top: 290.h,
              child: Container(
                width: 125.w,
                height: 30.h,
                child: Stack(
                  children: [
                    Positioned(
                      left: 0.w,
                      top: 0.h,
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
                                color: Color(0xFF143264),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      left: 38.w,
                      top: 6.h,
                      child: Text(
                        '알고리즘',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w900,
                          height: 0.11.h,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 197.w,
              top: 330.h,
              child: Container(
                width: 125.w,
                height: 30.h,
                child: Stack(
                  children: [
                    Positioned(
                      left: 0.w,
                      top: 0.h,
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
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      left: 38.w,
                      top: 6.h,
                      child: Text(
                        '운영체제',
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
                  ],
                ),
              ),
            ),
            Positioned(
              left: 262.w,
              top: 416.h,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => firstQuizPage(),
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
                      '수강하기 >',
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
              left: 53.w,
              top: 416.h,
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
                      '< 홈으로',
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
              left: 53.w,
              top: 290.h,
              child: Container(
                width: 125.w,
                height: 30.h,
                child: Stack(
                  children: [
                    Positioned(
                      left: 0.w,
                      top: 0.h,
                      child: Container(
                        width: 125.w,
                        height: 30.h,
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 125.w,
                              height: 30.h,
                              decoration: ShapeDecoration(
                                color: Colors.white.withOpacity(0.5),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      left: 38.w,
                      top: 6.h,
                      child: Text(
                        '자료구조',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0x7F143264),
                          fontSize: 13,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w900,
                          height: 0.11,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 53.w,
              top: 330.h,
              child: Container(
                width: 125.w,
                height: 30.h,
                child: Stack(
                  children: [
                    Positioned(
                      left: 0.w,
                      top: 0.h,
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
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      left: 20.w,
                      top: 6.h,
                      child: Text(
                        '소프트웨어공학',
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
                  ],
                ),
              ),
            ),
            Positioned(
              left: 67.w,
              top: 376.h,
              child: Text(
                '프로그래밍언어론',
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
              left: 229.w,
              top: 376.h,
              child: Text(
                '컴퓨터구조',
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
              left: 61.w,
              top: 479.h,
              child: Container(
                width: 258.w,
                height: 19.h,
                child: Stack(
                  children: [
                    Positioned(
                      left: 0.w,
                      top: 1.h,
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
                      left: 222.w,
                      top: 1.h,
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
                      left: 59.w,
                      top: 0.h,
                      child: Container(
                        width: 155.w,
                        height: 19.h,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 0.w,
                              top: 0.h,
                              child: Container(
                                width: 155.w,
                                height: 19.h,
                                decoration: ShapeDecoration(
                                  color: Color(0x7F6BBEE2),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(13),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 6.w,
                              top: 3.h,
                              child: Container(
                                width: 77.w,
                                height: 12.h,
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
                          image: AssetImage('images/지식지수.png'),
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
                          image: AssetImage('images/활동지수.png'),
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
                          image: AssetImage('images/사교지수.png'),
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
                      width: 80.w,//이미지는 나중에 크기 수정하면 됨
                      height: 80.h,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('images/도움말.png'),
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

