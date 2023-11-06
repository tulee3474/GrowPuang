import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:material_color_generator/material_color_generator.dart';

const mainColor = Color(0xFFABD9FF);
const transparentMainColor = Color(0x4DABD9FF);
const primary1 = Color(0xFFC3F8FF);
const primary2 = Color(0xFFFFF6BF);
const primary3 = Color(0xFFFFEBAD);
const primary4 = Color(0xFFF48484);
const primary5 = Color(0xFFffe5dd);
const primary6 = Color(0xFFddffe5);
const primary7 = Color(0xFFddffff);
const primary8 = Color(0xFFddeeff);
const mainBold = Color(0xFF59AEF3);
const transparentMainBold = Color(0x4D59AEF3);
const primaryBold1 = Color(0xFF5FDDEE);
const primaryBold2 = Color(0xFFFFE752);
const primaryBold3 = Color(0xFFFFD246);
const primaryBold4 = Color(0xFFF55050);
const primaryBold5 = Color(0xFFffdddd);
const primaryBold6 = Color(0xFFcceed4);
const primaryBold7 = Color(0xFFcceeee);
const primaryBold8 = Color(0xFFccccee);
const mainBackgroundColor = Color(0xFFF5FAFD);
const buttonBackgroundColor = Color(0xFFFFFFFF);
const greyDisabledButtonBackgroundColor = Color(0xFFe9e9e9);
const buttonBorderColor = Color(0xFFD9D9D9);
const mainTextColor = Color(0xFF201A19);
const whiteTextColor = Color(0xFFFDF4EA);
const hintTextColor = Color(0xFFB0B0B0);
const transparentHintTextColor = Color(0x2FB0B0B0);
//const feedbackStarColor = Color(0xFFFFD400);

//이태운 추가 - Event의 category에 따라 color를 다르게 가져가기 위한 배열(0~9)
//타임테이블 색상 수정을 여기서 하는 것임!!
//0: 파베 데이터셋 관광지, 1: 식당 추천 + 추천받은 식당, 2: 이동, 3: 카페 추천, 4: 숙소 추천, 5: 필수 여행지
List<Color> categoryColorList = [
  primary1,
  primary2,
  Colors.grey,
  primary5,
  primary6,
  primary4,
  primary3,
  primary7,
  primary8,
  mainColor
];

TextTheme lightTextTheme = const TextTheme(
  headlineMedium: TextStyle(
      fontSize: 28.0, fontWeight: FontWeight.w800, color: mainTextColor),
  titleLarge: TextStyle(
      fontSize: 22.0, fontWeight: FontWeight.w700, color: mainTextColor),
  titleMedium: TextStyle(
      fontSize: 16.0, fontWeight: FontWeight.w700, color: mainTextColor),
  titleSmall: TextStyle(
      fontSize: 14.0, fontWeight: FontWeight.w700, color: mainTextColor),
  bodyLarge: TextStyle(
      fontSize: 16.0, fontWeight: FontWeight.w400, color: mainTextColor),
  bodyMedium: TextStyle(
      fontSize: 14.0, fontWeight: FontWeight.w400, color: mainTextColor),
  bodySmall: TextStyle(
      fontSize: 12.0, fontWeight: FontWeight.w400, color: mainTextColor),
);

ThemeData lightColorTheme = ThemeData(
  primaryColor: mainBold,
  useMaterial3: true,
  fontFamily: 'NanumSquareNeo',
  brightness: Brightness.light,
  textTheme: lightTextTheme,
  backgroundColor: mainBackgroundColor,
  bottomAppBarColor: mainBackgroundColor,
  scaffoldBackgroundColor: mainBackgroundColor,
  primarySwatch: generateMaterialColor(color: mainColor),
  appBarTheme: const AppBarTheme(
    color: mainBackgroundColor,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
    ),
  ),
);
