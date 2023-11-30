import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PuangHistory extends StatelessWidget {
  PuangHistory({super.key,required this.puangType, required this.puangsJob});
  final String puangType; //푸앙이 유형
  final String puangsJob; //푸앙이 진로
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          // padding: EdgeInsets.fromLTRB(10.w, 15.h, 10.w, 0.0),
          child: Container(
            padding: EdgeInsets.fromLTRB(5.w, 10.h, 5.w, 0.0),
            color: Colors.white.withOpacity(0.8),
            height: 95.h,
            width: 100.h,
            child: Image.asset(
              'assets/images/' + puangType + '-푸앙.png',
              fit: BoxFit.fitWidth,
              alignment: Alignment.topCenter,
            ),
          ),
        ),
        Container(
            height: 40.h,
            child: Text(puangsJob,textAlign: TextAlign.center,)),
      ],
    );
  }
}
