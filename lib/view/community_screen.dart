import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:growpuang/controller/language_controller.dart';
import 'package:growpuang/controller/personal_contoller.dart';
import 'package:growpuang/controller/post_controller.dart';
import 'package:growpuang/controller/post_list_controller.dart';
import 'package:growpuang/mainPage.dart';
import 'package:growpuang/model/loading_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:growpuang/styles.dart';
import 'package:growpuang/view/community_page/new_post_page.dart';
import 'package:growpuang/view/community_page/written_post_page.dart';
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

  //화면 내 sort 정보 저장
  int sortOpt = 0;

  //함수형 위젯에서 중간 표시선을 표기하기 시작할 위치를 지정하기 위한 변수
  List<int> lineStartOptList = [0, 0, 0, 0];
  List<int> lineEndOptList = [0, 0, 0, 0];

  @override
  initState() {
    //함수형 위젯에서 중간 표시선을 표기하기 시작할 위치를 지정
    for (int i = 0; i < postListController.postList.length; i++) {
      if (postListController.postList[i].sortOpt == 1) {
        lineStartOptList[1] == 0 ? lineStartOptList[1] = i : null;
        lineEndOptList[1] = i;
        continue;
      }
      if (postListController.postList[i].sortOpt == 2) {
        lineStartOptList[2] == 0 ? lineStartOptList[2] = i : null;
        lineEndOptList[2] = i;
        continue;
      }
      if (postListController.postList[i].sortOpt == 3) {
        lineStartOptList[3] == 0 ? lineStartOptList[3] = i : null;
        lineEndOptList[3] = i;
        continue;
      }
    }
    lineEndOptList[0] = postListController.postList.length - 1;
    print(lineStartOptList);
    print(lineEndOptList);

    postListController.initSortOpt();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          appBar(),
          SingleChildScrollView(
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
                          height: 24.h,
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(12, 0, 0, 0),
                          child: Text(
                            languageController.communityAppBarText,
                            style: TextStyle(
                                fontSize: 22.sp,
                                fontFamily: 'Inter',
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
                                fontSize: 17.sp,
                                fontFamily: 'Inter',
                                color: whiteTextColor),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  color: mainBackgroundColor.withOpacity(0.95),
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
                                          fontSize: 20.sp,
                                          fontFamily: 'Inter',
                                          color: communityMainColor),
                                    ),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  setState(() {
                                    postListController.selectedSort = value!;
                                    sortOpt = postListController.sortList
                                        .indexOf(value);
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
                                      builder: (context) => CommunityScreen()));
                            },
                            child: Icon(Icons.refresh_rounded),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      //for문 + 삼항연산자로 글 종류에 따른 sort
                      for (int i = postListController.postList.length - 1;
                          i >= 0;
                          i--)
                        Column(
                          children: [
                            // 상단에 밑줄 추가 ( lineStartOptList, lineEndOptList 체크 )
                            i >= lineStartOptList[sortOpt] &&
                                    i < lineEndOptList[sortOpt]
                                ? Stack(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          border: Border(
                                            bottom: BorderSide(
                                              color: mainBackgroundColor
                                                  .withOpacity(0.8),
                                              width: 1.2, // 선의 두께
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.fromLTRB(
                                            28.w, 0, 28.w, 0),
                                        decoration: const BoxDecoration(
                                          border: Border(
                                            bottom: BorderSide(
                                              color:
                                                  communityMainColor, // 원하는 색상으로 변경
                                              width: 1.2, // 선의 두께
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                : const SizedBox(),
                            sortOpt == postListController.postList[i].sortOpt ||
                                    sortOpt == 0
                                ? GestureDetector(
                                    child: Container(
                                      width: double.infinity,
                                      height: 80.h,
                                      padding: const EdgeInsets.all(12.0),
                                      decoration: BoxDecoration(
                                        color: mainBackgroundColor
                                            .withOpacity(0.8),
                                        borderRadius: BorderRadius.circular(0),
                                        // border: Border(
                                        //   bottom: BorderSide(
                                        //       color: Colors.grey.withOpacity(0.3)),
                                        // ),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              SizedBox(width: 20.w),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    postListController.sortList[
                                                        postListController
                                                            .postList[i]
                                                            .sortOpt],
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 16.sp,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 4.h,
                                                  ),
                                                  Expanded(
                                                    child: Text(
                                                      '${postListController.postList[i].postTitle}',
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 18.sp,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Row(
                                                children: [
                                                  Container(
                                                    margin: EdgeInsets.fromLTRB(
                                                        0, 0, 2.w, 0),
                                                    height: 32.h,
                                                    child: Icon(Icons
                                                        .chat_bubble_outline),
                                                  ),
                                                  Text(
                                                    '${postListController.postList[i].commentList.length}',
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 20.sp,
                                                    ),
                                                  ),
                                                  Container(
                                                    margin: EdgeInsets.fromLTRB(
                                                        8.w, 0, 2.w, 0),
                                                    height: 32.h,
                                                    child: Icon(Icons
                                                        .thumb_up_alt_outlined),
                                                  ),
                                                  Text(
                                                    '${postListController.postList[i].recommendList.length}',
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 20.sp,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Container(
                                                child: Text(
                                                  postListController
                                                      .postList[i].postWriter,
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w300,
                                                    fontSize: 13.sp,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
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
                                              postListController.postList[i],
                                              i),
                                        ),
                                      );
                                    },
                                  )
                                : const SizedBox(),
                          ],
                        ),
                    ],
                  ),
                ),
              ],
            ),
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
