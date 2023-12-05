
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



Widget buildBackgroundImage(double height) {
  return Container(
    width: double.infinity,
    decoration: const BoxDecoration(
      image: DecorationImage(
        image: AssetImage('assets/images/로그인화면.png'),
        fit: BoxFit.cover,
      ),
    ),
    child: Container(
      margin: EdgeInsets.fromLTRB(20.w, 380.h, 20.w, height),
      padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 20.h),
      color: Colors.white.withOpacity(0.5),
    ),
  );
}