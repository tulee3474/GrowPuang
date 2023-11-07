import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class mbti_diamond extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
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
    );
  }
}