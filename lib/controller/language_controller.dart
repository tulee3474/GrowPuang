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

  String get loadingMessage =>
      _language.value == '한국어' ? "정보를 로딩 중..." : 'Loading...';

  //커뮤니티
  String get communityAppBarText =>
      _language.value == '한국어' ? '자소서 커뮤니티' : 'Resume Community';

  String communityAppBarSubText(int n) => _language.value == '한국어'
      ? '작성한 게시글 : $n개                  졸업 요건 : 게시글 1개'
      : 'Posts you created : $n       Requirements: 1 Post';

  String get postSortOpt0 => _language.value == '한국어' ? '전체글' : 'All Posts';

  String get postSortOpt1 =>
      _language.value == '한국어' ? '지원 동기' : 'Reason for application';

  String get postSortOpt2 =>
      _language.value == '한국어' ? '성격의 장단점' : 'Pros and cons of personality';

  String get postSortOpt3 =>
      _language.value == '한국어' ? '위기극복사례' : 'Case of overcoming crisis';

  String get communityNewPostAppBarText =>
      _language.value == '한국어' ? '글쓰기' : 'Writting New Post';

  String get communityNewPostCompanyName =>
      _language.value == '한국어' ? '기업명' : 'Company Name';

  String get communityNewPostCompanyExample => _language.value == '한국어'
      ? '(ex:대기업, 스타트업)'
      : '(ex:Large Company, Startup)';

  String get communityNewPostJobTitle =>
      _language.value == '한국어' ? '직무' : 'Job Title';

  String get communityNewPostJobTitleExample =>
      _language.value == '한국어' ? '(ex:프론트엔드, 백엔드)' : '(ex:Frontend, Backend)';

  String get communityNewPostContent =>
      _language.value == '한국어' ? '내용 작성' : 'Writing New Post';

  String get communityNewPostRegister =>
      _language.value == '한국어' ? '등록' : 'Register';
}
