import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:growpuang/view/widget/appBar.dart';
import 'package:growpuang/view/widget/mbti_diamond.dart';

import '../widget/first_appBar.dart';
import 'secondPage.dart';

String selectedLanguage = '한국어';

class firstPage extends StatelessWidget {
  const firstPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Stack(
        children: [
          firstappBar(),
          mbti_diamond(),
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
