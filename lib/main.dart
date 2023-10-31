import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

// 전역 변수로 선택한 언어 저장
String selectedLanguage = '한국어'; // 기본 언어 설정

class NoTransitionsBuilder extends PageTransitionsBuilder {
  const NoTransitionsBuilder();

  @override
  Widget buildTransitions<T>(
      PageRoute<T> route,
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child,
      ) {
    return child; // 애니메이션을 비활성화하고 페이지 전환을 표시하지 않음
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        pageTransitionsTheme: PageTransitionsTheme(
          builders: {
            for (var platform in TargetPlatform.values)
              platform: NoTransitionsBuilder(),
          },
        ),
      ),
      title: 'Flutter Demo',
      home: const MyHomePage(title: 'Flutter Demo Home Page'),

    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    // 초기화
    ScreenUtil.init(context);

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
          // 나머지 UI 요소 추가 가능
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
          // 영신관 이미지를 버튼으로 사용
          GestureDetector(
            onTap: () {
              // 영신관 이미지를 누를 때 수행할 작업을 정의하세요.
              print('영신관 이미지를 눌렀습니다.');
            },
            child: Align(
              alignment: Alignment.topCenter, // 상단 중앙에 배치
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
          // "Start >" 버튼 추가
          Positioned(
            left: 84.w,
            top: 470.h, // 조절하여 원하는 위치로 배치
            child: GestureDetector(
              onTap: () {
                // "Start >" 버튼을 눌렀을 때 다른 화면으로 이동
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SecondPage(), // SecondPage로 이동
                  ),
                );
              },
              child: Align(
                alignment: Alignment.topCenter, // 상단 중앙에 배치
                child: Container(
                  width: 200.w,
                  decoration: const BoxDecoration(
                  color: Colors.transparent, // 배경이 투명
                  border: null, // 테두리 제거
                ),
                  child: Center(
                    child: Text(
                      'Start >',
                      style: TextStyle(
                        color: Color(0xFF143264), // 글자 색상
                        fontSize: 35.sp, // 글자 크기
                        fontFamily: 'YourFontFamily', // 폰트 변경
                        // 폰트 스타일 변경 (예: fontWeight)
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
          // 나머지 UI 요소 추가 가능
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
          // 영신관 이미지를 버튼으로 사용
          GestureDetector(
            onTap: () {
              // 영신관 이미지를 누를 때 수행할 작업을 정의하세요.
              print('영신관 이미지를 눌렀습니다.');
            },
            child: Align(
              alignment: Alignment.topCenter, // 상단 중앙에 배치
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
          // 언어 선택 버튼 추가
          Positioned(
            left: 0.0, // 좌측 정렬
            right: 0.0, // 우측 정렬
            top: 470.h, // 조절하여 원하는 위치로 배치
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    // 한국어 선택 버튼을 눌렀을 때
                    selectedLanguage = '한국어';
                    print('한국어 선택');
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ThirdPage(), // ThirdPage로 이동
                      ),
                    );
                  },
                  child: Container(
                    width: 150.w, // 배경의 너비를 텍스트보다 크게 조절
                    height: 70.h, // 배경의 높이를 텍스트보다 크게 조절
                    decoration: BoxDecoration(
                      color: Color(0xFF143264), // 배경 색상을 0xFF143264로 설정
                      borderRadius: BorderRadius.circular(15.w), // 더 둥글게 만들기
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5), // 그림자 색상
                          spreadRadius: 2, // 그림자 확산 정도
                          blurRadius: 5, // 그림자 흐림 정도
                          offset: Offset(0, 3), // 그림자 위치 (아래로)
                        ),
                      ],
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(0.0), // 텍스트 주변에 0.0의 여백 추가
                        child: Text(
                          '한국어',
                          style: TextStyle(
                            color: Colors.white, // 글자 색상
                            fontSize: 35.sp, // 글자 크기
                            fontFamily: 'YourFontFamily', // 폰트 변경
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 20.w), // 버튼 사이 간격

                // 영어 선택 버튼
                GestureDetector(
                  onTap: () {
                    // 영어 선택 버튼을 눌렀을 때
                    selectedLanguage = '영어';
                    print('영어 선택');
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ThirdPage(), // ThirdPage로 이동
                      ),
                    );
                  },
                  child: Container(
                    width: 150.w, // 배경의 너비를 텍스트보다 크게 조절
                    height: 70.h, // 배경의 높이를 텍스트보다 크게 조절
                    decoration: BoxDecoration(
                      color: Color(0xFF143264), // 배경 색상을 0xFF143264로 설정
                      borderRadius: BorderRadius.circular(15.w), // 더 둥글게 만들기
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5), // 그림자 색상
                          spreadRadius: 2, // 그림자 확산 정도
                          blurRadius: 5, // 그림자 흐림 정도
                          offset: Offset(0, 3), // 그림자 위치 (아래로)
                        ),
                      ],
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(0.0), // 텍스트 주변에 0.0의 여백 추가
                        child: Text(
                          'English',
                          style: TextStyle(
                            color: Colors.white, // 글자 색상
                            fontSize: 35.sp, // 글자 크기
                            fontFamily: 'YourFontFamily', // 폰트 변경
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
                decoration: BoxDecoration(
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
          // "나는 어떤 일을 할 때" 텍스트
          Center(
            child: Padding(
              padding: EdgeInsets.only(top: 150.h),
              child: Text(
                selectedLanguage == '한국어' ? '나는 어떤 일을 할 때' : 'When I am about to',
                style: TextStyle(
                  color: Color(0xFF143264),
                  fontSize: 25.sp,
                  fontFamily: 'YourFontFamily',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          // 버튼 1 - "이 일을 하지 않았을 때 잃게 될 것들을 떠올린다"
          Positioned(
            left: 50.w,
            right: 50.w,
            top: 460.h,
            child: GestureDetector(
              onTap: () {
                // 버튼 1을 누를 때 수행할 작업을 정의하세요.
                print('버튼 1을 눌렀습니다.');
                // 여기에서 다음 질문 또는 동작을 정의할 수 있습니다.
              },
              child: Container(
                width: double.infinity,
                height: 80.h,
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
                    padding: const EdgeInsets.symmetric(horizontal: 16.0), // 좌우 여백 추가
                    child: Text(
                      selectedLanguage == '한국어'
                          ? '이 일을 하지 않았을 때 잃게 될 것들을 떠올린다'
                          : 'Think about what you might lose if you don’t do this',
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
          // 버튼 2 - "이 일을 해냈을 때 얻게 될 보상을 떠올린다"
          Positioned(
            left: 50.w,
            right: 50.w,
            top: 560.h,
            child: GestureDetector(
              onTap: () {
                // 버튼 2를 누를 때 수행할 작업을 정의하세요.
                print('버튼 2를 눌렀습니다.');
                // 여기에서 다음 질문 또는 동작을 정의할 수 있습니다.
              },
              child: Container(
                width: double.infinity,
                height: 80.h,
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
                    padding: const EdgeInsets.symmetric(horizontal: 16.0), // 좌우 여백 추가
                    child: Text(
                      selectedLanguage == '한국어'
                          ? '이 일을 해냈을 때 얻게 될 보상을 떠올린다'
                          : 'Think about what you will gain when you do this',
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
