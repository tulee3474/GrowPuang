import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:growpuang/view/widget/appBar.dart';
import 'package:get/get.dart';
import 'package:growpuang/view/widget/navigateBar.dart';
import '../../controller/language_controller.dart';
import '../../controller/personal_contoller.dart';
import '../../mainPage.dart';
import '../widget/quiz_dialog.dart';
import '../widget/quiz_error_dialog.dart';

class QuizPagePl extends StatefulWidget {
  final personalController = Get.put(PersonalController());
  final languageController = Get.put(LanguageController());

  @override
  _QuizPagePlState createState() => _QuizPagePlState();
}

class _QuizPagePlState extends State<QuizPagePl> {
  String? selectedAnswer = null;
  late int addScore;
  late List<Map<String, Object>> questions = [
    {
      'questionText': widget.languageController.plQuiz,
      'answers': [
        {'text': widget.languageController.plQuizList[0], 'score': 5},
        {'text': widget.languageController.plQuizList[1], 'score': 0},
        {'text': widget.languageController.plQuizList[2], 'score': 0},
      ],
    },
    // 다른 퀴즈들 추가 가능
  ];

  int _questionIndex = 0;

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
              height: 400.h,
              color: Colors.white.withOpacity(0.5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      questions[_questionIndex]['questionText'] as String,
                      style: TextStyle(
                          fontSize: 20.sp,
                          color: Color(0xFF143264),
                          fontWeight: FontWeight.w700),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  ...List.generate(
                    (questions[_questionIndex]['answers']
                            as List<Map<String, Object>>)
                        .length,
                    (index) {
                      final answer = (questions[_questionIndex]['answers']
                          as List<Map<String, Object>>)[index];
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedAnswer = answer['text'] as String;
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.all(10.0),
                          margin: EdgeInsets.symmetric(
                              vertical: 5.h, horizontal: 10.h),
                          color: selectedAnswer == answer['text']
                              ? Color(0xFF143264)
                              : Colors.white,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(width: 10.0),
                              Text(
                                answer['text'] as String,
                                style: TextStyle(
                                    fontSize: 18.sp,
                                    color: selectedAnswer == answer['text']
                                        ? Colors.white
                                        : Color(0xFF143264)),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          if (selectedAnswer == null) {
                            showDialog(
                                context: context,
                                barrierDismissible: true, // 바깥 영역 터치시 닫을지 여부
                                builder: (BuildContext context) {
                                  Future.delayed(
                                    Duration(seconds: 1),
                                    () {
                                      Navigator.of(context, rootNavigator: true)
                                          .pop();
                                    },
                                  );
                                  return QuizErrorDialog();
                                });
                          } else {
                            widget.personalController.solveQuizList
                                .add(4); //문제를 제출하는 순간 푼 문제 목록에 들어간다
                            if (selectedAnswer ==
                                widget.languageController.plQuizList[2]) {
                              addScore = 5;
                              widget.personalController.intellectScore +=
                                  addScore;
                            } else {
                              addScore = 0;
                            }

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MainPage(),
                              ),
                            );
                            showDialog(
                                context: context,
                                barrierDismissible: true,
                                // 바깥 영역 터치시 닫을지 여부
                                builder: (BuildContext context) {
                                  Future.delayed(
                                    const Duration(seconds: 2),
                                        () {
                                      Navigator.of(context,
                                          rootNavigator: true)
                                          .pop();
                                    },
                                  );
                                  return QuizDialog(addScore: addScore,);
                                });
                          }
                        },
                        child: Text(
                          widget.languageController.submit,
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
          navigateBar(),
        ],
      ),
    );
  }
}
