import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:growpuang/controller/personal_contoller.dart';
import 'package:growpuang/view/mbti/firstPage.dart';
import 'package:growpuang/view/widget/appBar_login.dart';
import 'package:growpuang/view/login/SignUpPage.dart';
import '../widget/end_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:growpuang/model/firebase_read_write.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  final TextEditingController _emailController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();
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
            Container(
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
                width: 500.w,
                margin: EdgeInsets.fromLTRB(20.w, 280.h, 20.w, 250.h),
                padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 20.h),
                color: Colors.white.withOpacity(0.5),
                child: Column(
                  children: [
                    Row(
                      children: [
                        InkWell(
                          onTap: () {},
                          child: Text(
                            "Log In",
                            style: TextStyle(
                              fontSize: 20.sp,
                              color: Color(0xFF314C07),
                              fontFamily: 'YourFontFamily',
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SignUpPage(),
                              ),
                            );
                          },
                          child: Text(
                            "Sign up",
                            style: TextStyle(
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
                      controller: _emailController,
                      onChanged: (value) {
                        email = value;
                      },
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
                      controller: _passwordController,
                      onChanged: (value) {
                        password = value;
                      },
                      obscureText: true,
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
                        onPressed: () async {
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
                              //231203 태운 추가 - Token 저장 + userName읽어오기
                              String? token =
                                  await currentUser.user?.getIdToken();
                              var read = ReadController();

                              token = FirebaseAuth.instance.currentUser?.uid;
                              print(token!);
                              print("!@31");

                              personalController.userId = token;
                              personalController.userName =
                                  await read.fb_read_userName(token);

                              print("!@31");
                              // Successfully logged in
                              _emailController.clear();
                              _passwordController.clear();
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const firstPage(
                                    title: 'Flutter Demo Home Page',
                                  ),
                                ),
                              );
                            }
                          } catch (e) {
                            print(e);
                            // 로그인 실패 시 알림 창 표시
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("로그인 실패 : Login failed "),
                                  content: Text(
                                      "사용자 정보가 일치하지 않습니다.\nUser information does not match."),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text("확인"),
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
}
