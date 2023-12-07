import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:growpuang/view/login/LoginPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:email_validator/email_validator.dart';

import '../widget/end_dialog.dart';
import '../widget/login/LoginPageWidget.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final _authentication = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  bool saving = false;
  String email = '';
  String password = '';
  String userName = '';

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: ModalProgressHUD(
        inAsyncCall: saving,
        child: Scaffold(
          appBar: null,
          resizeToAvoidBottomInset: false,
          body: Stack(
            children: [
              buildBackgroundImage(130.h),
              _buildSignUpForm(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSignUpForm() {
    return Container(
      margin: EdgeInsets.fromLTRB(20.w, 380.h, 20.w, 130.h),
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
          _buildUsernameTextField(),
          SizedBox(height: 20.h),
          _buildSignUpButton(),
        ],
      ),
    );
  }

  Widget _buildToggleButtons() {
    return Row(
      children: [
        _buildToggleText("Log In", FontWeight.w300, const Color(0xFFB7B7B7), () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const LogInPage(),
            ),
          );
        }),
        SizedBox(width: 10.w),
        _buildToggleText("Sign up", FontWeight.w700, const Color(0xFF314C07), () {}),
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

  Widget _buildUsernameTextField() {
    return TextFormField(
      controller: _usernameController,
      onChanged: (value) {
        userName = value;
      },
      decoration: const InputDecoration(
        border: InputBorder.none,
        fillColor: Colors.white,
        filled: true,
        hintText: "UserName",
      ),
    );
  }

  Widget _buildSignUpButton() {
    return SizedBox(
      width: 500.w,
      child: ElevatedButton(
        onPressed: () async {
          _onSignUpButtonPressed();
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
          "Sign Up",
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

  void _onSignUpButtonPressed() async {
    // Check if any of the input fields are empty
    if (_emailController.text
        .trim()
        .isEmpty ||
        _passwordController.text
            .trim()
            .isEmpty ||
        _usernameController.text
            .trim()
            .isEmpty) {
      // Display an alert if any field is empty
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("입력 오류 Input Error"),
            content: const Text(
                "이메일, 비밀번호, 사용자 이름을 \n모두 입력하세요.\nPlease enter email, password,\nand username."),
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
    } else if (!isValidEmail(email)) {
      // Display an alert if email format is invalid
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("입력 오류 Input Error"),
            content: const Text(
                "올바른 이메일 주소를 입력하세요.\nEnter a valid email address."),
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
      _registerUser();
    }
  }

  bool isValidEmail(String email) {
    return EmailValidator.validate(email);
  }

  Future<bool> isEmailExists(String email) async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('user')
        .where('email', isEqualTo: email)
        .get();

    return querySnapshot.docs.isNotEmpty;
  }

  Future<void> _registerUser() async {
    try {
      setState(() {
        saving = true;
      });

      // Check if the email already exists
      bool emailExists = await isEmailExists(email);

      if (emailExists) {
        // Email already exists, show alert dialog
        // ignore: use_build_context_synchronously
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("회원가입 실패\nSign-up failed"),
              content: const Text(
                  "이미 등록된 이메일입니다.\nThis email is already registered"),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    setState(() {
                      saving = false; // Update the state when dismissing the dialog
                    });
                  },
                  child: const Text("확인"),
                ),
              ],
            );
          },
        );
      } else {
        // Email doesn't exist, proceed with registration
        final newUser = await _authentication.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        await FirebaseFirestore.instance
            .collection('user')
            .doc(newUser.user!.uid)
            .set({
          'userName': userName,
          'email': email,
        });

        if (newUser.user != null) {
          // Registration successful, show success alert
          // ignore: use_build_context_synchronously
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text("회원가입 성공\nSign-up successful"),
                content: const Text("회원가입이 성공적으로 완료되었습니다."),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      setState(() {
                        saving = false; // Update the state when dismissing the dialog
                      });
                      // Navigate to the login page
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LogInPage(),
                        ),
                      );
                    },
                    child: const Text("확인"),
                  ),
                ],
              );
            },
          );
        }
      }
    } catch (e) {
      print(e);
      setState(() {
        saving = false;
      });
    }
  }


  Future<bool> _onWillPop() async {
    return (await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Close App'),
        content: Text('정말로 게임을 종료하시겠습니까?'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text('No'),
          ),
          TextButton(
            onPressed: () {
              SystemNavigator.pop();
              },
            child: Text('Yes'),
          ),
        ],
      ),
    )) ??
        false;
  }
}
