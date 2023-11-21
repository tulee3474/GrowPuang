import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:growpuang/controller/language_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class NavigateIcon extends StatelessWidget {
  final languageController = Get.put(LanguageController());
  final String iconImage;
  var iconName;

  NavigateIcon({required this.iconImage, required this.iconName});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 130.w,
          height: 60.h,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/${iconImage}.png'),
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
        Text(
          iconName,
          style: TextStyle(
            color: Color(0xFF143264),
            fontSize: 17.sp,
            fontFamily: 'YourFontFamily',
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}
