import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:growpuang/controller/language_controller.dart';
import 'package:growpuang/controller/personal_contoller.dart';
import 'package:growpuang/controller/post_list_controller.dart';
import 'package:growpuang/model/loading_dialog.dart';
import 'package:growpuang/view/community_screen.dart';
import 'package:growpuang/view/knowledge/KnowledgeMainPage.dart';


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
      bottom: 20.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        builder: (context) => KnowledgeMainPage(),
                      ),
                    );
                  },
                  child: Container(
                    width: 130.w,
                    height: 130.h,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/지식지수.png'),
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
                    width: 100.w,
                    height: 100.h,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/활동지수.png'),
                        fit: BoxFit.contain,
                      ),
                    ),
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
                  child: Container(
                    width: 130.w,
                    height: 130.h,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/사교지수.png'),
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
                    width: 100.w,
                    height: 100.h,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/도움말.png'),
                        fit: BoxFit.contain,
                      ),
                    ),
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