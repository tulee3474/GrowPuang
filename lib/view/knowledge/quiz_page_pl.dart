import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:growpuang/view/widget/appBar.dart';
import 'package:get/get.dart';
import '../../controller/language_controller.dart';
import '../../controller/personal_contoller.dart';
import '../widget/quiz_dialog.dart';

class QuizPagePl extends StatefulWidget {
  final personalController = Get.put(PersonalController());
  final languageController = Get.put(LanguageController());

  @override
  _QuizPagePlState createState() => _QuizPagePlState();
}

class _QuizPagePlState extends State<QuizPagePl> {
  String? selectedAnswer;
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

  void _nextQuestion() {
    setState(() {
      showDialog(
          context: context,
          barrierDismissible: false, // 바깥 영역 터치시 닫을지 여부
          builder: (BuildContext context) {
            return QuizDialog(addScore: addScore,);
          });
      selectedAnswer = null;
    });
  }

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
              height: 350.h,
              color: Colors.white.withOpacity(0.5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      questions[_questionIndex]['questionText'] as String,
                      style: TextStyle(fontSize: 20.0), textAlign: TextAlign.center,
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
                          margin: EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.h),
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
                                  fontSize: 18.0,
                                  color: selectedAnswer == answer['text']
                                      ? Colors.white
                                      : Colors.black,
                                ),
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
                          widget.personalController.solveQuizList.add(4);
                          print('Selected Answer: $selectedAnswer');
                          if(selectedAnswer == widget.languageController.plQuizList[2]){
                            addScore = 5;
                            widget.personalController.intellectScore += addScore;
                          }else{
                            addScore = 0;
                          }
                          _nextQuestion();
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
        ],
      ),
    );
  }
}
