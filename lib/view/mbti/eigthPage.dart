import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widget/mbti/CommonAppBar.dart';
import '../widget/mbti/FirstAppBar.dart';
import '../widget/mbti/OptionButton.dart';
import '../widget/mbti/OptionFunction.dart';
import 'package:get/get.dart';
import 'package:growpuang/controller/language_controller.dart';

class EighthPage extends StatelessWidget {
  final languageController = Get.put(LanguageController());

  final String question;
  final String option1;
  final String option2;

  EighthPage(
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
                getOptionText('주도적인', 'leading'),
                '주도적인-푸앙.png'
            ),
            topPosition: 570.h,
            buttonText: option1,
          ),
          OptionButton(
            onTap: () => navigateToLastPage(context,
                getOptionText('지적인', 'commanding'),
                '지적인-푸앙.png'
            ),
            topPosition: 740.h,
            buttonText: option2,
          ),
        ],
      ),
    );
  }
}
