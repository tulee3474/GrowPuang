import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:growpuang/view/mbti/firstPage.dart';
import 'package:growpuang/view/widget/appBar_login.dart';

import '../widget/end_dialog.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  final TextEditingController _emailController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      //뒤로가기 종료 방지
      onWillPop: () async {
        // 뒤로가기를 누르면 팝업이 뜹니다
        bool shouldClose = (await showExitPopup(context)) as bool;
        return shouldClose;
      },
      child: Scaffold(
        appBar: null,
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Container(
              //로그인 화면 이미지
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/로그인화면.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top: 150.h,
              left: 10,
              child: Container(
                //로그인단
                width: 500.w,
                // height: 350.h,
                margin: EdgeInsets.fromLTRB(20.w, 280.h, 20.w, 250.h),
                padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 20.h),
                color: Colors.white.withOpacity(0.5),
                child: Column(
                  children: [
                    Row(
                      children: [
                        //로그인 회원가입 글씨 버튼
                        InkWell(
                            onTap: () {},
                            child: Text(
                              "Sign in",
                              style: TextStyle(
                                //기선택 설정
                                fontSize: 20.sp,
                                color: Color(0xFF314C07),
                                fontFamily: 'YourFontFamily',
                                fontWeight: FontWeight.w300,
                              ),
                            )),
                        SizedBox(
                          width: 10.w,
                        ),
                        InkWell(
                          onTap: () {},
                          child: Text(
                            "Sign up",
                            style: TextStyle(
                              //미선택 설정
                              fontSize: 20.sp,
                              color: Color(0xFFB7B7B7),
                              fontFamily: 'YourFontFamily',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    TextFormField(
                      //이메일
                      controller: _emailController,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        fillColor: Colors.white,
                        filled: true,
                        hintText: "email",
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    TextFormField(
                      //비밀번호
                      controller: _passwordController,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        fillColor: Colors.white,
                        filled: true,
                        hintText: "password",
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    SizedBox(
                      width: 500.w,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const firstPage(
                                      title: 'Flutter Demo Home Page')));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF99C958),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(3)),
                          elevation: 3,
                          shadowColor: Colors.black,
                        ),
                        child: Text(
                          "Sign in",
                          style: TextStyle(
                            fontSize: 20.sp,
                            color: const Color(0xFF314C07),
                            fontFamily: 'YourFontFamily',
                            fontWeight: FontWeight.normal,
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
      ),
    );
  }

  Future<Future> showExitPopup(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return EndDialog();
      },
    );
  }
}
