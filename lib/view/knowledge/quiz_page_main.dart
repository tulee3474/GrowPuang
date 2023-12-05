import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:growpuang/view/knowledge/quiz_page_algor.dart';
import 'package:growpuang/view/knowledge/quiz_page_cs.dart';
import 'package:growpuang/view/knowledge/quiz_page_ds.dart';
import 'package:growpuang/view/knowledge/quiz_page_pl.dart';
import 'package:growpuang/view/knowledge/quiz_page_swe.dart';
import 'package:growpuang/view/knowledge/quize_page_os.dart';
import 'package:growpuang/view/widget/appBar.dart';
import 'package:growpuang/view/widget/navigateBar.dart';
import 'package:growpuang/view/widget/submit_error_dialog.dart';

import '../../controller/language_controller.dart';
import '../../controller/personal_contoller.dart';
import 'package:get/get.dart';

import '../../mainPage.dart';

class QuizPageMain extends StatefulWidget {
  const QuizPageMain({super.key});

  @override
  State<QuizPageMain> createState() => _QuizPageMainState();
}

class _QuizPageMainState extends State<QuizPageMain> {
  final personalController = Get.put(PersonalController());
  final languageController = Get.put(LanguageController());
  String? selectedQuiz;
  List<Widget> whichQuizPage = [
    QuizPageDs(),
    QuizPageAlgor(),
    QuizPageSwe(),
    QuizPageOs(),
    QuizPagePl(),
    QuizPageCs()
  ];
  late int addScore;
  late List<Map<String, Object>> lectures = [
    {
      'questionText': languageController.quizInfo,
      'answers': [
        {'text': languageController.quizList[0]},
        {'text': languageController.quizList[1]},
        {'text': languageController.quizList[2]},
        {'text': languageController.quizList[3]},
        {'text': languageController.quizList[4]},
        {'text': languageController.quizList[5]},
      ]
    },
    // 다른 퀴즈들 추가 가능
  ];

  void _chooseQuiz() {
    setState(() {
      Navigator.push(
        context,
        MaterialPageRoute(
          // builder: (context) => TestKnowledgeMain(),
          builder: (context) => whichQuizPage[selectedIndex],
        ),
      );
    });
  }

  final int _quizIndex = 0;
  int selectedIndex = 7;

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
                    padding: EdgeInsets.symmetric(horizontal:  40.w),
                    color: Colors.white.withOpacity(0.5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          lectures[_quizIndex]['questionText'] as String,
                          // questions[_questionIndex]['questionText'] as String,
                          style: TextStyle(
                            fontSize: 20.sp,
                            color: const Color(0xFF143264),
                            fontFamily: 'YourFontFamily',
                            fontWeight: FontWeight.w700,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        GridView.count(
                          padding: EdgeInsets.symmetric(vertical: 10.h),
                          childAspectRatio: 3 / 1,
                          //item 의 가로 3, 세로 1 의 비율
                          crossAxisCount: 2,
                          // Set the number of columns
                          mainAxisSpacing: 10.h,
                          crossAxisSpacing: 10.w,
                          shrinkWrap: true,
                          children: List.generate(
                            6,
                            (index) {
                              final answer = (lectures[_quizIndex]['answers']
                                  as List<Map<String, Object>>)[index];
                              //푼 퀴즈와 안푼퀴즈 구분
                              if (personalController.solveQuizList.contains(index)) {
                                // 이미 푼 퀴즈일 때
                                return Container(
                                  alignment: Alignment.center,
                                  color: Colors.white.withOpacity(0.5),
                                  child: SizedBox(
                                    width: 200.w,
                                    child: Text(
                                      answer['text'] as String,
                                      style: TextStyle(
                                        fontSize: 17.sp,
                                        color: Colors.black26,
                                        // fontWeight: FontWeight.w300,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                );
                              } else { //아직 풀기 전일때
                                return GestureDetector(
                                  onTap: () {
                                    setState(
                                      () {
                                        selectedQuiz = answer['text'] as String;
                                        List<Map<String, Object>> answersList =
                                            (lectures[0]['answers']
                                                as List<Map<String, Object>>);

                                        selectedIndex =
                                            answersList.indexWhere((answer) {
                                          return answer['text'] == selectedQuiz;
                                        });
                                      },
                                    );
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    color: selectedQuiz == answer['text']
                                        ? const Color(0xFF143264)
                                        : Colors.white,
                                    child: SizedBox(
                                      width: 200.w,
                                      child: Text(
                                        answer['text'] as String,
                                        style: TextStyle(
                                          fontSize: 18.sp,
                                          color: selectedQuiz == answer['text']
                                              ? Colors.white
                                              : const Color(0xFF143264),
                                          // fontWeight: FontWeight.w300,
                                          // fontFamily: 'YourFontFamily',
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                );
                              }
                            },
                          ),
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
                            TextButton(
                              onPressed: () {
                                //선택한 버튼이 없다면 알림을 출력합니다
                                if (selectedQuiz == null) {
                                  showDialog(
                                      context: context,
                                      barrierDismissible: true, // 바깥 영역 터치시 닫을지 여부
                                      builder: (BuildContext context) {
                                        Future.delayed(
                                          const Duration(seconds: 1),
                                              () {
                                            Navigator.of(context,
                                                rootNavigator: true)
                                                .pop();
                                          },
                                        );
                                        return SubmitErrorDialog();
                                      });
                                } else {
                                  _chooseQuiz();
                                }
                              },
                              child: Text(
                                languageController.takeSub,
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

            //지식지수
            Positioned(
              right: 90.w,
              bottom: 200.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    languageController.intellect,
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
                        value: personalController.intellectScore / 30,
                        // 게이지 바의 값 (0.0에서 1.0 사이)
                        valueColor: const AlwaysStoppedAnimation<Color>(
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
                      color: const Color(0xFF143264),
                      fontSize: 20.sp,
                      fontFamily: 'YourFontFamily',
                    ),
                  ),
                ],
              ),
            ), navigateBar(),
          ],
        ),
      ),
    );
  }
}
