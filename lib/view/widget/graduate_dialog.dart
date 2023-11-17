import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../controller/language_controller.dart';
import '../../controller/personal_contoller.dart';
import '../ending/graduated_puang.dart';

class GraduateDialog extends StatelessWidget {
  GraduateDialog({super.key});

  final personalController = Get.put(PersonalController());
  final languageController = Get.put(LanguageController());

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(2.0))),
      alignment: Alignment.center,
      // insetPadding: EdgeInsets.fromLTRB(30.w, 100.h, 30.w, 200.h),
      insetPadding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 150.h),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 50.w, vertical: 30.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              languageController.gradDialog,
              style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.w900),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              children: [
                Container(
                  width: 70.w,
                  height: 70.h,
                  child: Image.asset(
                    'assets/images/지식_icon.png',
                    width: 40.w,
                    height: 60.h,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                SizedBox(
                  width: 25.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      languageController.intellect +
                          " " +
                          personalController.solveQuizList.length.toString() + "/6",
                      style: TextStyle(fontSize: 25.sp,
                      color: (personalController.solveQuizList.length < 6) ? Colors.red : Color(0xFF143264)),
                    ),
                    Row(
                      children: [
                        Container(
                          width: 200.w,
                          child: ClipRRect(
                            borderRadius:
                                BorderRadius.circular(30.0), // 원하는 라운드값으로 조절
                            child: LinearProgressIndicator(
                              minHeight: 15.0.h,
                              value: personalController.intellectScore / 30,
                              // 게이지 바의 값 (0.0에서 1.0 사이)
                              valueColor: AlwaysStoppedAnimation<Color>(
                                Color(0xFF143264),
                              ), // 게이지 바 색상
                            ),
                          ),
                        ),
                        SizedBox(width: 30.w), // 원하는 여백 크기로 조정
                        Text(
                          '${personalController.intellectScore}/30',
                          // 원하는 비율로 변경
                          style: TextStyle(
                            color: Color(0xFF143264),
                            fontSize: 25.sp,
                            fontFamily: 'YourFontFamily',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              children: [
                Container(
                  width: 70.w,
                  height: 70.h,
                  child: Image.asset(
                    'assets/images/활동_icon.png',
                    width: 50.w,
                    height: 60.h,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                SizedBox(
                  width: 20.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      languageController.activity,
                      style: TextStyle(fontSize: 25.sp),
                    ),
                    Row(
                      children: [
                        Container(
                          width: 200.w,
                          child: ClipRRect(
                            borderRadius:
                                BorderRadius.circular(30.0), // 원하는 라운드값으로 조절
                            child: LinearProgressIndicator(
                              minHeight: 15.0.h,
                              value:
                                  personalController.activityResultList.length /
                                      6,
                              // 게이지 바의 값 (0.0에서 1.0 사이)
                              valueColor: AlwaysStoppedAnimation<Color>(
                                Color(0xFF143264),
                              ), // 게이지 바 색상
                            ),
                          ),
                        ),
                        SizedBox(width: 30.w), // 원하는 여백 크기로 조정
                        Text(
                          '${personalController.activityResultList.length}/6',
                          // 원하는 비율로 변경
                          style: TextStyle(
                            color: Color(0xFF143264),
                            fontSize: 25.sp,
                            fontFamily: 'YourFontFamily',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              children: [
                Container(
                  width: 70.w,
                  height: 70.h,
                  child: Image.asset(
                    'assets/images/자소서_icon.png',
                    width: 50.w,
                    height: 60.h,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                SizedBox(
                  width: 20.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      languageController.cv,
                      style: TextStyle(fontSize: 25.sp),
                    ),
                    Row(
                      children: [
                        Icon(
                          (personalController.communityResult > 0)
                              ? Icons.check_circle_outline_rounded
                              : Icons.not_interested_rounded,
                          color: (personalController.communityResult > 0)
                              ? Colors.green
                              : Colors.red,
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Text((personalController.communityResult > 0)
                            ? languageController.done
                            : languageController.notDone),
                      ],
                    ),
                    //게시글 >= 1 ? "완료' : "미완료"
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              languageController.askGradu,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 10.h,
            ),
            Container(
              child:
                (personalController.solveQuizList.length<6) ? Text("전공과목을 미이수 하였습니다", style: TextStyle(fontSize: 25
                    .sp, color: Colors.red,),)
                    : (personalController.communityResult > 0 ) ?
              goGradu() : goGradu()
            ),
          ],
        ),
      ),
    );
  }
}

class goGradu extends StatelessWidget {
  goGradu({super.key});
  final personalController = Get.put(PersonalController());
  final languageController = Get.put(LanguageController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
              onPressed: () {},
              child: Text(languageController.answerNo),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GraduatedPuang(),
                  ),
                );
              },
              child: Text(languageController.answerYes),
            ),
          ],
        )
      ],
    );
  }
}
