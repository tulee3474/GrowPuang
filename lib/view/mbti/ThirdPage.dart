import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:growpuang/view/widget/mbti/MbtiDiamond.dart';
import '../widget/mbti/FirstAppBar.dart';
import 'fourthPage.dart';
import 'sixthPage.dart';
import 'package:get/get.dart';
import 'package:growpuang/controller/language_controller.dart';

class ThirdPage extends StatelessWidget {
  final languageController = Get.put(LanguageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Stack(
        children: [
          const FirstAppBar(),
          MbtiDiamond.goUp(),
          _buildTitle(),
          _buildOptionContainer(
            onTap: () => _navigateToPage(context,
              FourthPage(
                question: _getQuestionText('내가 실패했을 때 두려운 것은?', 'What do I fear when I fail?'),
                option1: _getOptionText('다른 사람의 평판', 'someone else\'s reputation'),
                option2: _getOptionText('좌절감', 'frustration'),
              ),
            ),
            topPosition: 570.h,
            buttonText: _getButtonText('이 일을 하지 않았을 때\n잃게 될 것들을 떠올린다', 'Think about what you will lose if you don\'t do this.'),
          ),
          _buildOptionContainer(
            onTap: () => _navigateToPage(context,
              SixthPage(
                question: _getQuestionText('내가 실패했을 때 두려운 것은?', 'What do I fear when I fail?'),
                option1: _getOptionText('좌절감', 'frustration'),
                option2: _getOptionText('다른 사람의 평판', 'someone else\'s reputation'),
              ),
            ),
            topPosition: 740.h,
            buttonText: _getButtonText('이 일을 해냈을 때 얻게 될\n보상을 떠올린다', 'Think about the reward you will receive when you accomplish this task.'),
          ),
        ],
      ),
    );
  }

  Widget _buildTitle() {
    return Center(
      child: Padding(
        padding: EdgeInsets.only(top: 130.h),
        child: Text(
          languageController.language == '한국어'
              ? '나는 어떤일을 할 때?'
              : 'When I do something?',
          style: TextStyle(
            color: const Color(0xFF143264),
            fontSize: 30.sp,
            fontFamily: 'YourFontFamily',
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
  Widget _buildOptionContainer({
    required VoidCallback onTap,
    required double topPosition,
    required String buttonText,
  }) {
    return Positioned(
      left: 50.w,
      right: 50.w,
      top: topPosition,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          height: 130.h,
          decoration: BoxDecoration(
            color: const Color(0xFF143264),
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                buttonText,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.sp,
                  fontFamily: 'YourFontFamily',
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _navigateToPage(BuildContext context, Widget page) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  }

  String _getQuestionText(String koreanText, String englishText) {
    return languageController.language == '한국어' ? koreanText : englishText;
  }

  String _getOptionText(String koreanText, String englishText) {
    return languageController.language == '한국어' ? koreanText : englishText;
  }

  String _getButtonText(String koreanText, String englishText) {
    return languageController.language == '한국어' ? koreanText : englishText;
  }
}
