import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:growpuang/controller/language_controller.dart';
import 'package:growpuang/view/widget/mbti/MbtiDiamond.dart';
import '../widget/mbti/CommonAppBar.dart';
import '../widget/mbti/FirstAppBar.dart';
import '../widget/mbti/OptionFunction.dart';
import 'fifthPage.dart';
import 'lastPage.dart';
import 'package:growpuang/view/widget/mbti/OptionButton.dart';

class FourthPage extends StatelessWidget {
  final languageController = Get.put(LanguageController());

  final String question;
  final String option1;
  final String option2;

  FourthPage(
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
            onTap: () => navigateToLastPage(context,
                getOptionText('호기심 많은', 'curious'),
                '호기심-푸앙.png'
            ),
            topPosition: 570.h,
            buttonText: option1,
          ),
          // 버튼 2 - Option 2
          OptionButton(
            onTap: () => navigateToPage(context,
              FifthPage(
                question: getQuestionText('음악을 들을 때 중요한 것은?', 'What is important when listening to music?'),
                option1: getOptionText('멜로디', 'melody'),
                option2: getOptionText('가사', 'lyrics'),
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
