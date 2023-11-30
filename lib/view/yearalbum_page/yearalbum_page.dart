import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:growpuang/view/ending/graduated_puang.dart';
import 'package:growpuang/view/widget/appBar.dart';
import 'package:growpuang/view/widget/puang_history.dart';

import '../../controller/language_controller.dart';
import '../../controller/personal_contoller.dart';

class yearalbumPage extends StatelessWidget {
  yearalbumPage({super.key});

  final languageController = Get.put(LanguageController());
  final personalController = Get.put(PersonalController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Stack(
        children: [
          appBar(),
          Padding(
            padding: EdgeInsets.fromLTRB(10.w, 220.h, 10.w, 10.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Class of Puang",
                  style: TextStyle(
                    color: Color(0xFF143264),
                    fontSize: 25.sp,
                    fontFamily: 'YourFontFamily',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  child: GridView.count(
                      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
                      crossAxisCount: 3,
                      childAspectRatio: 9/10,
                      mainAxisSpacing: 10.h,
                      crossAxisSpacing: 10.w,
                      // shrinkWrap: true,
                      children: List.generate(6, (index) {
                        return PuangHistory(puangType: '모범', puangsJob: '모범적인' +"\n솔루션 아키텍쳐");
                      })),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
