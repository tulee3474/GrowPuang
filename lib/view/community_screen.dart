import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:growpuang/controller/language_controller.dart';
import 'package:growpuang/controller/personal_contoller.dart';
import 'package:growpuang/controller/post_controller.dart';
import 'package:growpuang/controller/post_list_controller.dart';
import 'package:growpuang/mainPage.dart';
import 'package:growpuang/model/loading_dialog.dart';
import 'package:growpuang/model/firebase_read_write.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:growpuang/styles.dart';
import 'package:growpuang/view/community_page/new_post_page.dart';
import 'package:growpuang/view/community_page/written_post_page.dart';
import 'package:growpuang/view/home_screen.dart';
import 'package:growpuang/view/widget/appBar.dart';

class CommunityScreen extends StatefulWidget {
  const CommunityScreen({Key? key}) : super(key: key);

  @override
  State<CommunityScreen> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
  final personalController = Get.put(PersonalController());
  final postController = Get.put(PostController());
  final postListController = Get.put(PostListController());
  final languageController = Get.put(LanguageController());

  @override
  initState() {
    postListController.initSortOpt();
    super.initState();
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
                        height: 24.h,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(12, 0, 0, 0),
                        child: Text(
                          languageController.communityAppBarText,
                          style: TextStyle(
                              fontSize: 28.sp,
                              fontFamily: 'YourFontFamily',
                              fontWeight: FontWeight.bold,
                              color: whiteTextColor),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(12, 0, 0, 0),
                        child: Text(
                          languageController.communityAppBarSubText(
                              personalController.communityResult),
                          style: TextStyle(
                              fontSize: 20.sp,
                              fontFamily: 'YourFontFamily',
                              color: whiteTextColor),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                color: Colors.white.withOpacity(0.95),
                child: SizedBox(
                  width: double.infinity,
                  height: 50.h,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                          child: Row(
                            children: [
                              Icon(
                                Icons.menu,
                                color: communityMainColor,
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              DropdownButton(
                                icon: const SizedBox.shrink(),
                                value: postListController.selectedSort,
                                items: postListController.sortList.map((value) {
                                  return DropdownMenuItem(
                                    value: value,
                                    child: Text(
                                      value,
                                      style: TextStyle(
                                          fontSize: 25.sp,
                                          fontFamily: 'YourFontFamily',
                                          color: communityMainColor),
                                    ),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  setState(() {
                                    postListController.selectedSort = value!;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: TextButton(
                            onPressed: () async {
                              //기다리는 동안 로딩창 띄우기
                              loadingDialog(context);

                              await postListController.readPostData();

                              //화면 이동 전, 로딩 다이어로그 pop!
                              Navigator.of(context, rootNavigator: true).pop();

                              CommunityScreen();
                            },
                            child: Icon(Icons.refresh_rounded),
                          ),
                        ),
                      ]),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      for (int i = postListController.postList.length - 1;
                          i >= 0;
                          i--)
                        GestureDetector(
                          child: Container(
                            width: double.infinity - 20.w,
                            // height: 200,
                            padding: EdgeInsets.all(12),
                            margin: EdgeInsets.only(bottom: 15),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.1),
                                  spreadRadius: 2,
                                  blurRadius: 2,
                                  offset: Offset(
                                      3, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor:
                                      Color.fromARGB(255, 102, 202, 252),
                                  child: Text(
                                    '${i + 1}',
                                    style: TextStyle(
                                      color: mainTextColor,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 20.w),
                                Expanded(
                                  child: Text(
                                    '${postListController.postList[i].postTitle}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.sp,
                                    ),
                                  ),
                                ),
                                Icon(Icons.navigate_next),
                              ],
                            ),
                          ),
                          onTap: () {
                            print(postListController.postList.length);
                            print(i);

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => WrittenPostPage(
                                    postListController.postList[i], i),
                              ),
                            );
                          },
                        )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 100.w,
              child: FittedBox(
                fit: BoxFit.fill,
                child: FloatingActionButton(
                  backgroundColor: communityMainColor,
                  child: Icon(
                    Icons.home,
                    color: whiteTextColor,
                  ),
                  elevation: 5,
                  onPressed: () {
                    //새로고침을 위하여 기존 화면 스택을 날리고 다시 시작함
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/', (_) => false);
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => MainPage()),
                    );
                  },
                ),
              ),
            ),
            SizedBox(
              width: 100.w,
              child: FittedBox(
                fit: BoxFit.fill,
                child: FloatingActionButton(
                  backgroundColor: communityMainColor,
                  child: Icon(
                    Icons.border_color,
                    color: whiteTextColor,
                  ),
                  elevation: 5,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NewPostPage(),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
