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
  QuizPageMain({super.key});

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

  int _quizIndex = 0;
  int selectedIndex = 7;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Stack(
        children: [
          appBar(),
          Center(
            child: Container(
              width: 500.w,
              height: 380.h,
              // margin: EdgeInsets.fromLTRB(20.w, 280.h, 20.w, 250.h),
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              color: Colors.white.withOpacity(0.5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    //임시버튼. 누르면 전공 한번에 이수
                    onPressed: () {
                      personalController.solveQuizList = [0, 1, 2, 3, 4, 5];
                    },
                    child: Text(
                      lectures[_quizIndex]['questionText'] as String,
                      // questions[_questionIndex]['questionText'] as String,
                      style: TextStyle(
                        fontSize: 25.sp,
                        color: Color(0xFF143264),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  GridView.count(
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    childAspectRatio: 3 / 1,
                    //item 의 가로 1, 세로 2 의 비율
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
                        if (personalController.solveQuizList.contains(index)) {
                          return Container(
                            alignment: Alignment.center,
                            color: Colors.white.withOpacity(0.5),
                            child: Container(
                              width: 150.w,
                              child: Text(
                                answer['text'] as String,
                                style: TextStyle(
                                  fontSize: 18.sp,
                                  color: Colors.black26,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          );
                        } else {
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
                                  ? Color(0xFF143264)
                                  : Colors.white,
                              child: Container(
                                width: 150.w,
                                child: Text(
                                  answer['text'] as String,
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                    color: selectedQuiz == answer['text']
                                        ? Colors.white
                                        : Color(0xFF143264),
                                    fontFamily: 'YourFontFamily',
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
                          "< " + languageController.goHome,
                          style: TextStyle(
                            color: Color(0xFF143264),
                            fontSize: 20.sp,
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
                                    Duration(seconds: 1),
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
                            color: Color(0xFF143264),
                            fontSize: 20.sp,
                            fontFamily: 'YourFontFamily',
                          ),
                        ),
                      ),
                    ],
                  ),
                  ],
              ),
            ),
          ),
          //*******임시버튼************//
          Positioned(
            top: 700.h,
            child: Row(
              children: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      personalController.intellectScore = 30;
                    });
                  },
                  child: Text("30점되는 임시버튼"),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      personalController.communityResult = 1;
                    });
                  },
                  child: Text("자소서쓰는 임시버튼"),
                ),
              ],
            ),
          ),
          //***************************************//

          navigateBar(),
        ],
      ),
    );
  }
}
