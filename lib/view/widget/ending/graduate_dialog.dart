import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controller/language_controller.dart';
import '../../../controller/personal_contoller.dart';
import 'goGradu.dart';


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
      insetPadding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 150.h),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 50.w, vertical: 30.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              languageController.gradDialog,
              style: TextStyle(fontSize: 25.sp, fontWeight: FontWeight.w700),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20.h,
            ),
            buildRow(
              'assets/images/지식_icon.png',
              languageController.major,
              personalController.solveQuizList.length,
              personalController.intellectScore,
              30,
              false,
            ),
            SizedBox(
              height: 20.h,
            ),
            buildRow(
              'assets/images/활동_icon.png',
              languageController.activity,
              personalController.participateActList.length,
              personalController.participateActList.length,
              6,
              true,
            ),
            SizedBox(
              height: 20.h,
            ),
            buildCvRow(),
            SizedBox(
              height: 20.h,
            ),
            Container(
              child:
                (personalController.solveQuizList.length<6) ? Text(languageController.alertGradu, style: TextStyle(fontSize: 20
                    .sp, color: Colors.red,),)
                    : (personalController.communityResult > 0 ) ?
              goGradu() : Text(languageController.alert2Gradu, style: TextStyle(fontSize: 20
                    .sp, color: Colors.red,),)
            ),
          ],
        ),
      ),
    );
  }

  Widget buildRow(
      String imageAsset,
      String title,
      int listLength,
      int value,
      int maxValue,
      bool isact,
      ) {
    return Row(
      children: [
        SizedBox(
          width: 70.w,
          height: 70.h,
          child: Image.asset(
            imageAsset,
            width: 40.w,
            height: 60.h,
            fit: BoxFit.fitWidth,
          ),
        ),
        SizedBox(width: 25.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '$title $listLength/6',
              style: TextStyle(
                fontSize: 20.sp,
                color: isact ? Color(0xFF143264)
                    : (listLength < 6) ? Colors.red
                    : const Color(0xFF143264),
              ),
            ),
            Row(
              children: [
                SizedBox(
                  width: 200.w,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30.0),
                    child: LinearProgressIndicator(
                      minHeight: 15.0.h,
                      value: value / maxValue,
                      valueColor: const AlwaysStoppedAnimation<Color>(
                        Color(0xFF143264),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 30.w),
                Text(
                  '$value/$maxValue',
                  style: TextStyle(
                    color: const Color(0xFF143264),
                    fontSize: 20.sp,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget buildCvRow() {
    return Row(
      children: [
        SizedBox(
          width: 70.w,
          height: 70.h,
          child: Image.asset(
            'assets/images/자소서_icon.png',
            width: 50.w,
            height: 60.h,
            fit: BoxFit.fitWidth,
          ),
        ),
        SizedBox(width: 20.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              languageController.cv,
              style: TextStyle(fontSize: 20.sp),
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
                SizedBox(width: 5.w),
                Text(
                  (personalController.communityResult > 0)
                      ? languageController.done
                      : languageController.notDone,
                  style: TextStyle(fontSize: 18.sp),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}




