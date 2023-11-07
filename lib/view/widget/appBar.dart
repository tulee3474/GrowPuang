import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class appBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/기본-배경.png'),
              fit: BoxFit.fill,
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
              width: 350.w,
              height: 150.h,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/영신관.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}