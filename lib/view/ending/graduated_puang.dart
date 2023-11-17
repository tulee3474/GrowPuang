import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:growpuang/main.dart';
import 'package:growpuang/view/mbti/firstPage.dart';
import 'package:growpuang/view/widget/appBar.dart';
import 'package:get/get.dart';
import '../../controller/language_controller.dart';
import '../../controller/personal_contoller.dart';
import '../../mainPage.dart';

class GraduatedPuang extends StatelessWidget {
  GraduatedPuang({super.key});
  final personalController = Get.put(PersonalController());
  final languageController = Get.put(LanguageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Stack(
        children: [
          appBar(),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  languageController.ending,
                  style:
                      TextStyle(fontSize: 25.sp, fontWeight: FontWeight.w900),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Image.asset(
                  'assets/images/박사푸앙.png',
                  width: 250.w,
                  // height: 70.h,
                  fit: BoxFit.fitWidth,
                ),
                SizedBox(height: 10.h,),
                Text(languageController.drPuang,style: TextStyle(fontSize: 30.sp,),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("다시하기"),
                    GestureDetector(
                      onTap: () {
                        //여기서 controller에 할당하게 수정
                        languageController.language = languageController.language;

                        // 현재 화면을 스택에서 제거
                        Navigator.of(context).pop();

                        Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                            builder: (context) => firstPage(title: 'Flutter Demo Home Page'),
                            //NewScreen()은 새로운 시작화면입니다. 여기에 원하는 화면 위젯을 넣으세요.
                          ),
                              (Route<dynamic> route) => false,
                        );
                      },
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Icon(Icons.refresh),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
