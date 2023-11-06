import 'package:get/get.dart';

class LanguageController extends GetxController {
  RxString _language = '한국어'.obs; // 한국어 or English

  String get language => _language.value;

  set language(String value) {
    _language.value = value;
  }

  //텍스트는 다 이곳에서 적고 가져가서 사용함.
  //예) languageController.knowledgeQuiz -> 이러면 아래의 get함수를 실행시키는 것임

  String get appBarText => _language.value == '한국어' ? '푸앙이 키우기' : 'Grow Puang';

  String get knowledgeQuiz =>
      _language.value == '한국어' ? '전공 퀴즈' : 'Knowledge Quiz';

  String get activity => _language.value == '한국어' ? '참여 활동' : 'Activity';

  String get community => _language.value == '한국어' ? '사교 공간' : 'Community';

  String get helpDialog => _language.value == '한국어' ? '도움말' : 'Help';
}
