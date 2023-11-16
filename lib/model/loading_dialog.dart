import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:growpuang/controller/language_controller.dart';

void loadingDialog(context) {
  final languageController = Get.put(LanguageController());

  showDialog(
    context: context,
    barrierDismissible: false, // 바깥 영역 터치시 창닫기 x
    builder: (BuildContext context) {
      return AlertDialog(
        content: SizedBox(
          width: 200.w,
          height: 180.h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  languageController.loadingMessage,
                  style: TextStyle(
                      fontFamily: "Neo",
                      fontWeight: FontWeight.bold,
                      fontSize: 25.sp),
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              const Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(child: SpinKitRing(color: Colors.grey)),
                    ]),
              ),
            ],
          ),
        ),
      );
    },
  );
}
