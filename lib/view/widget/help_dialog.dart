import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../controller/language_controller.dart';
import '../../controller/personal_contoller.dart';
import '../ending/graduated_puang.dart';

class HelpDialog extends StatelessWidget {
  HelpDialog({super.key});

  final personalController = Get.put(PersonalController());
  final languageController = Get.put(LanguageController());

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(2.0))),
      alignment: Alignment.center,
      insetPadding: EdgeInsets.symmetric(horizontal: 30.w),
      
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal : 20.w, vertical: 20.h),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    languageController.helpTitle,
                    style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w700),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
                Text(
                  languageController.totalInfo,
                ),
              SizedBox(height: 15.h,),
              Text(languageController.forGradu, style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w700),),
              Text(languageController.requirements),
              SizedBox(
                height: 15.h,
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
                  SizedBox(width: 20.w,),
                  Container(
                      width: 380.w,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(languageController.intellect,style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w700),),
                          Text(languageController.intellectDes),
                        ],
                      ))
                ],
              ),
              SizedBox(height: 15.h,),
              Row( //활동지수 안내
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
                    width:20.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        languageController.activity,
                        style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w700),
                      ),
                      Container(
                          width: 380.w,
                          child: Text(languageController.actDes))
                    ],
                  ),
                ],
              ),
              SizedBox(height: 15.h,),
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
                    width: 10.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        languageController.community,
                        style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w700),
                      ),
                      Container(
                        width: 330.w,
                        child: Text(languageController.cvDes),
                      )
                      //게시글 >= 1 ? "완료' : "미완료"
                    ],
                  ),
                ],
              ),
              SizedBox(height: 15.h,),
              Row(
                children: [
                  Image.asset(
                    'assets/images/영신관2.png',
                    // width: 50.w,
                    height: 50.h,
                    fit: BoxFit.fitHeight,),
                  SizedBox(width: 10.w,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(languageController.young,style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w700),),
                      Container(
                          width: 275.w,
                          child: Text(languageController.youngDes))
                    ],
                  )
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(languageController.close),
                  ),
                ],
              ),
            ],
          ),
      ),
    );
  }
}


