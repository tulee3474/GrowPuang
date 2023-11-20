import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:growpuang/view/mbti/firstPage.dart';
import 'package:growpuang/view/widget/appBar.dart';
import 'package:get/get.dart';
import '../../controller/language_controller.dart';
import '../../controller/personal_contoller.dart';
import '../../mainPage.dart';
import '../widget/first_appBar.dart';

class GraduatedPuang extends StatelessWidget {
  final String endingPuang;
  var job;
  GraduatedPuang({super.key, required this.endingPuang, required this.job});

  final personalController = Get.put(PersonalController());
  final languageController = Get.put(LanguageController());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        //뒤로가기를 못하게 합니다
        return false;
      },
      child: Scaffold(
        appBar: null,
        body: Stack(
          children: [
            firstappBar(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      languageController.ending, //엔딩멘트
                      style:
                          TextStyle(fontSize: 35.sp,),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Image.asset(
                      'assets/images/${endingPuang}.png',
                      width: 300.w,
                      // height: 70.h,
                      fit: BoxFit.fitWidth,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      job,
                      style: TextStyle(
                        fontSize: 30.sp,
                      ),
                    ),
                    SizedBox(height: 10.h,),
                    GestureDetector(
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
                                fontSize: 30.sp,
                              ),
                            ),
                            Icon(Icons.refresh),
                          ]),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}