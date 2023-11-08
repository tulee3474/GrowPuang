import 'dart:ffi';

import 'package:growpuang/controller/language_controller.dart';
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
import 'package:growpuang/view/widget/appBar.dart';

class NewPostPage extends StatefulWidget {
  NewPostPage();

  @override
  _NewPostPageState createState() => _NewPostPageState();
}

class _NewPostPageState extends State<NewPostPage> {
  final postListController = Get.put(PostListController());
  final personalController = Get.put(PersonalController());
  final languageController = Get.put(LanguageController());

  TextEditingController postTitleController = TextEditingController();
  //TextEditingController postWriterController = TextEditingController();
  TextEditingController postContentController = TextEditingController();

  int _sortOpt = 1;

  @override
  initState() {
    for (int b = 0; b < postListController.sortList.length; b++) {
      if (b != 1) {
        switchButtonColor(b, 0);
      } else {
        switchButtonColor(b, 1);
      }
    }

    super.initState();
    postTitleController = TextEditingController();
    postContentController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          appBar(),
          Column(
            children: [
              Container(
                width: double.infinity,
                color: communityMainColor,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 32.h,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(12, 0, 0, 0),
                        child: Text(
                          languageController.communityNewPostAppBarText,
                          style: TextStyle(
                              fontSize: 28.sp,
                              fontFamily: 'YourFontFamily',
                              fontWeight: FontWeight.bold,
                              color: whiteTextColor),
                        ),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                children: [
                  Container(
                    color: mainBackgroundColor,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10.h,
                        ),
                        Container(
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 30.w,
                                ),
                                for (int i = 1;
                                    i < postListController.sortList.length;
                                    i++)
                                  Row(
                                    children: [
                                      TextButton(
                                        // ignore: sort_child_properties_last
                                        child: Text(
                                          postListController.sortList[i],
                                          style: TextStyle(
                                            fontSize: 20.sp,
                                            fontFamily: 'YourFontFamily',
                                            fontWeight: FontWeight.bold,
                                            color: communityMainColor,
                                          ),
                                        ),
                                        style: TextButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(0.0),
                                            ),
                                            backgroundColor:
                                                buttonColorList[i]),
                                        onPressed: () {
                                          setState(
                                            () {
                                              //버튼 색 변환
                                              for (int b = 0;
                                                  b <
                                                      postListController
                                                          .sortList.length;
                                                  b++) {
                                                if (b != i) {
                                                  switchButtonColor(b, 0);
                                                } else {
                                                  switchButtonColor(b, 1);
                                                }
                                              }

                                              //_sortOpt 선택
                                              _sortOpt = i;
                                            },
                                          );
                                        },
                                      ),
                                      SizedBox(
                                        width: 20.w,
                                      )
                                    ],
                                  ),
                              ],
                            ),
                          ),
                        ),
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
                                    postListController.postList.last.postNum +
                                        1,
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
            ],
          ),
        ],
      ),
    );
  }
}
