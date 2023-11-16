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
            Text(languageController.gradDialog,
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
                  width: 20.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(languageController.intellect),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      children: [
                        Container(
                          child: Text("(전공필수 게이지바)"),
                          width: 200.w,
                          height: 20.h,
                          color: Colors.blue,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Text("5/6")
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
                    Text(languageController.activity),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      children: [
                        Container(
                          child: Text("(활동지수 게이지바)"),
                          width: 200.w,
                          height: 20.h,
                          color: Colors.blue,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Text("5/6")
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
                    Text(languageController.cv),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text((personalController.communityResult > 0)
                        ? languageController.done
                        : languageController.notDone),
                    //게시글 >= 1 ? "완료' : "미완료"
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(languageController.askGradu, textAlign: TextAlign.center,),
            SizedBox(
              height: 10.h,
            ),
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
                    ),);
                  },
                  child: Text(languageController.answerYes),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
