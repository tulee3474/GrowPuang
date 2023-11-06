import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

String selectedLanguage = '한국어';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/기본-배경.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Center(
            child: Container(
              width: 318.w,
              height: 350.h,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/자산.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              print('영신관 이미지를 눌렀습니다.');
            },
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: 350.w,
                height: 150.h,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/영신관.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 84.w,
            top: 470.h,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SecondPage(),
                  ),
                );
              },
              child: Align(
                alignment: Alignment.topCenter,
                child: Container(
                  width: 200.w,
                  decoration: const BoxDecoration(
                    color: Colors.transparent,
                    border: null,
                  ),
                  child: Center(
                    child: Text(
                      'Start >',
                      style: TextStyle(
                        color: Color(0xFF143264),
                        fontSize: 35.sp,
                        fontFamily: 'YourFontFamily',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/기본-배경.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Positioned(
            left: 0.w,
            right: 0.w,
            top: 100.h,
            child: Center(
              child: Container(
                width: 318.w,
                height: 350.h,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/자산.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              print('영신관 이미지를 눌렀습니다.');
            },
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: 350.w,
                height: 150.h,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/영신관.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.only(top: 150.h),
              child: Text(
                selectedLanguage == '한국어' ? '어떤 언어로 진행하겠습니까?' : 'Which language would you like to proceed in?',
                style: TextStyle(
                  color: Color(0xFF143264),
                  fontSize: 25.sp,
                  fontFamily: 'YourFontFamily',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Positioned(
            left: 0.0,
            right: 0.0,
            top: 470.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    selectedLanguage = '한국어';
                    print('한국어 선택');
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ThirdPage(),
                      ),
                    );
                  },
                  child: Container(
                    width: 150.w,
                    height: 70.h,
                    decoration: BoxDecoration(
                      color: Color(0xFF143264),
                      borderRadius: BorderRadius.circular(15.w),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: Text(
                          '한국어',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 35.sp,
                            fontFamily: 'YourFontFamily',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 20.w),
                GestureDetector(
                  onTap: () {
                    selectedLanguage = '영어';
                    print('영어 선택');
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ThirdPage(),
                      ),
                    );
                  },
                  child: Container(
                    width: 150.w,
                    height: 70.h,
                    decoration: BoxDecoration(
                      color: Color(0xFF143264),
                      borderRadius: BorderRadius.circular(15.w),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: Text(
                          'English',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 35.sp,
                            fontFamily: 'YourFontFamily',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ThirdPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/기본-배경.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: GestureDetector(
              onTap: () {
                print('영신관 이미지를 눌렀습니다.');
              },
              child: Container(
                width: 350.w,
                height: 150.h,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/영신관.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 0.w,
            right: 0.w,
            top: 100.h,
            child: Center(
              child: Container(
                width: 318.w,
                height: 350.h,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/자산.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.only(top: 150.h),
              child: Text(
                selectedLanguage == '한국어' ? '나는 어떤일을 할 때?' : 'When I do something?',
                style: TextStyle(
                  color: Color(0xFF143264),
                  fontSize: 25.sp,
                  fontFamily: 'YourFontFamily',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Positioned(
            left: 50.w,
            right: 50.w,
            top: 460.h,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FourthPage(
                      question: selectedLanguage == '한국어' ? '내가 실패했을 때 두려운 것은?' : 'What do I fear when I fail?',
                      option1: selectedLanguage == '한국어' ? '다른 사람의 평판' : 'someone else\'s reputation',
                      option2: selectedLanguage == '한국어' ? '좌절감' : 'frustration',
                    ),
                  ),
                );
              },
              child: Container(
                width: double.infinity,
                height: 80.h,
                decoration: BoxDecoration(
                  color: Color(0xFF143264),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      selectedLanguage == '한국어' ? '이 일을 하지 않았을 때 잃게 될 것들을 떠올린다' : 'Think about what you will lose if you don\'t do this.',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.sp,
                        fontFamily: 'YourFontFamily',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 50.w,
            right: 50.w,
            top: 560.h,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SixthPage(
                      question: selectedLanguage == '한국어' ? '내가 실패했을 때 두려운 것은?' : 'What do I fear when I fail?',
                      option2: selectedLanguage == '한국어' ? '다른 사람의 평판' : 'someone else\'s reputation',
                      option1: selectedLanguage == '한국어' ? '좌절감' : 'frustration',
                    ),
                  ),
                );
              },
              child: Container(
                width: double.infinity,
                height: 80.h,
                decoration: BoxDecoration(
                  color: Color(0xFF143264),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      selectedLanguage == '한국어' ? '이 일을 해냈을 때 얻게 될 보상을 떠올린다' : 'Think about the reward you will receive when you accomplish this task.',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.sp,
                        fontFamily: 'YourFontFamily',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FourthPage extends StatelessWidget {
  final String question;
  final String option1;
  final String option2;

  FourthPage({Key? key, required this.question, required this.option1, required this.option2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Stack(
        children: [
          // 반응형 배경 이미지 설정
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/기본-배경.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          // 영신관 이미지 (상단 중앙에 배치)
          Align(
            alignment: Alignment.topCenter,
            child: GestureDetector(
              onTap: () {
                // 영신관 이미지를 누를 때 수행할 작업을 정의하세요.
                print('영신관 이미지를 눌렀습니다.');
                // 여기에서 다음 질문 또는 동작을 정의할 수 있습니다.
              },
              child: Container(
                width: 350.w,
                height: 150.h,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/영신관.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ),
          // 자산 이미지 크기 및 배치 수정
          Positioned(
            left: 0.w,
            right: 0.w,
            top: 100.h, // 더 위로 조정
            child: Center(
              child: Container(
                width: 318.w, // 이미지 너비 조정
                height: 350.h, // 이미지 높이 조정
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/자산.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ),
          // 질문 텍스트
          Center(
            child: Padding(
              padding: EdgeInsets.only(top: 150.h),
              child: Text(
                question,
                style: TextStyle(
                  color: Color(0xFF143264),
                  fontSize: 25.sp,
                  fontFamily: 'YourFontFamily',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          // 버튼 1 - Option 1
          Positioned(
            left: 50.w,
            right: 50.w,
            top: 460.h,
            child: GestureDetector(
              onTap: () {
                // Option 1 버튼을 눌렀을 때 수행할 작업을 정의하세요.
                print('Option 1을 선택했습니다.');
                // 여기에서 다음 질문 또는 동작을 정의할 수 있습니다.
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MBTIPage(
                      question: selectedLanguage == '한국어' ? '당신이 졸업시킬 푸앙이는': 'The Puang you will graduate from is',
                      option1: selectedLanguage == '한국어' ? '호기심 많은' : 'curious',
                      option2: selectedLanguage == '한국어' ? '푸앙이' : 'puang',
                      pick_img : '호기심-푸앙.png',
                    ),
                  ),
                );
              },
              child: Container(
                width: double.infinity,
                height: 80.h,
                decoration: BoxDecoration(
                  color: Color(0xFF143264),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      option1,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.sp,
                        fontFamily: 'YourFontFamily',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          // 버튼 2 - Option 2
          Positioned(
            left: 50.w,
            right: 50.w,
            top: 560.h,
            child: GestureDetector(
              onTap: () {
                // Option 2 버튼을 눌렀을 때 수행할 작업을 정의하세요.
                print('Option 2를 선택했습니다.');

                // 여기에서 다음 질문 또는 동작을 정의할 수 있습니다.
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FifthPage(
                      question: selectedLanguage == '한국어' ? '음악을 들을 때 중요한 것은?': 'What is important when listening to music?',
                      option1: selectedLanguage == '한국어' ? '멜로디' : 'melody',
                      option2: selectedLanguage == '한국어' ? '가사' : 'lyrics',
                    ),
                  ),
                );
              },
              child: Container(
                width: double.infinity,
                height: 80.h,
                decoration: BoxDecoration(
                  color: Color(0xFF143264),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      option2,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.sp,
                        fontFamily: 'YourFontFamily',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FifthPage extends StatelessWidget {
  final String question;
  final String option1;
  final String option2;

  FifthPage({Key? key, required this.question, required this.option1, required this.option2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Stack(
        children: [
          // 반응형 배경 이미지 설정
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/기본-배경.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          // 영신관 이미지 (상단 중앙에 배치)
          Align(
            alignment: Alignment.topCenter,
            child: GestureDetector(
              onTap: () {
                // 영신관 이미지를 누를 때 수행할 작업을 정의하세요.
                print('영신관 이미지를 눌렀습니다.');
                // 여기에서 다음 질문 또는 동작을 정의할 수 있습니다.
              },
              child: Container(
                width: 350.w,
                height: 150.h,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/영신관.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ),
          // 자산 이미지 크기 및 배치 수정
          Positioned(
            left: 0.w,
            right: 0.w,
            top: 100.h, // 더 위로 조정
            child: Center(
              child: Container(
                width: 318.w, // 이미지 너비 조정
                height: 350.h, // 이미지 높이 조정
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/자산.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ),
          // 질문 텍스트
          Center(
            child: Padding(
              padding: EdgeInsets.only(top: 150.h),
              child: Text(
                question,
                style: TextStyle(
                  color: Color(0xFF143264),
                  fontSize: 25.sp,
                  fontFamily: 'YourFontFamily',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          // 버튼 1 - Option 1
          Positioned(
            left: 50.w,
            right: 50.w,
            top: 460.h,
            child: GestureDetector(
              onTap: () {
                // Option 1 버튼을 눌렀을 때 수행할 작업을 정의하세요.
                print('Option 1을 선택했습니다.');
                // 여기에서 다음 질문 또는 동작을 정의할 수 있습니다.
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MBTIPage(
                      question: selectedLanguage == '한국어' ? '당신이 졸업시킬 푸앙이는': 'The Puang you will graduate from is',
                      option1: selectedLanguage == '한국어' ? '모범적인' : 'exemplary',
                      option2: selectedLanguage == '한국어' ? '푸앙이' : 'puang',
                      pick_img: '모범-푸앙.png',
                    ),
                  ),
                );
              },
              child: Container(
                width: double.infinity,
                height: 80.h,
                decoration: BoxDecoration(
                  color: Color(0xFF143264),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      option1,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.sp,
                        fontFamily: 'YourFontFamily',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          // 버튼 2 - Option 2
          Positioned(
            left: 50.w,
            right: 50.w,
            top: 560.h,
            child: GestureDetector(
              onTap: () {
                // Option 2 버튼을 눌렀을 때 수행할 작업을 정의하세요.
                print('Option 2를 선택했습니다.');
                // 여기에서 다음 질문 또는 동작을 정의할 수 있습니다.
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MBTIPage(
                      question: selectedLanguage == '한국어' ? '당신이 졸업시킬 푸앙이는': 'The Puang you will graduate from is',
                      option1: selectedLanguage == '한국어' ? '너드한' : 'nerd',
                      option2: selectedLanguage == '한국어' ? '푸앙이' : 'puang',
                      pick_img: '너드한-푸앙.png',
                    ),
                  ),
                );
              },
              child: Container(
                width: double.infinity,
                height: 80.h,
                decoration: BoxDecoration(
                  color: Color(0xFF143264),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      option2,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.sp,
                        fontFamily: 'YourFontFamily',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SixthPage extends StatelessWidget {
  final String question;
  final String option1;
  final String option2;

  SixthPage({Key? key, required this.question, required this.option1, required this.option2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Stack(
        children: [
          // 반응형 배경 이미지 설정
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/기본-배경.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          // 영신관 이미지 (상단 중앙에 배치)
          Align(
            alignment: Alignment.topCenter,
            child: GestureDetector(
              onTap: () {
                // 영신관 이미지를 누를 때 수행할 작업을 정의하세요.
                print('영신관 이미지를 눌렀습니다.');
                // 여기에서 다음 질문 또는 동작을 정의할 수 있습니다.
              },
              child: Container(
                width: 350.w,
                height: 150.h,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/영신관.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ),
          // 자산 이미지 크기 및 배치 수정
          Positioned(
            left: 0.w,
            right: 0.w,
            top: 100.h, // 더 위로 조정
            child: Center(
              child: Container(
                width: 318.w, // 이미지 너비 조정
                height: 350.h, // 이미지 높이 조정
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/자산.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ),
          // 질문 텍스트
          Center(
            child: Padding(
              padding: EdgeInsets.only(top: 150.h),
              child: Text(
                question,
                style: TextStyle(
                  color: Color(0xFF143264),
                  fontSize: 25.sp,
                  fontFamily: 'YourFontFamily',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          // 버튼 1 - Option 1
          Positioned(
            left: 50.w,
            right: 50.w,
            top: 460.h,
            child: GestureDetector(
              onTap: () {
                // Option 1 버튼을 눌렀을 때 수행할 작업을 정의하세요.
                print('Option 1을 선택했습니다.');
                // 여기에서 다음 질문 또는 동작을 정의할 수 있습니다.
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SeventhPage(
                      question: selectedLanguage == '한국어' ? '더 멋지다고 생각되는 모습은?': 'Which look do you think is cooler?',
                      option1: selectedLanguage == '한국어' ? '갑작스러운 사고를 완벽하게 수습하는 나' : 'I perfectly handle sudden accidents',
                      option2: selectedLanguage == '한국어' ? '주어진 일을 완벽하게 마무리 하는 나' : 'I complete the given task perfectly',
                    ),
                  ),
                );
              },
              child: Container(
                width: double.infinity,
                height: 80.h,
                decoration: BoxDecoration(
                  color: Color(0xFF143264),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      option1,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.sp,
                        fontFamily: 'YourFontFamily',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          // 버튼 2 - Option 2
          Positioned(
            left: 50.w,
            right: 50.w,
            top: 560.h,
            child: GestureDetector(
              onTap: () {
                // Option 2 버튼을 눌렀을 때 수행할 작업을 정의하세요.
                print('Option 2를 선택했습니다.');

                // 여기에서 다음 질문 또는 동작을 정의할 수 있습니다.
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EighthPage(
                      question: selectedLanguage == '한국어' ? '더 멋지다고 생각되는 모습은?': 'Which look do you think is cooler?',
                      option1: selectedLanguage == '한국어' ? '갑작스러운 사고를 완벽하게 수습하는 나' : 'I perfectly handle sudden accidents',
                      option2: selectedLanguage == '한국어' ? '주어진 일을 완벽하게 마무리 하는 나' : 'I complete the given task perfectly',
                    ),
                  ),
                );
              },
              child: Container(
                width: double.infinity,
                height: 80.h,
                decoration: BoxDecoration(
                  color: Color(0xFF143264),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      option2,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.sp,
                        fontFamily: 'YourFontFamily',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class SeventhPage extends StatelessWidget {
  final String question;
  final String option1;
  final String option2;

  SeventhPage({Key? key, required this.question, required this.option1, required this.option2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Stack(
        children: [
          // 반응형 배경 이미지 설정
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/기본-배경.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          // 영신관 이미지 (상단 중앙에 배치)
          Align(
            alignment: Alignment.topCenter,
            child: GestureDetector(
              onTap: () {
                // 영신관 이미지를 누를 때 수행할 작업을 정의하세요.
                print('영신관 이미지를 눌렀습니다.');
                // 여기에서 다음 질문 또는 동작을 정의할 수 있습니다.
              },
              child: Container(
                width: 350.w,
                height: 150.h,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/영신관.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ),
          // 자산 이미지 크기 및 배치 수정
          Positioned(
            left: 0.w,
            right: 0.w,
            top: 100.h, // 더 위로 조정
            child: Center(
              child: Container(
                width: 318.w, // 이미지 너비 조정
                height: 350.h, // 이미지 높이 조정
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/자산.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ),
          // 질문 텍스트
          Center(
            child: Padding(
              padding: EdgeInsets.only(top: 150.h),
              child: Text(
                question,
                style: TextStyle(
                  color: Color(0xFF143264),
                  fontSize: 25.sp,
                  fontFamily: 'YourFontFamily',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          // 버튼 1 - Option 1
          Positioned(
            left: 50.w,
            right: 50.w,
            top: 460.h,
            child: GestureDetector(
              onTap: () {
                // Option 1 버튼을 눌렀을 때 수행할 작업을 정의하세요.
                print('Option 1을 선택했습니다.');
                // 여기에서 다음 질문 또는 동작을 정의할 수 있습니다.
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MBTIPage(
                      question: selectedLanguage == '한국어' ? '당신이 졸업시킬 푸앙이는': 'The Puang you will graduate from is',
                      option1: selectedLanguage == '한국어' ? '활발한' : 'active',
                      option2: selectedLanguage == '한국어' ? '푸앙이' : 'puang',
                      pick_img: '활발한-푸앙.png',
                    ),
                  ),
                );
              },
              child: Container(
                width: double.infinity,
                height: 80.h,
                decoration: BoxDecoration(
                  color: Color(0xFF143264),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      option1,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.sp,
                        fontFamily: 'YourFontFamily',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          // 버튼 2 - Option 2
          Positioned(
            left: 50.w,
            right: 50.w,
            top: 560.h,
            child: GestureDetector(
              onTap: () {
                // Option 2 버튼을 눌렀을 때 수행할 작업을 정의하세요.
                print('Option 2를 선택했습니다.');

                // 여기에서 다음 질문 또는 동작을 정의할 수 있습니다.
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MBTIPage(
                      question: selectedLanguage == '한국어' ? '당신이 졸업시킬 푸앙이는': 'The Puang you will graduate from is',
                      option1: selectedLanguage == '한국어' ? '주도적인' : 'leading',
                      option2: selectedLanguage == '한국어' ? '푸앙이' : 'puang',
                      pick_img: '주도적인-푸앙.png',
                    ),
                  ),
                );
              },
              child: Container(
                width: double.infinity,
                height: 80.h,
                decoration: BoxDecoration(
                  color: Color(0xFF143264),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      option2,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.sp,
                        fontFamily: 'YourFontFamily',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}



class EighthPage extends StatelessWidget {
  final String question;
  final String option1;
  final String option2;

  EighthPage({Key? key, required this.question, required this.option1, required this.option2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Stack(
        children: [
          // 반응형 배경 이미지 설정
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/기본-배경.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          // 영신관 이미지 (상단 중앙에 배치)
          Align(
            alignment: Alignment.topCenter,
            child: GestureDetector(
              onTap: () {
                // 영신관 이미지를 누를 때 수행할 작업을 정의하세요.
                print('영신관 이미지를 눌렀습니다.');
                // 여기에서 다음 질문 또는 동작을 정의할 수 있습니다.
              },
              child: Container(
                width: 350.w,
                height: 150.h,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/영신관.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ),
          // 자산 이미지 크기 및 배치 수정
          Positioned(
            left: 0.w,
            right: 0.w,
            top: 100.h, // 더 위로 조정
            child: Center(
              child: Container(
                width: 318.w, // 이미지 너비 조정
                height: 350.h, // 이미지 높이 조정
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/자산.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ),
          // 질문 텍스트
          Center(
            child: Padding(
              padding: EdgeInsets.only(top: 150.h),
              child: Text(
                question,
                style: TextStyle(
                  color: Color(0xFF143264),
                  fontSize: 25.sp,
                  fontFamily: 'YourFontFamily',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          // 버튼 1 - Option 1
          Positioned(
            left: 50.w,
            right: 50.w,
            top: 460.h,
            child: GestureDetector(
              onTap: () {
                // Option 1 버튼을 눌렀을 때 수행할 작업을 정의하세요.
                print('Option 1을 선택했습니다.');
                // 여기에서 다음 질문 또는 동작을 정의할 수 있습니다.
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MBTIPage(
                      question: selectedLanguage == '한국어' ? '당신이 졸업시킬 푸앙이는': 'The Puang you will graduate from is',
                      option1: selectedLanguage == '한국어' ? '주도적인' : 'leading',
                      option2: selectedLanguage == '한국어' ? '푸앙이' : 'puang',
                      pick_img: '주도적인-푸앙.png',
                    ),
                  ),
                );
              },
              child: Container(
                width: double.infinity,
                height: 80.h,
                decoration: BoxDecoration(
                  color: Color(0xFF143264),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      option1,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.sp,
                        fontFamily: 'YourFontFamily',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          // 버튼 2 - Option 2
          Positioned(
            left: 50.w,
            right: 50.w,
            top: 560.h,
            child: GestureDetector(
              onTap: () {
                // Option 2 버튼을 눌렀을 때 수행할 작업을 정의하세요.
                print('Option 2를 선택했습니다.');

                // 여기에서 다음 질문 또는 동작을 정의할 수 있습니다.
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MBTIPage(
                      question: selectedLanguage == '한국어' ? '당신이 졸업시킬 푸앙이는': 'The Puang you will graduate from is',
                      option1: selectedLanguage == '한국어' ? '지휘적인' : 'commanding',
                      option2: selectedLanguage == '한국어' ? '푸앙이' : 'puang',
                      pick_img: '지적인-푸앙.png',
                    ),
                  ),
                );
              },
              child: Container(
                width: double.infinity,
                height: 80.h,
                decoration: BoxDecoration(
                  color: Color(0xFF143264),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      option2,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.sp,
                        fontFamily: 'YourFontFamily',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}



class MBTIPage extends StatelessWidget {
  final String question;
  final String option1;
  final String option2;
  final String pick_img;

  MBTIPage({Key? key, required this.question, required this.pick_img, required this.option1, required this.option2})
      : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Stack(
        children: [
          // 반응형 배경 이미지 설정
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/기본-배경.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),

          // 영신관 이미지 (상단 중앙에 배치)
          Align(
            alignment: Alignment.topCenter,
            child: GestureDetector(
              onTap: () {
                // 영신관 이미지를 누를 때 수행할 작업을 정의하세요.
                print('영신관 이미지를 눌렀습니다.');
                // 여기에서 다음 질문 또는 동작을 정의할 수 있습니다.
              },
              child: Container(
                width: 350.w,
                height: 150.h,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/영신관.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ),
          // 자산 이미지 크기 및 배치 수정
          Positioned(
            left: 0.w,
            right: 0.w,
            top: 200.h, // 원하는 위치로 조정
            child: Center(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      question,
                      style: TextStyle(
                        color: Color(0xFF143264),
                        fontSize: 25.sp,
                        fontFamily: 'YourFontFamily',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h), // 원하는 여백 크기로 조정
                  Container(
                    width: 170.w, // 이미지 너비 조정
                    height: 220.h, // 이미지 높이 조정
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('images/$pick_img'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),

                  SizedBox(height: 20.h),
                  Text(
                    option1 + ' ' + option2 + (selectedLanguage == '한국어' ? '입니다' : ''),
                    style: TextStyle(
                      color: Color(0xFF143264),
                      fontSize: 25.sp,
                      fontFamily: 'YourFontFamily',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  GestureDetector(
                    onTap: () {

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MainPage(option1: option1, option2: option2,pick_img:pick_img,),
                        ),
                      );
                    },
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        width: 200.w,
                        decoration: const BoxDecoration(
                          color: Colors.transparent,
                          border: null,
                        ),
                        child: Center(
                          child: Text(
                            'Next >',
                            style: TextStyle(
                              color: Color(0xFF143264),
                              fontSize: 30.sp,
                              fontFamily: 'YourFontFamily',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MainPage extends StatelessWidget {
  double progressValue = 0.1; // 10% 예시
  final String option1;
  final String option2;
  final String pick_img;


  MainPage({Key? key, required this.option1, required this.pick_img, required this.option2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Stack(
        children: [
          // 반응형 배경 이미지 설정
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/기본-배경.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          // 영신관 이미지 (상단 중앙에 배치)
          Align(
            alignment: Alignment.topCenter,
            child: GestureDetector(
              onTap: () {
                // 영신관 이미지를 누를 때 수행할 작업을 정의하세요.
                print('영신관 이미지를 눌렀습니다.');
                // 여기에서 다음 질문 또는 동작을 정의할 수 있습니다.
              },
              child: Container(
                width: 350.w,
                height: 150.h,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/영신관.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ),
          // 자산 이미지 크기 및 배치 수정
          Positioned(
            left: 0.w,
            right: 0.w,
            top: 200.h, // 원하는 위치로 조정
            child: Center(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      option1 + ' ' +option2,
                      style: TextStyle(
                        color: Color(0xFF143264),
                        fontSize: 25.sp,
                        fontFamily: 'YourFontFamily',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h), // 원하는 여백 크기로 조정
                  Container(
                    width: 170.w, // 이미지 너비 조정
                    height: 220.h, // 이미지 높이 조정
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('images/$pick_img'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    '',
                    style: TextStyle(
                      color: Color(0xFF143264),
                      fontSize: 25.sp,
                      fontFamily: 'YourFontFamily',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10.h),
                ],
              ),
            ),
          ),
          // 게이지 바 (기본-푸앙이 밑에 배치)
          Positioned(
            left: 20.w,
            right: 20.w,
            top: 500.h, // 기본-푸앙이 밑에 원하는 위치로 조정
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0.w), // 좌우 여백을 조정
              child: Row(
                children: [
                  Text(
                    selectedLanguage=='한국어'?'체력':'HP',
                    style: TextStyle(
                      color: Color(0xFF143264),
                      fontSize: 16.sp,
                      fontFamily: 'YourFontFamily',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 10.w), // 원하는 여백 크기로 조정
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0), // 원하는 라운드값으로 조절
                      child: LinearProgressIndicator(
                        minHeight: 20.0,
                        value: progressValue, // 게이지 바의 값 (0.0에서 1.0 사이)
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.blue), // 게이지 바 색상
                      ),
                    ),
                  ),
                  SizedBox(width: 10.w), // 원하는 여백 크기로 조정
                  Text(
                    '1/10', // 원하는 비율로 변경
                    style: TextStyle(
                      color: Color(0xFF143264),
                      fontSize: 16.sp,
                      fontFamily: 'YourFontFamily',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),

          Positioned(
            left: 20.w,
            right: 20.w,
            bottom: 20.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // 이미지 버튼 1
                InkWell(
                  onTap: () {
                    // 이미지 버튼 1을 탭했을 때 수행할 작업을 정의
                  },
                  child: Container(
                    width: 80.w,
                    height: 80.h,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('images/지식지수.png'),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                // 이미지 버튼 2 (기존 UI 유지)
                InkWell(
                  onTap: () {
                    // 이미지 버튼 2를 탭했을 때 수행할 작업을 정의
                  },
                  child: Container(
                    width: 80.w,
                    height: 80.h,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('images/활동지수.png'),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                // 이미지 버튼 3 (기존 UI 유지)
                InkWell(
                  onTap: () {
                    // 이미지 버튼 3을 탭했을 때 수행할 작업을 정의
                  },
                  child: Container(
                    width: 80.w,
                    height: 80.h,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('images/사교지수.png'),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                // 이미지 버튼 4 (기존 UI 유지)
                InkWell(
                  onTap: () {
                    // 이미지 버튼 4를 탭했을 때 수행할 작업을 정의
                  },
                  child: Container(
                    width: 80.w,//이미지는 나중에 크기 수정하면 됨
                    height: 80.h,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('images/도움말.png'),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
