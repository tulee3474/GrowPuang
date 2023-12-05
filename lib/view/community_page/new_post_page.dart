
import 'package:growpuang/controller/language_controller.dart';
import 'package:growpuang/controller/post_list_controller.dart';
import 'package:growpuang/controller/personal_contoller.dart';
import 'package:growpuang/mainPage.dart';
import 'package:growpuang/model/firebase_read_write.dart';
import 'package:flutter/material.dart';
import 'package:growpuang/class/post.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:growpuang/styles.dart';
import 'package:growpuang/view/community_screen.dart';
import 'package:growpuang/view/widget/appBar.dart';

class NewPostPage extends StatefulWidget {
  const NewPostPage({super.key});

  @override
  _NewPostPageState createState() => _NewPostPageState();
}

class _NewPostPageState extends State<NewPostPage> {
  final postListController = Get.put(PostListController());
  final personalController = Get.put(PersonalController());
  final languageController = Get.put(LanguageController());

  late TextEditingController postTitleController;
  late TextEditingController postTitleController2;
  late TextEditingController postContentController;

  int _sortOpt = 1;

  @override
  initState() {
    super.initState();
    postTitleController = TextEditingController();
    postTitleController2 = TextEditingController();
    postContentController = TextEditingController();

    for (int b = 0; b < postListController.sortList.length; b++) {
      switchButtonConfig(b, b == 1 ? 1 : 0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const appBar(),
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
                                fontSize: 22.sp,
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
                      SingleChildScrollView(
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
                                        fontSize: 18.sp,
                                        fontFamily: 'Inter',
                                        //fontWeight: FontWeight.bold,
                                        color: buttonConfigs[i].textColor,
                                        //buttonTextColorList[i],
                                      ),
                                    ),
                                    style: TextButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        ),
                                        backgroundColor: buttonConfigs[i].backgroundColor),
                                        //buttonColorList[i]),
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
                                              switchButtonConfig(b, 0);
                                            } else {
                                              switchButtonConfig(b, 1);
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
                                fontSize: 18.sp,
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
                                maxLength: languageController.language == "한국어"
                                    ? 9
                                    : 13,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    filled: true,
                                    fillColor: mainBackgroundColor,
                                    labelText: languageController
                                        .communityNewPostCompanyExample,
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.never,
                                    labelStyle: TextStyle(
                                      fontSize: 12.sp,
                                      fontFamily: 'Inter',
                                      color: communityTextColor,
                                    ),
                                    counterText: ""),
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
                                fontSize: 18.sp,
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
                                maxLength: languageController.language == "한국어"
                                    ? 9
                                    : 13,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    filled: true,
                                    fillColor: mainBackgroundColor,
                                    labelText: languageController
                                        .communityNewPostJobTitleExample,
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.never,
                                    labelStyle: TextStyle(
                                      fontSize: 12.sp,
                                      fontFamily: 'Inter',
                                      color: communityTextColor,
                                    ),
                                    counterText: ""),
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
                          textAlignVertical: const TextAlignVertical(y: -1.0),
                          maxLines: 6,
                          maxLength: 200,
                          decoration: InputDecoration(
                            // contentPadding: EdgeInsets.zero, // 좌상단에 위치하도록 설정

                            border: InputBorder.none,
                            filled: true,
                            fillColor: mainBackgroundColor,
                            labelText:
                                languageController.communityNewPostContent,
                            labelStyle: TextStyle(
                              fontSize: 18.sp,
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
                      child: SizedBox(
                        width: 140.w,
                        height: 40.h,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            backgroundColor: communityMainColor,
                          ),
                          onPressed: () {
                            if (postTitleController.text == "" ||
                                postTitleController2.text == "" ||
                                postContentController.text == "") {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  Future.delayed(
                                    const Duration(seconds: 1),
                                        () {
                                      Navigator.of(context, rootNavigator: true)
                                          .pop();
                                    },
                                  );
                                  return AlertDialog(
                                    content: SizedBox(
                                      width: 400.w,
                                      height: 120.h,
                                      child: Center(
                                        child: Text(
                                          languageController
                                              .incompleteFieldsMessage,
                                          style: TextStyle(
                                              color: mainTextColor,
                                              letterSpacing: 1.w,
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.w500,
                                              fontSize: 18.sp),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            } else {
                              setState(() {
                                postListController.postList.add(Post(
                                    '${postTitleController.text} | ${postTitleController2.text}',
                                    postListController.postList.last.postNum +
                                        1,
                                    personalController.userName,
                                    personalController.userId,
                                    [],
                                    [],
                                    [],
                                    [],
                                    0,
                                    postContentController.text,
                                    _sortOpt));
                                fb_add_post(
                                    '${postTitleController.text} | ${postTitleController2.text}',
                                    postListController
                                        .postList.last.postNum, //이미 넣었으니깐.
                                    postListController.postList,
                                    postContentController.text,
                                    personalController.userName,
                                    _sortOpt); // 게시글 추가 - 게시글 제목, 게시글 넘버, 작성자, 게시글 내용
                              });

                              //여기서 DB에 저장

                              //커뮤니티 들어가기 - 글 하나 쓸 때마다 +1점
                              personalController.communityResult += 1;

                              //새로고침을 위하여 기존 화면 스택을 날리고 다시 시작함
                              Navigator.pushNamedAndRemoveUntil(
                                  context, '/', (_) => false);
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MainPage()),
                              );
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const CommunityScreen()));
                            }
                          },
                          child: Text(
                            languageController.communityNewPostRegister,
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 18.sp,
                              color: whiteTextColor,
                            ),
                          ),
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



