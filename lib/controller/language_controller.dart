import 'package:get/get.dart';
import 'package:growpuang/controller/personal_contoller.dart';

class LanguageController extends GetxController {
  final personalController = Get.put(PersonalController());

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

  String get infraDevelopment =>
      _language.value == '한국어' ? '인프라 개발자 푸앙' : 'Infra Developer Puang';

  String get gradDialog => _language.value == '한국어'
      ? personalController.option1 +
          " " +
          personalController.option2 +
          "의\n활동 내역입니다"
      : "Examine graduation of " +
          personalController.option1 +
          " " +
          personalController.option2 +
          "\'s graduation";
  String get activity => _language.value == '한국어' ? '활동지수' : 'Activity';
  String get intellect => _language.value == '한국어' ? '지식지수' : 'Intellect';
  String get community => _language.value == '한국어' ? '자소서 게시판' : 'CV board';
  String get endMsg => _language.value == '한국어' ? '게임을 종료하시겠습니까?' : 'Do you want to exit?';

  // 졸업 다이어로그
  String get cv => _language.value == '한국어' ? "자기소개서 작성" : "Write CV";
  String get done => _language.value == '한국어' ? "완료" : "Completion";
  String get notDone => _language.value == '한국어' ? "미완료" : "Not Completion";
  String get askGradu => _language.value == '한국어'
      ? '졸업 심사를 진행하시겠습니까?'
      : 'Proceed examine of graduation?';
  String get alertGradu =>
      _language.value == '한국어' ? '전공과목을 미이수하였습니다' : 'Didn\'t take major course';
  String get alert2Gradu =>
      _language.value == '한국어' ? '자기소개서를 작성하지 않았습니다' : 'Didn\'t write CV ';
  String get answerNo => _language.value == '한국어' ? '아니오' : 'NO';
  String get answerYes => _language.value == '한국어' ? '네' : 'YES';
  String get helpDialog => _language.value == '한국어' ? '도움말' : 'Help';

  String get goHome => _language.value == '한국어' ? '홈으로' : 'Home';
  String get takeSub => _language.value == '한국어' ? '수강하기 >' : 'take >';
  String get submit => _language.value == '한국어' ? '제출하기 >' : 'submit >';

  //엔딩화면
  String get ending => _language.value == '한국어'
      ? personalController.option1 +
          " " +
          personalController.option2 +
          "의\n 졸업을 축하합니다!"
      : 'Congratulation graduate of ' +
          personalController.option1 +
          " " +
          personalController.option2;
  String get drPuang => _language.value == '한국어' ? '박사 푸앙' : 'Dr.Puang';
  String get swePuang =>
      _language.value == '한국어' ? '소프트웨어엔지니어 푸앙' : 'Software Engineer Puang';
  String get saPuang =>
      _language.value == '한국어' ? '솔루션아키텍트 푸앙' : 'Solution Architect Puang';
  String get idPuang =>
      _language.value == '한국어' ? '인프라개발자 푸앙' : 'Infrastructure Engineer Puang';
  String get restart => _language.value == '한국어' ? '다시하기' : 'Again';

  //활동
  List<String> get activityList => _language.value == '한국어'
      ? ['채용설명회', '홈커밍데이', '교내공모전', '면접특강', '학부연구생', '인턴']
      : [
          'Employment Briefing',
          'Homecoming Day',
          'In school Contest',
          'Interview Special Lecture',
          'Undergraduate Research Student',
          'Intern'
        ];
  String get activityError =>
      _language.value == '한국어' ? '활동을 선택해주세요' : 'choose activity';
  String get takePart => _language.value == '한국어' ? '참여하기 >' : 'take >';
  String get hpAfterAct =>
      _language.value == '한국어' ? '활동 후 체력' : 'HP after act';
  String get completeAct =>
      _language.value == '한국어' ? '활동에 참여하셨습니다' : 'Complete Activities';
  String get restHP => _language.value == '한국어' ? '남은 체력 ' : 'the rest of HP ';

