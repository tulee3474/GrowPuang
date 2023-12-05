import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:growpuang/view/widget/mbti/OptionButton.dart';
import '../widget/mbti/CommonAppBar.dart';
import 'FourthPage.dart';
import 'sixthPage.dart';
import 'package:get/get.dart';
import 'package:growpuang/controller/language_controller.dart';
import 'package:growpuang/view/widget/mbti/OptionFunction.dart';

class ThirdPage extends StatelessWidget {
  final languageController = Get.put(LanguageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Stack(
        children: [
          const CommonAppBar(),
          buildTitle(languageController.language == '한국어'
              ? '나는 어떤일을 할 때?'
              : 'When I do something?'),
          OptionButton(
            onTap: () => navigateToPage(context,
              FourthPage(
                question: getQuestionText('내가 실패했을 때 두려운 것은?', 'What do I fear when I fail?'),
                option1: getOptionText('다른 사람의 평판', 'someone else\'s reputation'),
                option2: getOptionText('좌절감', 'frustration'),
              ),
            ),
            topPosition: 570.h,
            buttonText: getButtonText('이 일을 하지 않았을 때\n잃게 될 것들을 떠올린다', 'Think about what you will lose if you don\'t do this.'),
          ),
          OptionButton(
            onTap: () => navigateToPage(context,
              SixthPage(
                question: getQuestionText('내가 실패했을 때 두려운 것은?', 'What do I fear when I fail?'),
                option1: getOptionText('좌절감', 'frustration'),
                option2: getOptionText('다른 사람의 평판', 'someone else\'s reputation'),
              ),
            ),
            topPosition: 740.h,
            buttonText: getButtonText('이 일을 해냈을 때 얻게 될\n보상을 떠올린다', 'Think about the reward you will receive when you accomplish this task.'),
          ),
        ],
      ),
    );
  }
}
