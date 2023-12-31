import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:growpuang/controller/language_controller.dart';
import 'package:growpuang/controller/personal_contoller.dart';
import 'package:growpuang/controller/post_list_controller.dart';
import 'package:growpuang/model/loading_dialog.dart';
import 'package:growpuang/view/community_screen.dart';
import 'package:growpuang/view/widget/help_dialog.dart';
import 'package:growpuang/view/widget/navigateIcon.dart';

import '../activity/activity_page_main.dart';
import '../knowledge/quiz_page_main.dart';

class navigateBar extends StatelessWidget {
  final languageController = Get.put(LanguageController());
  final postListController = Get.put(PostListController());
  final personalController = Get.put(PersonalController());

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: [
        Positioned(
        right: 38.w,
        bottom: 55.h,
        child: Image.asset(
          'assets/images/받침대.png',
          width: 500.w,
          // height: 70.h,
          fit: BoxFit.fitWidth,
        ),
      ),
        Positioned(
          left: 20.w,
          right: 20.w,
          bottom: 50.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // 이미지 버튼 1
                    InkWell(
                      onTap: () {
                        // 이미지 버튼 1을 탭했을 때 수행할 작업을 정의
                        // 현재 화면을 스택에서 제거
                        Navigator.of(context).pop();
                        Navigator.push(

                          context,
                          MaterialPageRoute(
                            // builder: (context) => TestKnowledgeMain(),
                            builder: (context) => const QuizPageMain(),
                          ),
                        );
                      },
                      child: NavigateIcon(
                        iconImage: "지식_icon",
                        iconName: languageController.intellect,
                      ),
                    ),
                    // 이미지 버튼 2 (기존 UI 유지)
                    InkWell(
                      onTap: () {
                        // 현재 화면을 스택에서 제거
                        Navigator.of(context).pop();

                        // 이미지 버튼 2를 탭했을 때 수행할 작업을 정의
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            // builder: (context) => TestKnowledgeMain(),
                            builder: (context) => const ActivityPageMain(),
                          ),
                        );
                      },
                      child: NavigateIcon(
                        iconImage: "활동_icon",
                        iconName: languageController.activity,
                      ),
                    ),
                    // 이미지 버튼 3 (기존 UI 유지)
                    InkWell(
                      onTap: () async {
                        //기다리는 동안 로딩창 띄우기
                        loadingDialog(context);
                        //posts가 비어있을때(첫 호출때만 데이터 로딩)
                        if (postListController.postList.isEmpty) {
                          await postListController.readPostData();
                        }
                        //화면 이동 전, 로딩 다이어로그 pop!
                        Navigator.of(context, rootNavigator: true).pop();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CommunityScreen(),
                          ),
                        );
                      },
                      child: NavigateIcon(
                        iconImage: "자소서_icon",
                        iconName: languageController.community,
                      ),
                    ),
                    // 이미지 버튼 4 (기존 UI 유지)
                    InkWell(
                      onTap: () {

                        showDialog(
                            context: context,
                            barrierDismissible: true, // 바깥 영역 터치시 닫을지 여부
                            builder: (BuildContext context) {
                              return HelpDialog();
                            });
                        // 이미지 버튼 4를 탭했을 때 수행할 작업을 정의
                      },
                      child: NavigateIcon(
                        iconImage: "도움말_icon",
                        iconName: languageController.helpDialog,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