  // 전공퀴즈
  List<String> get quizList => _language.value == '한국어'
      ? ['자료구조', '알고리즘', '소프트웨어공학', '운영체제', '프로그래밍언어론', '컴퓨터구조']
      : [
          'Data structure',
          'Algorithm',
          'SW engineering',
          'OS',
          'Programming language theory',
          'Computer structure'
        ];
  String get quizInfo =>
      _language.value == "한국어" ? "수강할 과목을 골라주세요" : "Choose a subject to take";
  String get answerInfo =>
      _language.value == "한국어" ? "정답을 골라주세요" : "Choose answer";
  //퀴즈
  String get dsQuiz => _language.value == '한국어'
      ? '다음 중 사용자 정의\n 자료구조가 아닌 것은?'
      : 'Which of the following is not a custom data structure?';
  List<String> get dsQuizList => _language.value == '한국어'
      ? ['리스트', '스택', '구조체']
      : ['list', 'stack', 'structure'];
  String get algoQuiz => _language.value =='한국어'
      ? '다음 중 맨 앞이나 맨 뒤부터 순서대로\n하나하나 짚어보는 알고리즘은?'
      : 'which algorithm starts at one end and goes through each element of a list until the desired element is found?';
  List<String> get algoQuizList => _language.value == '한국어'
      ? ['선형탐색', '이진탐색', '해시탐색']
      : ['Linear search', 'Binary search', 'Hash search'];
  String get sweQuiz => _language.value == '한국어'
      ? '컴퓨터 네트워크에서 IP 주소를\n동적으로 할당하기 위한 프로토콜은?'
      : 'What is the protocol for dynamically allocating IP addresses in a computer network?';
  List<String> get sweQuizList => _language.value == '한국어'
      ? ['DNS', 'DHCP', 'HTTP']
      : ['DNS', 'DHCP', 'HTTP'];
  String get osQuiz => _language.value == '한국어'
      ? '다중 프로그래밍 환경에서 CPU가 여러 프로세스를 번갈아가며 실행하는 방식은?'
      : 'In a multi-programming environment, how does the CPU run multiple processes alternately?';
  List<String> get osQuizList => _language.value == '한국어'
      ? ['멀티태스킹', '멀티프로세싱', '시분할 시스템']
      : ['Multi Tasking', 'Multi Processing', 'Time-sharing'];
  String get plQuiz => _language.value == '한국어'
      ? '프로그래밍 언어의 주요 목적은?'
      : 'What is the primary purpose of a programming language?';
  List<String> get plQuizList => _language.value == '한국어'
      ? ['에세이 작성', '그래프 제작', '컴퓨터와 소통']
      : [
          'To write essays',
          'To create beautiful graphics',
          'To communicate with computers'
        ];
  String get csQuiz => _language.value == '한국어'
      ? 'CPU는 무엇의 약자인가?'
      : 'What does the acronym\n"CPU" stand for?';
  List<String> get csQuizList => _language.value == '한국어'
      ? [
          'Central Processing Unit',
          'Computer Processing Unit',
          'Central Programming Unit'
        ]
      : [
          'Central Processing Unit',
          'Computer Processing Unit',
          'Central Programming Unit'
        ];

  String get correct => _language.value == '한국어' ? '정답입니다!' : 'Correct!';
  String get incorrect => _language.value == '한국어' ? '오답입니다' : 'Incorrect';
  String get nowScore => _language.value == '한국어' ? '현재 점수' : 'Total Score';
  String get submitError =>
      _language.value == '한국어' ? '과목을 선택해주세요' : 'choose subject';

  //활동
  String get actInfo => _language.value == '한국어'
      ? '참여하고 싶은 활동을 골라주세요'
      : 'Choose an activity';

  String get loadingMessage =>
      _language.value == '한국어' ? "정보를 로딩 중..." : 'Loading...';

  //커뮤니티
  String get communityAppBarText =>
      _language.value == '한국어' ? '자소서 커뮤니티' : 'Resume Community';

  String communityAppBarSubText(int n) => _language.value == '한국어'
      ? '작성한 게시글 : $n개                      졸업 요건 : 게시글 1개'
      : 'Posts you created : $n         Requirements: 1 Post';

  String get postSortOpt0 => _language.value == '한국어' ? '전체글' : 'All Posts';

  String get anonymousAuthor =>
      _language.value == '한국어' ? '익명의 글쓴이' : 'Anonymous Author';

  String get anonymous => _language.value == '한국어' ? '익명' : 'Anonymous';

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

  String get communityWrittenPostRefresh =>
      _language.value == '한국어' ? '새로고침' : 'Refresh';

