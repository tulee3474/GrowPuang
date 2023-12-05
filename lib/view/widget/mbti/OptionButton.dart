import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:growpuang/controller/language_controller.dart';



class OptionButton extends StatelessWidget {
  final languageController = Get.put(LanguageController());

  final VoidCallback onTap;
  final double topPosition;
  final String buttonText;

  OptionButton({
    Key? key,
    required this.onTap,
    required this.topPosition,
    required this.buttonText,
  }) : super(key: key);

  void _navigateToPage(BuildContext context, Widget page) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  }

  String _getQuestionText(String koreanText, String englishText) {
    return languageController.language == '한국어' ? koreanText : englishText;
  }

  String _getOptionText(String koreanText, String englishText) {
    return languageController.language == '한국어' ? koreanText : englishText;
  }


  @override
  Widget build(BuildContext context) {
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

  Widget buildOptionButton(String text, VoidCallback onTap) {
    return GestureDetector(
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
              text,
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
    );
  }



}
