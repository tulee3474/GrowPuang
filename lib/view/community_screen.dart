import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:growpuang/controller/post_controller.dart';
import 'package:growpuang/controller/post_list_controller.dart';
import 'package:growpuang/model/loading_dialog.dart';
import 'package:growpuang/model/firebase_read_write.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:growpuang/styles.dart';
import 'package:growpuang/view/community_page/new_post_page.dart';
import 'package:growpuang/view/community_page/written_post_page.dart';

class CommunityScreen extends StatelessWidget {
  final postController = Get.put(PostController());
  final postListController = Get.put(PostListController());
  @override
  Widget build(BuildContext context) {
    // return WillPopScope(
    //   onWillPop: () async {
    //     Navigator.popUntil(context, (route) => route.isFirst);
    //     //첫화면까지 팝해버리는거임
    //     return true;
    //   },
    //   child:
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(
                height: 30.h,
              ),
              Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween, // 각 위젯간의 공간을 둠
                children: [
                  Container(
                    child: Text(
                      '커뮤니티 글 목록',
                      style: TextStyle(
                        color: Colors.black,
                        letterSpacing: 2.0,
                        fontFamily: 'Neo',
                        fontSize: 20.0.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 30.w,
                  ),
                  Container(
                    child: TextButton(
                      onPressed: () async {
                        //기다리는 동안 로딩창 띄우기
                        loadingDialog(context);

                        await postListController.readPostData();

                        //화면 이동 전, 로딩 다이어로그 pop!
                        Navigator.of(context, rootNavigator: true).pop();

                        // //현재 페이지 pop
                        // Navigator.pop(context);

                        CommunityScreen();
                      },
                      child: Icon(Icons.refresh_rounded),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30.h,
              ),
              for (int i = postListController.postList.length - 1; i >= 0; i--)
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
                          offset: Offset(3, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Color.fromARGB(255, 102, 202, 252),
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
                        builder: (context) =>
                            WrittenPostPage(postListController.postList[i], i),
                      ),
                    );
                  },
                )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 102, 202, 252),
        child: Icon(Icons.add),
        elevation: 0,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NewPostPage(),
            ),
          );
        },
      ),
    );
  }
}
