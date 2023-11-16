import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:growpuang/controller/language_controller.dart';
import 'package:growpuang/controller/personal_contoller.dart';
import 'package:growpuang/controller/post_list_controller.dart';
import 'package:growpuang/model/loading_dialog.dart';
import 'package:growpuang/view/community_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final languageController = Get.put(LanguageController());
  final personalController = Get.put(PersonalController());
  final postListController = Get.put(PostListController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            languageController.appBarText,
            style: TextStyle(fontSize: 18),
          ),
        ),
        // leading: IconButton(
        //     icon: Icon(Icons.menu),
        //     onPressed: () {
        //       print('menu button is clicked');
        //     }),
        // actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.add))],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    IconButton(
                      onPressed: () {
                        print("전공 퀴즈");
                        //전공 퀴즈 페이지 들어가서 세팅 - 페이지 안에서 직접 세팅하는 것이 맞을 것이라고 판단하였음
                        personalController.knowledgeQuizResultList = [
                          true,
                          true,
                          true,
                          true,
                          true,
                          true,
                        ];
                      },
                      icon: Image.asset(
                        'assets/지식지수.png',
                        width: 70.w,
                        height: 70.h,
                        //fit: BoxFit.cover,
                      ),
                    ),
                    Text(
                      languageController.knowledgeQuiz,
                      style: TextStyle(
                        color: Colors.black,
                        letterSpacing: 2.w,
                        //fontFamily: 'Neo',
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                      onPressed: () {
                        print("참여 활동");
                        //참여활동 페이지 들어가서 세팅 - 페이지 안에서 직접 세팅하는 것이 맞을 것이라고 판단하였음
                        personalController.activityResultList = [
                          true,
                          true,
                          true,
                          true,
                          true,
                          true,
                        ];
                      },
                      icon: Image.asset(
                        'assets/활동_icon.png',
                        width: 70.w,
                        height: 70.h,
                        //fit: BoxFit.cover,
                      ),
                    ),
                    Text(
                      languageController.activity,
                      style: TextStyle(
                        color: Colors.black,
                        letterSpacing: 2.w,
                        //fontFamily: 'Neo',
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                      onPressed: () async {
                        //기다리는 동안 로딩창 띄우기
                        loadingDialog(context);

                        //posts가 비어있을때(첫 호출때만 데이터 로딩)
                        print(postListController.postList);
                        if (postListController.postList.length == 0) {
                          await postListController.readPostData();
                        }

                        //화면 이동 전, 로딩 다이어로그 pop!
                        Navigator.of(context, rootNavigator: true).pop();

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CommunityScreen(),
                          ),
                        );

                        print('커뮤니티 페이지로 넘어 갑니다');
                      },
                      icon: Image.asset(
                        'assets/사교지수.png',
                        width: 70.w,
                        height: 70.h,
                        //fit: BoxFit.cover,
                      ),
                    ),
                    Text(
                      languageController.community,
                      style: TextStyle(
                        color: Colors.black,
                        letterSpacing: 2.w,
                        //fontFamily: 'Neo',
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 10.h,
                    ),
                    IconButton(
                      onPressed: () {
                        print("도움말");
                        // TODO 다이어로그 띄워서 도움말 표시
                      },
                      icon: Image.asset(
                        'assets/도움말_icon.png',
                        width: 50.w,
                        height: 50.h,
                        //fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      languageController.helpDialog,
                      style: TextStyle(
                        color: Colors.black,
                        letterSpacing: 2.w,
                        //fontFamily: 'Neo',
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),

      //drawer: const Drawer(),
    );
  }
}

foo() async {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  print("asd");
  await _firestore.collection("cars").doc("123456789").set({
    "brand": "Genesis",
    "name": "G70",
    "price": 5000,
  });
}
