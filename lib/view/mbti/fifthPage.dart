import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:growpuang/controller/language_controller.dart';
import 'package:growpuang/view/widget/mbti/MbtiDiamond.dart';
import '../widget/mbti/CommonAppBar.dart';
import '../widget/mbti/FirstAppBar.dart';
import '../widget/mbti/OptionFunction.dart';
import 'lastPage.dart';
import 'package:growpuang/view/widget/mbti/OptionButton.dart';

class FifthPage extends StatelessWidget {
  final languageController = Get.put(LanguageController());

  final String question;
  final String option1;
  final String option2;

  FifthPage(
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
                getOptionText('모범적인', 'exemplary'),
                '모범-푸앙.png'
            ),
            topPosition: 570.h,
            buttonText: option1,
          ),
          // 버튼 2 - Option 2
          OptionButton(
            onTap: () => navigateToLastPage(context,
                getOptionText('너드한', 'nerd'),
                '너드한-푸앙.png'
            ),
            topPosition: 740.h,
            buttonText: option2,
          ),
        ],
      ),
    );
  }
}
