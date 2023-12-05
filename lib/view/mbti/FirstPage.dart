import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:growpuang/view/widget/MbtiDiamond.dart';

import '../widget/FirstAppBar.dart';
import 'SecondPage.dart';
import '../widget/MbtiBackground.dart';

String selectedLanguage = '한국어';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Stack(
        children: [
          const MbtiBackground(),
          _buildStartButton(context),
        ],
      ),
    );
  }

  Widget _buildStartButton(BuildContext context) {
    return Positioned(
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
                  color: const Color(0xFF143264),
                  fontSize: 40.sp,
                  fontFamily: 'YourFontFamily',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
