import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:growpuang/view/widget/mbti/MbtiDiamond.dart';
import '../widget/mbti/CommonAppBar.dart';
import '../widget/mbti/FirstAppBar.dart';
import '../widget/mbti/OptionButton.dart';
import '../widget/mbti/OptionFunction.dart';
import 'seventhPage.dart';
import 'eigthPage.dart';
import 'package:get/get.dart';
import 'package:growpuang/controller/language_controller.dart';

class SixthPage extends StatelessWidget {
  final languageController = Get.put(LanguageController());

  final String question;
  final String option1;
  final String option2;

  SixthPage(
      {super.key,
      required this.question,
      required this.option1,
      required this.option2});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Stack(
        children: [
          const CommonAppBar(),
          // 질문 텍스트
          buildTitle(question),
          // 버튼 1 - Option 1
          OptionButton(
            onTap: () => navigateToPage(context,
              SeventhPage(
                question: getQuestionText('더 멋지다고 생각되는 모습은?', 'Which look do you think\nis cooler?'),
                option1: getOptionText('갑작스러운 사고를\n완벽하게 수습하는 나', 'I perfectly handle\nsudden accidents'),
                option2: getOptionText('주어진 일을 완벽하게\n마무리 하는 나', 'I complete the given\ntask perfectly'),
              ),
            ),
            topPosition: 570.h,
            buttonText: option1,
          ),
          // 버튼 2 - Option 2
          OptionButton(
            onTap: () => navigateToPage(context,
              EighthPage(
                question: getQuestionText('더 멋지다고 생각되는 모습은?', 'Which look do you think\nis cooler?'),
                option1: getOptionText('갑작스러운 사고를 완벽하게\n 수습하는 나', 'I perfectly handle\nsudden accidents'),
                option2: getOptionText('주어진 일을 완벽하게\n마무리 하는 나', 'I complete the given\ntask perfectly'),
              ),
            ),
            topPosition: 740.h,
            buttonText: option2,
          ),
        ],
      ),
    );
  }
}
