import 'dart:ffi';

import 'package:growpuang/controller/post_list_controller.dart';
import 'package:growpuang/controller/personal_contoller.dart';
import 'package:growpuang/model/firebase_read_write.dart';
import 'package:flutter/material.dart';
import 'package:growpuang/class/post.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:growpuang/styles.dart';
import 'package:growpuang/view/community_screen.dart';

class NewPostPage extends StatefulWidget {
  NewPostPage();

  @override
  _NewPostPageState createState() => _NewPostPageState();
}

class _NewPostPageState extends State<NewPostPage> {
  final postListController = Get.put(PostListController());
  final personalController = Get.put(PersonalController());

  TextEditingController postTitleController = TextEditingController();
  //TextEditingController postWriterController = TextEditingController();
  TextEditingController postContentController = TextEditingController();

  // Post NewPostPage = Post('', 1, '', [], [], [], 0, '');

  @override
  initState() {
    super.initState();
    postTitleController = TextEditingController();
    postContentController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true, // 앱바 가운데 정렬
        // title: InkWell(
        //   onTap: () {
        //     Navigator.popUntil(context, (route) => route.isFirst);
        //   },
        //   child: SizedBox(
        //     height: 48.h,
        //     width: 80.w,
        //     child: SizedBox(
        //       height: 48.h,
        //       width: 80.w,
        //       child: Image.asset(IconsPath.logo, fit: BoxFit.contain),
        //     ),
        //   ),
        // ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(
                height: 10.h,
              ),
              Container(
                child: Text(
                  "새로운 글 작성",
                  style: TextStyle(
                    color: Colors.black,
                    letterSpacing: 2.0,
                    fontFamily: 'Neo',
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                height: 7,
                decoration: BoxDecoration(
                  color: Color(0xffF4F4F4),
                  border: Border(
                    top: BorderSide(width: 1.0, color: primaryBold8),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 15),
                decoration: BoxDecoration(
                  color: mainBackgroundColor,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    width: 1,
                    color: Color.fromARGB(255, 245, 250, 253),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: buttonBorderColor.withOpacity(0.1),
                      spreadRadius: 2,
                      blurRadius: 2,
                      offset: Offset(3, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Text('여행 경험을 공유해보세요!',
                        style: TextStyle(
                          color: mainTextColor,
                          letterSpacing: 2.0,
                          fontFamily: 'Neo',
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                        )),
                    SizedBox(height: 20.h),
                    TextField(
                      controller: postTitleController,
                      maxLines: 1,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        filled: true,
                        fillColor: Color(0xffF4F4F4),
                        labelText: '제목을 입력해주세요',
                        labelStyle: TextStyle(
                          fontFamily: "Neo",
                          fontSize: 15.sp,
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    TextField(
                      controller: postContentController,
                      maxLines: 7,
                      maxLength: 500,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        filled: true,
                        fillColor: Color(0xffF4F4F4),
                        labelText: '내용을 입력해주세요.',
                        labelStyle: TextStyle(
                          fontFamily: "Neo",
                          fontSize: 15.sp,
                        ),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Container(
                      width: double.infinity,
                      height: 40.h,
                      child: ElevatedButton(
                        child: Text(
                          '게시글 저장',
                          style: TextStyle(
                            fontFamily: 'Neo',
                            fontWeight: FontWeight.bold,
                            fontSize: 15.sp,
                            color: Color.fromARGB(255, 102, 202, 252),
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          side: BorderSide(
                              color: Color.fromARGB(255, 102, 202, 252),
                              width: 2.w),
                        ),
                        onPressed: () {
                          setState(() {
                            postListController.postList.add(Post(
                                postTitleController.text,
                                postListController.postList.last.postNum + 1,
                                personalController.userId,
                                [],
                                [],
                                [],
                                0,
                                postContentController.text));
                            fb_add_post(
                                postTitleController.text,
                                postListController
                                    .postList.last.postNum, //이미 넣었으니깐.
                                personalController.userId,
                                postContentController
                                    .text); // 게시글 추가 - 게시글 제목, 게시글 넘버, 작성자, 게시글 내용
                          });

                          //여기서 DB에 저장

                          //커뮤니티 들어가기 - 글 하나 쓸 때마다 +1점
                          personalController.communityResult += 1;
                          print(
                              '커뮤니티 점수 : ${personalController.communityResult}');

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CommunityScreen()));
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
