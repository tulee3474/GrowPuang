import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:growpuang/controller/language_controller.dart';
import 'package:growpuang/controller/personal_contoller.dart';
import 'package:growpuang/controller/post_list_controller.dart';
import 'package:growpuang/model/loading_dialog.dart';
import 'package:growpuang/view/community_screen.dart';
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
    return Positioned(
      left: 20.w,
      right: 20.w,
      bottom: 50.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Positioned(
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
                        // builder: (context) => TestKnowledgeMain(),
                        builder: (context) => QuizPageMain(),
                      ),
                    );
                  },
                  child: NavigateIcon(
                    iconImage: "지식_icon",
                    iconNameKo: "지식지수",
                    iconNameEng: "intellect",
                  ),
                ),
                // 이미지 버튼 2 (기존 UI 유지)
                InkWell(
                  onTap: () {
                    // 이미지 버튼 2를 탭했을 때 수행할 작업을 정의
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        // builder: (context) => TestKnowledgeMain(),
                        builder: (context) => ActivityPageMain(),
                      ),
                    );
                  },
                  child: NavigateIcon(
                    iconImage: "활동_icon",
                    iconNameKo: "활동지수",
                    iconNameEng: "activity",
                  ),
                ),
                // 이미지 버튼 3 (기존 UI 유지)
                InkWell(
                  onTap: () async {
                    //기다리는 동안 로딩창 띄우기
                    loadingDialog(context);
                    //posts가 비어있을때(첫 호출때만 데이터 로딩)
                    print(postListController.postList);
                    if (postListController.postList.length == 0) {
                      await postListController.readPostData();
                    }
                    //화면 이동 전, 로딩 다이어로그 pop!
                    Navigator.of(context, rootNavigator: true).pop();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CommunityScreen(),
                      ),
                    );
                    print('커뮤니티 페이지로 넘어 갑니다');
                  },
                  child: NavigateIcon(
                    iconImage: "자소서_icon",
                    iconNameKo: "자소서 게시판",
                    iconNameEng: "CV board",
                  ),
                ),
                // 이미지 버튼 4 (기존 UI 유지)
                InkWell(
                  onTap: () {
                    // 이미지 버튼 4를 탭했을 때 수행할 작업을 정의
                  },
                  child: NavigateIcon(
                    iconImage: "도움말_icon",
                    iconNameKo: "도움말",
                    iconNameEng: "help",
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