  String get communityWrittenPostReport =>
      _language.value == '한국어' ? '신고' : 'Report';

  String get communityWrittenPostEdit =>
      _language.value == '한국어' ? '수정' : 'Edit';

  String get communityWrittenPostDelete =>
      _language.value == '한국어' ? '삭제' : 'Delete';

  String get communityCommentRegistration =>
      _language.value == '한국어' ? '등록' : 'Registration';

  String get communityAlreadyLikedMessage => _language.value == '한국어'
      ? '이미 좋아요를 누르셨습니다!'
      : 'You have already recommended this post!';

  String get commentPlaceholder =>
      _language.value == '한국어' ? '댓글을 남겨보세요' : 'Type your comment';

  String get reportCompletedMessage =>
      _language.value == '한국어' ? '신고가 완료되었습니다.' : 'Report has been completed.';

  String get incompleteFieldsMessage => _language.value == '한국어'
      ? '아직 작성하지 못한 항목이 있습니다.'
      : 'There are still unwritten items.';

  String get postReport => _language.value == '한국어' ? '게시글 신고' : 'Report Post';

  String get reportReasonPlaceholder => _language.value == '한국어'
      ? '신고 사유를 적어주세요.(최대 3줄)'
      : 'Please write the reason for reporting (up to 3 lines)';

  String get postEdit => _language.value == '한국어' ? '게시글 수정' : 'Edit Post';

  String get postEditContentPlaceholder => _language.value == '한국어'
      ? '게시글 내용을 적어주세요.'
      : 'Please write the content of the post.';

  String get postEditCompletedMessage =>
      _language.value == '한국어' ? '수정 완료' : 'Edit Completed';

  String get postDelete => _language.value == '한국어' ? '게시글 삭제' : 'Delete Post';

  String get postDeleteConfirmation => _language.value == '한국어'
      ? '정말 삭제하시겠습니까??'
      : 'Are you sure you want to delete?';

  String get postTitleLabel => _language.value == '한국어' ? '제목 : ' : 'Title: ';

  String get cancel => _language.value == '한국어' ? '취소' : 'Cancel';

  String get commentDelete =>
      _language.value == '한국어' ? '댓글 삭제' : 'Delete Comment';

  //도움말
  String get helpTitle =>
      _language.value == '한국어' ? '푸앙이를 무사히 졸업시켜주세요!' : 'Make Puang graduate!';
  String get totalInfo => _language.value == '한국어'
      ? '적절한 활동을 통해 푸앙이를 졸업시키는 게임입니다.\n졸업요건을 모두 완료해야 졸업이 가능하며 수행 활동에 따라 진로가 결정됩니다.'
      : 'It\'s a game that get graduate Puang by doing activities. Graduation is possible only after completing all the graduation requirements, and the career path is determined according to the game play.';
  String get forGradu =>
      _language.value == '한국어' ? '졸업요건' : 'Graduation requirements';
  String get requirements => _language.value == '한국어'
      ? '- 전공퀴즈 6개 모두 이수\n- 커뮤니티에 게시글 1개 이상 작성'
      : '- Complete all 6 major quizzes\n- Write at least one post in the community';
  String get intellectDes => _language.value == '한국어'
      ? '모든 퀴즈를 풀어야하며, 정답을 맞추면 5점씩 지식지수가 증가합니다'
      : 'You have to solve all the quizzes. If you get the correct answer, your knowledge score increases by 5 points';
  String get actDes => _language.value == '한국어'
      ? '원하는 활동에 참여할 수 있습니다. 활동에 참여 시 체력이 5씩 소진됩니다.'
      : 'You can participate in any activity you want. When you participate in the activity, your HP is exhausted by 5.';
  String get cvDes => _language.value == '한국어'
      ? '자기 소개서를 공유하는 익명 커뮤니티입니다. 졸업을 위해서는 게시글을 반드시 한 개 이상 작성해야 합니다'
      : 'It\'s an anonymous community that shares a cover letter. You must fill out at least one to graduate';
  String get young => _language.value == '한국어' ? '영신관' : 'The Youngshin Hall';
  String get close => _language.value == '한국어' ? '닫기' : 'close';
  String get youngDes => _language.value == '한국어'
      ? '푸앙이의 졸업요건을 확인하고 졸업여부를 결정해줍니다'
      : 'Check Puang\'s graduation requirements and decide whether to graduate or not';
}
