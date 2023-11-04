import 'package:get/get.dart';

class PersonalController extends GetxController {
  RxString _userId = ''.obs; //user Id 저장

  RxString _mbti = '모범적인'.obs; //mbti 결과 저장

  RxInt _HP = 100.obs; //HP

  RxList<bool> _knowledgeQuizResultList = <bool>[].obs; //전공 퀴즈 결과 저장
  RxList<bool> _activityResultList = <bool>[].obs; //참여 활동 결과 저장
  RxInt _communityResult = 0.obs; //커뮤니티 활동 수

  String get userId => _userId.value;

  set userId(String value) {
    _userId.value = value;
  }

  String get mbti => _mbti.value;

  set mbti(String value) {
    _mbti.value = value;
  }

  int get hp => _HP.value;

  set hp(int value) {
    _HP.value = value;
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
