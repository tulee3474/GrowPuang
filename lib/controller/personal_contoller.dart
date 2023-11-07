import 'package:get/get.dart';

class PersonalController extends GetxController {
  RxString _userId = ''.obs; //user Id 저장

  RxString _option1 = '모범적인'.obs; //mbti 결과 저장
  RxString _option2 = '푸앙이'.obs; //mbti 결과 저장
  RxString _pick_img = '이미지'.obs; //mbti 결과 저장

  RxDouble _progressValue = 0.1.obs; //HP

  RxList<bool> _knowledgeQuizResultList = <bool>[].obs; //전공 퀴즈 결과 저장
  RxList<bool> _activityResultList = <bool>[].obs; //참여 활동 결과 저장
  RxInt _communityResult = 0.obs; //커뮤니티 활동 수

  String get userId => _userId.value;

  set userId(String value) {
    _userId.value = value;
  }

  String get option1 => _option1.value;

  set option1(String value) {
    _option1.value = value;
  }

  String get option2 => _option2.value;

  set option2(String value) {
    _option2.value = value;
  }

  String get pick_img => _pick_img.value;

  set pick_img(String value) {
    _pick_img.value = value;
  }

  double get progressValue => _progressValue.value;

  set progressValue(double value) {
    _progressValue.value = value;
  }

  List<bool> get knowledgeQuizResultList => _knowledgeQuizResultList;

  set knowledgeQuizResultList(List<bool> value) {
    _knowledgeQuizResultList = value.obs;
  }

  List<bool> get activityResultList => _activityResultList;

  set activityResultList(List<bool> value) {
    _activityResultList = value.obs;
  }

  int get communityResult => _communityResult.value;

  set communityResult(int value) {
    _communityResult.value = value;
  }
}
