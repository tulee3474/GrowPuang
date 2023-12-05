import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controller/language_controller.dart';
import '../../../controller/personal_contoller.dart';
import '../../ending/graduated_puang.dart';


class goGradu extends StatelessWidget {
  goGradu({super.key});
  final personalController = Get.put(PersonalController());
  final languageController = Get.put(LanguageController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            Text(
              languageController.askGradu,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text(languageController.answerNo),
                ),
                TextButton(
                  onPressed: () {
                    String endingPuang;
                    var job = '';
                    if(personalController.participateActList.contains(4)){
                      endingPuang = "박사 푸앙";
                      job = languageController.drPuang;
                    } else if(personalController.intellectScore==30){
                      endingPuang = "소프트웨어엔지니어 푸앙";
                      job = languageController.swePuang;
                    } else if(personalController.participateActList.length >=4){
                      endingPuang = "솔루션아키텍트 푸앙";
                      job = languageController.saPuang;
                    } else{
                      endingPuang = "인프라개발자 푸앙";
                      job = languageController.idPuang;
                    }
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => GraduatedPuang(endingPuang: endingPuang, job: job,),
                      ),
                    );
                  },
                  child: Text(languageController.answerYes),
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}