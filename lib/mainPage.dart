import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:growpuang/controller/language_controller.dart';
import 'package:growpuang/controller/personal_contoller.dart';
import 'package:growpuang/controller/post_list_controller.dart';
import 'package:growpuang/view/widget/appBar.dart';
import 'package:growpuang/view/widget/navigateBar.dart';

class MainPage extends StatelessWidget {
  final languageController = Get.put(LanguageController());
  final postListController = Get.put(PostListController());
  final personalController = Get.put(PersonalController());

  MainPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Stack(
        children: [
          appBar(),
          // 자산 이미지 크기 및 배치 수정
          Positioned(
            left: 0.w,
            right: 0.w,
            top: 250.h, // 원하는 위치로 조정
            child: Center(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      personalController.option1 +
                          ' ' +
                          personalController.option2,
                      style: TextStyle(
                        color: Color(0xFF143264),
                        fontSize: 40.sp,
                        fontFamily: 'YourFontFamily',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h), // 원하는 여백 크기로 조정
                  Container(
                    width: 300.w, // 이미지 너비 조정
                    height: 280.h, // 이미지 높이 조정
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                            'assets/images/${personalController.pick_img}'),
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                  SizedBox(height: 30.h),
                  // 게이지 바 (기본-푸앙이 밑에 배치)
                  Positioned(
                    left: 20.w,
                    right: 20.w,
                    top: 650.h, // 기본-푸앙이 밑에 원하는 위치로 조정
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 70.0.w),
                      // 좌우 여백을 조정
                      child: Row(
                        children: [
                          Text(
                            languageController.language == '한국어' ? '체력' : 'HP',
                            style: TextStyle(
                              color: Color(0xFF143264),
                              fontSize: 25.sp,
                              fontFamily: 'YourFontFamily',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 20.w), // 원하는 여백 크기로 조정
                          Expanded(
                            child: ClipRRect(
                              borderRadius:
                                  BorderRadius.circular(30.0), // 원하는 라운드값으로 조절
                              child: LinearProgressIndicator(
                                minHeight: 20.0.h,
                                value: personalController
                                    .hpScore/30, // 게이지 바의 값 (0.0에서 1.0 사이)
                                valueColor: AlwaysStoppedAnimation<Color>(
                                    Color(0xFF143264)), // 게이지 바 색상
                              ),
                            ),
                          ),
                          SizedBox(width: 30.w), // 원하는 여백 크기로 조정
                          Text(
                            '${personalController.hpScore} / 30', // 원하는 비율로 변경
                            style: TextStyle(
                              color: Color(0xFF143264),
                              fontSize: 25.sp,
                              fontFamily: 'YourFontFamily',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          navigateBar(),
        ],
      ),
    );
  }
}
