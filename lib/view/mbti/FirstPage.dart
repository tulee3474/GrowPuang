import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'secondPage.dart';


String selectedLanguage = '한국어';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key, required this.title}) : super(key: key);

  final String title;

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
          Center(
            child: Container(
              width: 510.w,
              height: 490.h,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/자산.png'),
                  fit: BoxFit.fill,
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
          Positioned(
            left: 192.w,
            top: 640.h,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SecondPage(),
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
                      'Start >',
                      style: TextStyle(
                        color: Color(0xFF143264),
                        fontSize: 55.sp,
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
