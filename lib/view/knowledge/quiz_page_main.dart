import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:growpuang/view/widget/appBar.dart';
import 'package:growpuang/view/widget/navigateBar.dart';

import '../../controller/language_controller.dart';
import '../../controller/personal_contoller.dart';

class QuizPage extends StatelessWidget {
  int quizNum;

  QuizPage({super.key, required this.quizNum});

  final languageController = Get.put(LanguageController());
  final personalController = Get.put(PersonalController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Stack(
        children: [
          appBar(),
          Container(
            margin: EdgeInsets.fromLTRB(20.w, 220.h, 20.w, 200.h),
            color: Colors.white.withOpacity(0.5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    languageController.csQuiz,
                    style: TextStyle(
                      color: Color(0xFF143264),
                      fontSize: 30.sp,
                      fontFamily: 'YourFontFamily',
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    child: Text(
                      languageController.csQuizList[0],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF143264),
                        fontSize: 20.sp,
                        fontFamily: 'YourFontFamily',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    width: 400.w,
                    height: 40.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(0.0),
                    ),
                    alignment: Alignment.center,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    child: Text(
                      languageController.csQuizList[1],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF143264),
                        fontSize: 20.sp,
                        fontFamily: 'YourFontFamily',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    width: 400.w,
                    height: 40.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(0.0),
                    ),
                    alignment: Alignment.center,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    child: Text(
                      languageController.csQuizList[2],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF143264),
                        fontSize: 20.sp,
                        fontFamily: 'YourFontFamily',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    width: 400.w,
                    height: 40.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(0.0),
                    ),
                    alignment: Alignment.center,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        languageController.goHome,
                        style: TextStyle(
                          color: Color(0xFF143264),
                          fontSize: 20.sp,
                          fontFamily: 'YourFontFamily',
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        languageController.takeSub,
                        style: TextStyle(
                          color: Color(0xFF143264),
                          fontSize: 20.sp,
                          fontFamily: 'YourFontFamily',
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          navigateBar(),
        ],
      ),
    );
  }
}
