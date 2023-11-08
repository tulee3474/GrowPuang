import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class appBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: [
        // 반응형 배경 이미지 설정
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/기본-배경.png'),
              fit: BoxFit.fill,
            ),
          ),
        ),
        // 영신관 이미지 (상단 중앙에 배치)
        Align(
          alignment: Alignment.topCenter,
          child: GestureDetector(
            onTap: () {
              // 영신관 이미지를 누를 때 수행할 작업을 정의하세요.
              print('영신관 이미지를 눌렀습니다.');
              // 여기에서 다음 질문 또는 동작을 정의할 수 있습니다.
            },
            child: Container(
              width: 550.w,
              height: 200.h,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/영신관.png'),
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
