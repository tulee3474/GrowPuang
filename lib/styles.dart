import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:material_color_generator/material_color_generator.dart';

const mainColor = Color(0xFFABD9FF);
const transparentMainColor = Color(0x4DABD9FF);
const primary1 = Color(0xFFCAEB9C);
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
const mainBackgroundColor = Color(0xFFFFFFFF);
const buttonBackgroundColor = Color(0xFFFFFFFF);
const greyDisabledButtonBackgroundColor = Color(0xFFe9e9e9);
const mainTextColor = Color(0xFF201A19);
const whiteTextColor = Color(0xFFFDF4EA);
const hintTextColor = Color(0xFFB0B0B0);
const transparentHintTextColor = Color(0x2FB0B0B0);
//const feedbackStarColor = Color(0xFFFFD400);

//커뮤니티용 색상들
const communityMainColor = Color(0xFF5A7C33);
const communityTextColor = Color(0xFFB2D87D);
const commmentBackGroundColor = Color(0xFFE5E5E5);
const commmentButtonolor = Color(0xFFCFCFCF);

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

List<Color> buttonColorList = [
  mainBackgroundColor,
  mainBackgroundColor,
  mainBackgroundColor,
  mainBackgroundColor,
];
List<Color> buttonTextColorList = [
  communityTextColor,
  communityTextColor,
  communityTextColor,
  communityTextColor,
];

void switchButtonColor(int index, int type) {
  if (type == 1) {
    buttonColorList[index] = primary1;
  } else if (type == 0) {
    buttonColorList[index] = mainBackgroundColor;
  }
}

void switchButtonTextColor(int index, int type) {
  if (type == 1) {
    buttonTextColorList[index] = communityMainColor;
  } else if (type == 0) {
    buttonTextColorList[index] = communityTextColor;
  }
}
