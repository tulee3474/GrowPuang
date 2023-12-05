import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FirstAppBar extends StatelessWidget {
  const FirstAppBar({super.key});

  @override

  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      alignment: Alignment.center,
      children: [
        // 반응형 배경 이미지 설정
        Positioned(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/배경.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        // 영신관 이미지 (상단 중앙에 배치)
        Positioned(
          top: 40.h,
          child: Align(
            alignment: Alignment.topCenter,
            child: GestureDetector(
              onTap: () {

                // 영신관 이미지를 누를 때 수행할 작업을 정의하세요.
                // 여기에서 다음 질문 또는 동작을 정의할 수 있습니다.
              },
              child: Container(
                width: 540.w,
                height: 180.h,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/영신관2.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
