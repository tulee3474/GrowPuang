import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:growpuang/controller/post_list_controller.dart';
import 'package:growpuang/view/mbti/firstPage.dart';
import 'package:growpuang/view/widget/appBar.dart';
import 'package:get/get.dart';
import '../../controller/language_controller.dart';
import '../../controller/personal_contoller.dart';
import '../../mainPage.dart';
import '../widget/end_dialog.dart';
import '../widget/first_appBar.dart';

class GraduatedPuang extends StatelessWidget {
  final String endingPuang;
  var job;
  GraduatedPuang({super.key, required this.endingPuang, required this.job});

  final personalController = Get.put(PersonalController());
  final postListController = Get.put(PostListController());
  final languageController = Get.put(LanguageController());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        //뒤로가기를 못하게 합니다
        bool shouldClose = (await showExitPopup(context)) as bool;
        return shouldClose;
      },
      child: Scaffold(
        appBar: null,
        body: Stack(
          children: [
            firstappBar(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Container(
                  width: 500.w,
                  // height: 400.h,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        languageController.ending, //엔딩멘트
                        style: TextStyle(
                          color: Color(0xFF143264),
                          fontSize: 25.sp,
                          fontFamily: 'YourFontFamily',
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Image.asset(
                        'assets/images/${endingPuang}.png',
                        width: 250.w,
                        fit: BoxFit.fitWidth,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        job,
                        style: TextStyle(
                          color: Color(0xFF143264),
                          fontSize: 25.sp,
                          fontFamily: 'YourFontFamily',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Container(
                        child: GestureDetector(
                          onTap: () {
                            //값들 초기화
                            //활동 리스트 초기화
                            personalController.participateActList = [];
                            //게시글 개수 초기화
                            personalController.communityResult = 0;
                            //푼 문제 초기화
                            personalController.solveQuizList = [];
                            //점수 초기화
                            personalController.intellectScore = 0;
                            personalController.hpScore = 30;
                            postListController.postList = [];
                            // personalController.progressValue=30;
                            // 현재 화면을 스택에서 제거
                            Navigator.of(context).pop();
                            Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                builder: (context) =>
                                    firstPage(title: 'Flutter Demo Home Page'),
                                //NewScreen()은 새로운 시작화면입니다. 여기에 원하는 화면 위젯을 넣으세요.
                              ),
                              (Route<dynamic> route) => false,
                            );
                          },
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  languageController.restart,
                                  style: TextStyle(
                                    color: Color(0xFF143264),
                                    fontSize: 20.sp,
                                    fontFamily: 'YourFontFamily',
                                  ),
                                ),
                                Icon(
                                  Icons.refresh,
                                  color: Color(0xFF143264),
                                ),
                              ]),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  Future<Future> showExitPopup(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return EndDialog();
      },
    );
  }
}


