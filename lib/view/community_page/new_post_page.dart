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
  TextEditingController postTitleController2 = TextEditingController();
  //TextEditingController postWriterController = TextEditingController();
  TextEditingController postContentController = TextEditingController();

  int _sortOpt = 1;

  @override
  initState() {
    for (int b = 0; b < postListController.sortList.length; b++) {
      if (b != 1) {
        switchButtonColor(b, 0);
        switchButtonTextColor(b, 0);
      } else {
        switchButtonColor(b, 1);
        switchButtonTextColor(b, 1);
      }
    }

    super.initState();
    postTitleController = TextEditingController();
    postTitleController2 = TextEditingController();
    postContentController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          appBar(),
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
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
                                fontFamily: 'Inter',
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
                                          fontFamily: 'Inter',
                                          //fontWeight: FontWeight.bold,
                                          color: buttonTextColorList[i],
                                        ),
                                      ),
                                      style: TextButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                          ),
                                          backgroundColor: buttonColorList[i]),
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
                                                switchButtonTextColor(b, 0);
                                              } else {
                                                switchButtonColor(b, 1);
                                                switchButtonTextColor(b, 1);
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
                      SizedBox(height: 12.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(width: 4.w),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              languageController.communityNewPostCompanyName,
                              style: TextStyle(
                                fontSize: 20.sp,
                                fontFamily: 'Inter',
                                color: communityMainColor,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 8, 20, 8),
                            child: Container(
                              width: 280.w,
                              height: 40.h,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: communityTextColor, width: 1),
                              ),
                              child: TextField(
                                controller: postTitleController,
                                maxLines: 1,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  filled: true,
                                  fillColor: mainBackgroundColor,
                                  labelText: languageController
                                      .communityNewPostCompanyExample,
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.never,
                                  labelStyle: TextStyle(
                                    fontSize: 16.sp,
                                    fontFamily: 'Inter',
                                    color: communityTextColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(width: 4.w),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              languageController.communityNewPostJobTitle,
                              style: TextStyle(
                                fontSize: 20.sp,
                                fontFamily: 'Inter',
                                color: communityMainColor,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 8, 20, 8),
                            child: Container(
                              width: 280.w,
                              height: 40.h,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: communityTextColor, width: 1),
                              ),
                              child: TextField(
                                controller: postTitleController2,
                                maxLines: 1,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  filled: true,
                                  fillColor: mainBackgroundColor,
                                  labelText: languageController
                                      .communityNewPostJobTitleExample,
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.never,
                                  labelStyle: TextStyle(
                                    fontSize: 16.sp,
                                    fontFamily: 'Inter',
                                    color: communityTextColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: 520.w,
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: communityTextColor, width: 1),
                        ),
                        child: TextField(
                          controller: postContentController,
                          maxLines: 6,
                          maxLength: 500,
                          decoration: InputDecoration(
                            // contentPadding: EdgeInsets.zero, // 좌상단에 위치하도록 설정

                            border: InputBorder.none,
                            filled: true,
                            fillColor: mainBackgroundColor,
                            labelText:
                                languageController.communityNewPostContent,
                            labelStyle: TextStyle(
                              fontSize: 20.sp,
                              fontFamily: 'Inter',
                              //fontWeight: FontWeight.bold,
                              color: communityTextColor,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 32.h),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 1.w,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        width: 140.w,
                        height: 40.h,
                        child: TextButton(
                          child: Text(
                            languageController.communityNewPostRegister,
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 20.sp,
                              color: whiteTextColor,
                            ),
                          ),
                          style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            backgroundColor: communityMainColor,
                          ),
                          onPressed: () {
                            setState(() {
                              postListController.postList.add(Post(
                                  postTitleController.text +
                                      ' | ' +
                                      postTitleController2.text,
                                  postListController.postList.last.postNum + 1,
                                  personalController.userId,
                                  [],
                                  [],
                                  [],
                                  0,
                                  postContentController.text,
                                  _sortOpt));
                              fb_add_post(
                                  postTitleController.text +
                                      ' | ' +
                                      postTitleController2.text,
                                  postListController
                                      .postList.last.postNum, //이미 넣었으니깐.
                                  personalController.userId,
                                  postContentController.text,
                                  _sortOpt); // 게시글 추가 - 게시글 제목, 게시글 넘버, 작성자, 게시글 내용
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
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
