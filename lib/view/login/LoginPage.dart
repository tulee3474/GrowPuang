import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:growpuang/controller/personal_contoller.dart';
import 'package:growpuang/view/mbti/FirstPage.dart';
import 'package:growpuang/view/login/SignUpPage.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:growpuang/model/firebase_read_write.dart';

import '../widget/login/LoginPageWidget.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final personalController = Get.put(PersonalController());
  bool saving = false;
  final _authentication = FirebaseAuth.instance;
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: saving,
      child: Scaffold(
        appBar: null,
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            buildBackgroundImage(210.h),
            _buildLoginForm(),
          ],
        ),
      ),
    );
  }

  Widget _buildLoginForm() {
    return Container(
      margin: EdgeInsets.fromLTRB(20.w, 380.h, 20.w, 210.h),
      padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 20.h),
      color: Colors.white.withOpacity(0.5),
      child: Column(
        children: [
          _buildToggleButtons(),
          SizedBox(height: 20.h),
          _buildEmailTextField(),
          SizedBox(height: 20.h),
          _buildPasswordTextField(),
          SizedBox(height: 20.h),
          _buildLogInButton(),
        ],
      ),
    );
  }

  Widget _buildToggleButtons() {
    return Row(
      children: [
        _buildToggleText("Log In", FontWeight.w300, Color(0xFF314C07), () {}),
        SizedBox(width: 10.w),
        _buildToggleText("Sign up", FontWeight.w700, Color(0xFFB7B7B7), () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const SignUpPage(),
            ),
          );
        }),
      ],
    );
  }

  Widget _buildToggleText(String text, FontWeight fontWeight, Color color,
      Function() onTap) {
    return InkWell(
      onTap: onTap,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 20.sp,
          color: color,
          fontFamily: 'YourFontFamily',
          fontWeight: fontWeight,
        ),
      ),
    );
  }

  Widget _buildEmailTextField() {
    return TextFormField(
      controller: _emailController,
      onChanged: (value) => email = value,
      decoration: const InputDecoration(
        border: InputBorder.none,
        fillColor: Colors.white,
        filled: true,
        hintText: "email",
      ),
    );
  }

  Widget _buildPasswordTextField() {
    return TextFormField(
      controller: _passwordController,
      onChanged: (value) => password = value,
      obscureText: true,
      decoration: const InputDecoration(
        border: InputBorder.none,
        fillColor: Colors.white,
        filled: true,
        hintText: "password",
      ),
    );
  }

  Widget _buildLogInButton() {
    return SizedBox(
      width: 500.w,
      child: ElevatedButton(
        onPressed: () async {
          // Call the authentication function here
          _handleLogIn();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF99C958),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(3),
          ),
          elevation: 3,
          shadowColor: Colors.black,
        ),
        child: Text(
          "Log in",
          style: TextStyle(
            fontSize: 20.sp,
            color: const Color(0xFF314C07),
            fontFamily: 'YourFontFamily',
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
    );
  }

  void _handleLogIn() async {
    // 입력값이 비어 있는지 확인
    if (_emailController.text
        .trim()
        .isEmpty ||
        _passwordController.text
            .trim()
            .isEmpty) {
      // 아이디 또는 비밀번호가 비어있는 경우
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("입력 오류 : Input Error"),
            content: const Text(
                "아이디 또는 비밀번호를 입력하세요.\nPlease enter your ID or password."),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("확인"),
              ),
            ],
          );
        },
      );
    } else if (!_emailController.text.contains('@')) {
      // 이메일에 @가 포함되어 있는지 확인
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("입력 오류 : Input Error"),
            content: const Text(
                "올바른 이메일 형식이 아닙니다.\nPlease enter a valid email address."),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("확인"),
              ),
            ],
          );
        },
      );
    } else {
      try {
        setState(() {
          saving = true;
        });
        final currentUser = await _authentication
            .signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        if (currentUser.user != null) {
          // 로그인 성공 시의 처리
          String? token = await currentUser.user
              ?.getIdToken();
          var read = ReadController();

          token = FirebaseAuth.instance.currentUser?.uid;

          personalController.userId = token!;
          personalController.userName =
          await read.fb_read_userName(token);

          // Successfully logged in
          _emailController.clear();
          _passwordController.clear();
          // ignore: use_build_context_synchronously
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
              const FirstPage(
                title: 'Flutter Demo Home Page',
              ),
            ),
          );
        }
      } catch (e) {
        // 로그인 실패 시 알림 창 표시
        // ignore: use_build_context_synchronously
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("로그인 실패 : Login failed "),
              content: const Text(
                  "사용자 정보가 일치하지 않습니다.\nUser information does not match."),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("확인"),
                ),
              ],
            );
          },
        );
      } finally {
        setState(() {
          saving = false;
        });
      }
    }
  }


}