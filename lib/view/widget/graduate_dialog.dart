import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../controller/language_controller.dart';
import '../../controller/personal_contoller.dart';


class GraduateDialog extends StatelessWidget {
  GraduateDialog({super.key});
  final personalController = Get.put(PersonalController());
  final languageController = Get.put(LanguageController());
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: const RoundedRectangleBorder(
          borderRadius:
          BorderRadius.all(Radius.circular(2.0))),
      alignment: Alignment.center,
      // insetPadding: EdgeInsets.fromLTRB(30.w, 100.h, 30.w, 200.h),
      insetPadding: EdgeInsets.symmetric(horizontal : 30.w, vertical : 150.h),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 50.w, vertical: 30.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              personalController.option1 + (languageController.language == '한국어' ? ' 푸앙이의\n' : ' puang\n')+ (languageController.gradDialog),
              style: TextStyle(fontSize: 30.sp,fontWeight: FontWeight.w900),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20.h,),
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
                    Text("전공필수"),
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
            SizedBox(height: 20.h,),
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
                    Text("활동지수"),
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
            SizedBox(height: 20.h,),
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
                    Text("자기소개서 작성"),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text("완료 or 미완료", style: TextStyle(fontSize:25.sp),)
                    //게시글 >= 1 ? "완료' : "미완료"
                  ],
                ),
              ],
            ),
            SizedBox(height: 20.h,),
            Text("졸업을 진행하시겠습니까?"),
            SizedBox(height: 10.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(onPressed: (){}, child: Text("아니오"),),
                TextButton(onPressed: (){}, child: Text("네"),),
              ],
            )
          ],
        ),
      ),
    );
  }
}