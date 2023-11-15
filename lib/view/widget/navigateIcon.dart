import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:growpuang/controller/language_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class NavigateIcon extends StatelessWidget {
  final languageController = Get.put(LanguageController());
  final String iconImage;
  final String iconNameKo;
  final String iconNameEng;

  NavigateIcon({required this.iconImage, required this.iconNameKo,required this.iconNameEng});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 130.w,
          height: 70.h,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/${iconImage}.png'),
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
        Text(
          languageController.language == '한국어'
              ? iconNameKo
              : iconNameEng,
          style: TextStyle(
            color: Color(0xFF143264),
            fontSize: 20.sp,
            fontFamily: 'YourFontFamily',
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}
