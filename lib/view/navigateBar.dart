import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:growpuang/knowledge/KnowledgeMainPage.dart';

import '../view/home_screen.dart';

String selectedLanguage = '한국어';

class navigateBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Positioned(
      left: 20.w,
      right: 20.w,
      bottom: 20.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // 이미지 버튼 1
          InkWell(
            onTap: () {
              // 이미지 버튼 1을 탭했을 때 수행할 작업을 정의
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => KnowledgeMainPage(),
                ),
              );
            },
            child: Container(
              width: 80.w,
              height: 80.h,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/지식지수.png'),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          // 이미지 버튼 2 (기존 UI 유지)
          InkWell(
            onTap: () {
              // 이미지 버튼 2를 탭했을 때 수행할 작업을 정의
            },
            child: Container(
              width: 80.w,
              height: 80.h,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/활동지수.png'),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          // 이미지 버튼 3 (기존 UI 유지)
          InkWell(
            onTap: () {
              // 이미지 버튼 3을 탭했을 때 수행할 작업을 정의
            },
            child: Container(
              width: 80.w,
              height: 80.h,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/사교지수.png'),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          // 이미지 버튼 4 (기존 UI 유지)
          InkWell(
            onTap: () {
              // 이미지 버튼 4를 탭했을 때 수행할 작업을 정의
            },
            child: Container(
              width: 80.w, //이미지는 나중에 크기 수정하면 됨
              height: 80.h,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/도움말.png'),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}