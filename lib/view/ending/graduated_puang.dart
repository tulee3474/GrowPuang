import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:growpuang/controller/post_list_controller.dart';
import 'package:growpuang/view/mbti/FirstPage.dart';
import 'package:get/get.dart';
import '../../controller/language_controller.dart';
import '../../controller/personal_contoller.dart';
import '../widget/end_dialog.dart';
import '../widget/mbti/FirstAppBar.dart';

class GraduatedPuang extends StatelessWidget {
  final String endingPuang;
  final dynamic job;
  GraduatedPuang({super.key, required this.endingPuang, required this.job});

  final personalController = Get.put(PersonalController());
  final postListController = Get.put(PostListController());
  final languageController = Get.put(LanguageController());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => await showExitPopup(context),
      child: Scaffold(
        appBar: null,
        body: Stack(
          children: [
            const FirstAppBar(),
            buildContent(context),
          ],
        ),
      ),
    );
  }

  Future<bool> showExitPopup(BuildContext context) async {
    return await showDialog(
      context: context,
      builder: (BuildContext context) => EndDialog(),
    ) ?? false;
  }

  Widget buildContent(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: SizedBox(
          width: 500.w,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildEndingText(),
              SizedBox(
                height: 20.h,
              ),
              buildEndingImage(),
              SizedBox(
                height: 10.h,
              ),
              buildJobText(),
              SizedBox(
                height: 20.h,
              ),
              buildRestartButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Text buildEndingText() {
    return Text(
      languageController.ending,
      style: TextStyle(
        color: const Color(0xFF143264),
        fontSize: 25.sp,
        fontFamily: 'YourFontFamily',
      ),
      textAlign: TextAlign.center,
    );
  }

  Image buildEndingImage() {
    return Image.asset(
      'assets/images/$endingPuang.png',
      width: 250.w,
      fit: BoxFit.fitWidth,
    );
  }

  Text buildJobText() {
    return Text(
      job.toString(),
      style: TextStyle(
        color: const Color(0xFF143264),
        fontSize: 25.sp,
        fontFamily: 'YourFontFamily',
        fontWeight: FontWeight.bold,
      ),
    );
  }

  GestureDetector buildRestartButton(BuildContext context) {
    return GestureDetector(
      onTap: () => restartApp(context,false),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              languageController.restart,
              style: TextStyle(
                color: const Color(0xFF143264),
                fontSize: 20.sp,
                fontFamily: 'YourFontFamily',
              ),
            ),
            const Icon(
              Icons.refresh,
              color: Color(0xFF143264),
            ),
          ]),
    );
  }

  void restartApp(BuildContext context, isLogout) {

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
        const FirstPage(title: 'Flutter Demo Home Page'),
        //NewScreen()은 새로운 시작화면입니다. 여기에 원하는 화면 위젯을 넣으세요.
      ),
          (Route<dynamic> route) => false,
    );
  }
}


