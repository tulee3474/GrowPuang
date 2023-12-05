import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class MbtiDiamond extends StatelessWidget {
  bool goUp = false;

  MbtiDiamond({super.key}){
    toggleNormal();
  }

  MbtiDiamond.goUp({super.key}){
    toggleGoUp();
  }

  void toggleGoUp() {
    goUp = true;
  }

  void toggleNormal() {
    goUp = false;
  }

  @override
  Widget build(BuildContext context) {
    return goUp ? const WidgetGoUp() : const WidgetNormal();
  }
}

class WidgetNormal extends StatelessWidget {
  const WidgetNormal({super.key});

  @override
  Widget build(BuildContext context) {
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

class WidgetGoUp extends StatelessWidget {
  const WidgetGoUp({super.key});

  @override
  Widget build(BuildContext context) {
    return // 자산 이미지 크기 및 배치 수정
      Positioned(
        left: 0.w,
        right: 0.w,
        top: 150.h, //// 더 위로 조정
        child: Center(
          child: Container(
            width: 410.w,
            height: 390.h, // 이미지 높이 조정
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/자산.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
      );
  }
}