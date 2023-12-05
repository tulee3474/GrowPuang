import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:growpuang/view/widget/appBar.dart';
import 'package:get/get.dart';
import 'package:growpuang/view/widget/navigateBar.dart';

import '../../controller/language_controller.dart';
import '../../controller/personal_contoller.dart';
import '../../mainPage.dart';
import '../widget/act_dialog.dart';
import '../widget/act_error_dialog.dart';

class ActivityPageMain extends StatefulWidget {
  const ActivityPageMain({super.key});

  @override
  State<ActivityPageMain> createState() => _ActivityPageMainState();
}

class _ActivityPageMainState extends State<ActivityPageMain> {
  final languageController = Get.put(LanguageController());
  final personalController = Get.put(PersonalController());

  List<bool> selectedStates = List.generate(6, (index) => false);
  List<int> selectedIdx = [];
  late int changeHp;

  @override
  void initState() {
    super.initState();
    changeHp = personalController.hpScore;
  }


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // 뒤로가기 버튼 눌렀을 때의 동작을 정의
        // 여기서는 앱을 종료하지 않고, 홈 화면으로 이동
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => MainPage()),
        );
        return false; // true를 반환하면 기존 동작 수행(일반적으로는 앱 종료)
      },
      child: Scaffold(
        appBar: null,
        body: Stack(
          children: [
            appBar(),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 500.w,
                    height: 350.h,
                    // margin: EdgeInsets.fromLTRB(20.w, 280.h, 20.w, 250.h),
                    padding: EdgeInsets.symmetric(horizontal: 40.w),
                    color: Colors.white.withOpacity(0.5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          languageController.actInfo,
                          style: TextStyle(
                            color: const Color(0xFF143264),
                            fontSize: 20.sp,
                            fontFamily: 'YourFontFamily',
                            fontWeight: FontWeight.w700,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        GridView.count(
                          padding: EdgeInsets.symmetric(vertical: 10.h),
                          crossAxisCount: 2,
                          childAspectRatio: 3 / 1,
                          mainAxisSpacing: 10.h,
                          crossAxisSpacing: 10.w,
                          shrinkWrap: true,
                          children: List.generate(6, (index) {
                            if (personalController.participateActList
                                .contains(index)) { //참여 완료 여부 체크
                              //참여 완료한 활동이면 선택X
                              return Container(
                                alignment: Alignment.center,
                                color: Colors.white.withOpacity(0.5),
                                child: SizedBox(
                                  width: 200.w,
                                  child: Text(
                                    languageController.activityList[index],
                                    style: TextStyle(
                                      color: Colors.black26,
                                      fontSize: 17.sp,
                                      // fontFamily: 'YourFontFamily',
                                      // fontWeight: FontWeight.w300,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              );
                            } else { //아직 완료 전 활동이면 선택을 활성화한다
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedStates[index] =
                                        !selectedStates[index];
                                    if (selectedIdx.contains(index)) {
                                      //이미 있으면 뺀다
                                      changeHp += 5;
                                      selectedIdx.remove(index);
                                    } else {
                                      if (changeHp == 0) {
                                      } else {
                                        selectedIdx.add(index);
                                        changeHp -= 5;
                                      }
                                    }
                                  });
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  color: selectedStates[index]
                                      ? const Color(0xFF143264)
                                      : const Color(0xFF6CBEE2),
                                  child: SizedBox(
                                    width: 200.w,
                                    child: Text(
                                      languageController.activityList[index],
                                      style: TextStyle(
                                        color: selectedStates[index]
                                            ? Colors.white
                                            : const Color(0xFF143264),
                                        fontSize: 18.sp, //버튼 텍스트
                                        // fontFamily: 'YourFontFamily',
                                        // fontWeight: FontWeight.w300,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              );
                            }
                          }),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MainPage(),
                                  ),
                                );
                              },
                              child: Text(
                                "< ${languageController.goHome}",
                                style: TextStyle(
                                  color: const Color(0xFF143264),
                                  fontSize: 18.sp,
                                  fontFamily: 'YourFontFamily',
                                ),
                              ),
                            ),
                            //참여하기버튼 이벤트
                            TextButton(
                              onPressed: () {
                                if (selectedIdx.isEmpty) {
                                  //선택한 활동이 없다면 안내 다이어로그를 띄웁니다
                                  showDialog(
                                      context: context,
                                      barrierDismissible: true,
                                      // 바깥 영역 터치시 닫을지 여부
                                      builder: (BuildContext context) {
                                        Future.delayed(
                                          const Duration(seconds: 1),
                                              () {
                                            Navigator.of(context,
                                                rootNavigator: true)
                                                .pop();
                                          },
                                        );
                                        return ActErrorDialog();
                                      });
                                } else {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => MainPage(),
                                    ),
                                  );
                                  //참여한 활동리스트에 선택한 활동의 인덱스들을 넣습니다
                                  personalController.participateActList
                                      .addAll(selectedIdx);
                                  //남은 체력 계산
                                  personalController.hpScore = changeHp;
                                  selectedIdx = [];
                                  showDialog(
                                      context: context,
                                      barrierDismissible: true,
                                      // 바깥 영역 터치시 닫을지 여부
                                      builder: (BuildContext context) {
                                        Future.delayed(
                                          const Duration(seconds: 1),
                                              () {
                                            Navigator.of(context,
                                                rootNavigator: true)
                                                .pop();
                                          },
                                        );
                                        return ActDialog();
                                      });
                                }
                              },
                              child: Text(
                                languageController.takePart,
                                style: TextStyle(
                                  color: const Color(0xFF143264),
                                  fontSize: 18.sp,
                                  fontFamily: 'YourFontFamily',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                ],
              ),
            ),
            //활동 후 체력
            Positioned(
              right: 60.w,
              bottom: 200.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    languageController.hpAfterAct,
                    style: TextStyle(
                      color: const Color(0xFF143264),
                      fontSize: 20.sp,
                      fontFamily: 'YourFontFamily',
                    ),
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  SizedBox(
                    width: 200.w,
                    child: ClipRRect(
                      borderRadius:
                      BorderRadius.circular(30.0), // 원하는 라운드값으로 조절
                      child: LinearProgressIndicator(
                        minHeight: 20.0.h,
                        value: changeHp / 30,
                        // 게이지 바의 값 (0.0에서 1.0 사이)
                        valueColor: const AlwaysStoppedAnimation<Color>(
                          Color(0xFF143264),
                        ), // 게이지 바 색상
                      ),
                    ),
                  ),
                  SizedBox(width: 30.w), // 원하는 여백 크기로 조정
                  Text(
                    '$changeHp/30',
                    // 원하는 비율로 변경
                    style: TextStyle(
                      color: const Color(0xFF143264),
                      fontSize: 20.sp,
                      fontFamily: 'YourFontFamily',
                    ),
                  ),
                ],
              ),
            ),
            navigateBar(),
          ],
        ),
      ),
    );
  }
}
