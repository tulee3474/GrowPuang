import 'package:growpuang/controller/post_controller.dart';
import 'package:growpuang/controller/post_list_controller.dart';
import 'package:growpuang/controller/personal_contoller.dart';
import 'package:growpuang/mainPage.dart';
import 'package:growpuang/model/firebase_read_write.dart';
import 'package:flutter/material.dart';
import 'package:growpuang/styles.dart';
import 'package:growpuang/view/community_screen.dart';
import 'package:growpuang/class/post.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:growpuang/view/community_screen.dart';
import 'package:growpuang/view/home_screen.dart';

class WrittenPostPage extends StatefulWidget {
  Post post = Post('', 0, '', [], [], [], 0, '', 1);
  int index = 0;

  WrittenPostPage(this.post, this.index);

  @override
  _WrittenPostPageState createState() => _WrittenPostPageState();
}

class _WrittenPostPageState extends State<WrittenPostPage> {
  //TextEditingController commentWriterController = TextEditingController();
  TextEditingController commentController = TextEditingController();
  TextEditingController reportController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  final postController = Get.put(PostController());
  final postListController = Get.put(PostListController());
  final personalController = Get.put(PersonalController());

  void checkCountedCommentWriterList() {
    postController.countedCommentWriterList = [];

    for (int i = 0; i < postController.post.commentWriterList.length; i++) {
      if (!postController.countedCommentWriterList
          .contains(postController.post.commentWriterList[i])) {
        postController.countedCommentWriterList
            .add(postController.post.commentWriterList[i]);
      }
    }
  }

  @override
  initState() {
    postController.post = widget.post;
    postController.index = widget.index;

    //만약 작성자가 게시글을 보고있는 경우, 수정이랑 삭제도 보여져야함'
    if (postController.post.postWriter == personalController.userId as String) {
      postController.threeDotsCommendList = ["새로고침", "신고", "수정", "삭제"];
    }

    checkCountedCommentWriterList();

    super.initState();
    // commentController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: mainColor,
        child: Icon(Icons.thumb_up),
        onPressed: () {
          if (postController.post.recommendList
              .contains(personalController.userId as String)) {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                Future.delayed(
                  Duration(seconds: 1),
                  () {
                    Navigator.of(context, rootNavigator: true).pop();
                  },
                );
                return AlertDialog(
                  content: SizedBox(
                    width: 250.w,
                    height: 100.h,
                    child: Center(
                      child: Text(
                        "이미 좋아요를 누르셨습니다.",
                        style: TextStyle(
                          color: Colors.black,
                          letterSpacing: 2.0,
                          fontFamily: 'Neo',
                          //fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            setState(
              () {
                fb_add_recommend(
                    postController.post.postNum,
                    personalController.userId as String,
                    postController
                        .post.recommendNum); // 좋아요 추가 - 게시글 제목, 누른사람, 기존 좋아요 개수
                postController.post.recommendNum++;
                postController.post.recommendList
                    .add(personalController.userId as String);
              },
            );
          }
        },
      ),
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
        //     child: Image.asset(IconsPath.logo, fit: BoxFit.contain),
        //   ),
        // ),
        actions: [
          DropdownButton(
            items: postController.threeDotsCommendList
                .map((e) => DropdownMenuItem(
                      value: e,
                      child: Text(e),
                    ))
                .toList(),
            icon: Image.asset('assets/three_dots.png'),
            //hint: Text('${postController.selectMinute}'),
            onChanged: (value) {
              setState(
                () {
                  String selectedMenu = value!;
                  if (selectedMenu == "새로고침") {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WrittenPostPage(
                            postController.post, postController.index),
                      ),
                    );
                    print("게시글 새로고침");
                  } else if (selectedMenu == "신고") {
                    print("게시글 신고");
                    postReport();
                  } else if (selectedMenu == "수정") {
                    print("게시글 수정");
                    modifyContent();
                  } else if (selectedMenu == "삭제") {
                    print("게시글 삭제");
                    deletePost();
                  }
                },
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Flexible(
                      child: SelectableText.rich(
                        TextSpan(
                          text: (postController.post.postTitle),
                          style: TextStyle(
                            color: Colors.black,
                            letterSpacing: 2.0,
                            //height: 1.4,
                            fontFamily: 'Neo',
                            fontSize: 15.sp,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(10, 15, 0, 0),
                      child: Text(
                        "익명의 글쓴이${postController.index + 1}",
                        style: TextStyle(
                          color: Colors.black,
                          letterSpacing: 2.0,
                          fontFamily: 'Neo',
                          fontSize: 10.sp,
                          //fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                height: 7.h,
                decoration: BoxDecoration(
                  color: Color(0xffF4F4F4),
                  border: Border(
                    top: BorderSide(width: 1.0, color: primaryBold8),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Flexible(
                      child: SelectableText.rich(
                        TextSpan(
                          text: (postController.post.postContent),
                          style: TextStyle(
                            color: Colors.black,
                            letterSpacing: 2.0,
                            //height: 1.4,
                            fontFamily: 'Neo',
                            fontSize: 15.sp,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50.h,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: 10.h,
                    ),
                    Container(
                      child: Text(
                        "좋아요 : ${postController.post.recommendNum}",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Colors.black,
                          letterSpacing: 2.0,
                          fontFamily: 'Neo',
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                height: 7.h,
                decoration: BoxDecoration(
                  color: Color(0xffF4F4F4),
                  border: Border(
                    top: BorderSide(width: 1.0, color: primaryBold8),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  //mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      child: Text(
                        "댓글",
                        style: TextStyle(
                          color: Colors.black,
                          letterSpacing: 2.0,
                          fontFamily: 'Neo',
                          fontSize: 13.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              for (int i = 0; i < postController.post.commentList.length; i++)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceBetween, // "X" 버튼을 오른쪽으로 정렬

                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        child: SelectableText.rich(
                          TextSpan(
                            text:
                                ("익명 ${postController.countedCommentWriterList.indexOf(postController.post.commentWriterList[i]) + 1} : ${postController.post.commentList[i]}"),
                            style: TextStyle(
                              color: mainTextColor,
                              letterSpacing: 2.0,
                              //height: 1.4,
                              fontFamily: 'Neo',
                              fontSize: 11.sp,
                            ),
                          ),
                        ),
                      ),
                      if (postController.post.commentWriterList[i] ==
                          personalController.userId as String)
                        ConstrainedBox(
                          constraints: BoxConstraints(
                              maxWidth: 20.w,
                              maxHeight: 20.h), // 아이콘 버튼의 최대 크기 설정
                          child: IconButton(
                            icon: Icon(Icons.close),
                            iconSize: 10.w,
                            onPressed: () {
                              deleteComment(i);
                            },
                          ),
                        ),
                    ],
                  ),
                ),
              SizedBox(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                height: 7.h,
                decoration: BoxDecoration(
                  color: Color(0xffF4F4F4),
                  border: Border(
                    top: BorderSide(width: 1.0, color: primaryBold8),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width: 115.w,
                  height: 55.h,
                  child: ElevatedButton(
                    child: Text(
                      '댓글 작성',
                      style: TextStyle(
                        letterSpacing: 2.0,
                        fontFamily: 'Neo',
                        fontSize: 11.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: ButtonStyle(),
                    onPressed: () {
                      showDialog(
                        context: context,
                        barrierDismissible: true,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            content: SizedBox(
                              width: 300.w,
                              height: 200.h,
                              child: SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    TextField(
                                      maxLines: 1,
                                      maxLength: 100,
                                      controller: commentController,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          labelText: '댓글 내용'),
                                    ),
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    Container(
                                      width: 110.w,
                                      height: 60.h,
                                      child: ElevatedButton(
                                        child: Text('댓글 작성',
                                            style: TextStyle(
                                              letterSpacing: 2.0,
                                              fontFamily: 'Neo',
                                              fontSize: 11.sp,
                                              fontWeight: FontWeight.bold,
                                            )),
                                        style: ButtonStyle(),
                                        onPressed: () {
                                          setState(() {
                                            postController
                                                .post.commentWriterList
                                                .add(personalController.userId
                                                    as String);
                                            postController.post.commentList
                                                .add(commentController.text);

                                            fb_add_comment(
                                                postController.post.postNum,
                                                postController
                                                    .post.commentList.last,
                                                postController.post
                                                    .commentWriterList); // 댓글 추가 - 게시글 제목, 댓글 내용, 댓글 작성자 리스트

                                            commentController.text = '';

                                            //checkCountedCommentWriterList 업데이트
                                            checkCountedCommentWriterList();
                                          });
                                          //팝업 창 꺼짐
                                          Navigator.of(context,
                                                  rootNavigator: true)
                                              .pop();
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  postReport() {
    showDialog(
      context: context,
      builder: (context) {
        //AlertDialog는 StateLess라서 setState가 안먹음. 따라서 StatefulBuilder로 감싸줌.
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return AlertDialog(
              content: SizedBox(
                height: 350.h,
                width: 350.w,
                child: Column(
                  children: [
                    SizedBox(height: 20.h),
                    Text("게시글 신고",
                        style: TextStyle(
                          fontFamily: "Neo",
                          fontWeight: FontWeight.bold,
                          fontSize: 18.sp,
                        )),
                    SizedBox(height: 20.h),
                    Expanded(
                      child: Container(
                        child: TextField(
                          controller: reportController,
                          maxLines: 3,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            label: Text(
                              '신고 사유를 적어주세요.(최대 3줄)',
                              style: TextStyle(
                                fontFamily: "Neo",
                                //fontWeight: FontWeight.bold,
                                fontSize: 15.sp,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 50.h,
                            child: ElevatedButton(
                              onPressed: () async {
                                // 여기서 DB 연결 !!!

                                // await reportSave(
                                //     postController.post.postTitle,
                                //     postController.post.postNum.toString(),
                                //     postController.post.postContent,
                                //     reportController.text,
                                //     postController.post.postWriter,
                                //     token!);

                                //이러면 showDialog가 pop될걸?
                                Navigator.of(context, rootNavigator: true)
                                    .pop();

                                reportController.text = "";
                              },
                              child: Text(
                                "신고 완료",
                                style: TextStyle(
                                  fontFamily: "Neo",
                                  fontWeight: FontWeight.bold,
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
            );
          },
        );
      },
    );
  }

  modifyContent() {
    //컨트롤러에 게시글 내용 옮겨놓기
    contentController.text = postController.post.postContent;

    showDialog(
      context: context,
      builder: (context) {
        //AlertDialog는 StateLess라서 setState가 안먹음. 따라서 StatefulBuilder로 감싸줌.
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return AlertDialog(
              content: SizedBox(
                height: 350.h,
                width: 350.w,
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    Text("게시글 수정",
                        style: TextStyle(
                          fontFamily: "Neo",
                          fontWeight: FontWeight.bold,
                          fontSize: 18.sp,
                        )),
                    SizedBox(height: 20.h),
                    Expanded(
                      child: Container(
                        height: 200.h,
                        child: TextField(
                          controller: contentController,
                          maxLines: 7,
                          maxLength: 500,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            label: Text(
                              '게시글 내용을 적어주세요.',
                              style: TextStyle(
                                fontFamily: "Neo",
                                //fontWeight: FontWeight.bold,
                                fontSize: 15.sp,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 50.h,
                            child: ElevatedButton(
                              onPressed: () {
                                // 여기서 DB 연결 !!!

                                postController.post.postContent =
                                    contentController.text;

                                fb_modify_post(
                                    postController.post.postTitle,
                                    postController.post.postNum,
                                    postController.post.postContent);

                                //이러면 showDialog가 pop될걸?
                                Navigator.of(context, rootNavigator: true)
                                    .pop();

                                contentController.text = "";

                                //끝나고 새로고침 한 번!
                                // Navigator.pop(context);
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (context) => WrittenPostPage(
                                //         postController.post,
                                //         postController.index),
                                //   ),
                                // );
                              },
                              child: Text(
                                "수정 완료",
                                style: TextStyle(
                                  fontFamily: "Neo",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15.sp,
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
            );
          },
        );
      },
    );
  }

  deletePost() {
    showDialog(
      context: context,
      builder: (context) {
        //AlertDialog는 StateLess라서 setState가 안먹음. 따라서 StatefulBuilder로 감싸줌.
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return AlertDialog(
              content: SizedBox(
                height: 250.h,
                width: 350.w,
                child: Column(
                  children: [
                    SizedBox(height: 20.h),
                    Text("게시글 삭제",
                        style: TextStyle(
                          fontFamily: "Neo",
                          fontWeight: FontWeight.bold,
                          fontSize: 18.sp,
                        )),
                    SizedBox(height: 10.h),
                    Text("정말 삭제하시겠습니까??",
                        style: TextStyle(
                          fontFamily: "Neo",
                          //fontWeight: FontWeight.bold,
                          fontSize: 15.sp,
                        )),
                    SizedBox(height: 20.h),
                    Text('제목 : ' + postController.post.postTitle,
                        style: TextStyle(
                          fontFamily: "Neo",
                          //fontWeight: FontWeight.bold,
                          fontSize: 12.sp,
                        )),
                    SizedBox(height: 20.h),
                    Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 50.h,
                            child: ElevatedButton(
                              onPressed: () {
                                // 여기서 DB 연결 !!!

                                //전체 게시글 목록에서도 삭제
                                postListController
                                    .deletePostList(postController.post);

                                fb_delete_post(postController.post.postNum,
                                    postListController.postList);

                                //이러면 showDialog가 pop될걸?
                                Navigator.of(context, rootNavigator: true)
                                    .pop();

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
                                      builder: (context) => CommunityScreen()),
                                );
                              },
                              child: Text(
                                "삭제",
                                style: TextStyle(
                                  fontFamily: "Neo",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15.sp,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: SizedBox(
                            height: 50.h,
                            child: ElevatedButton(
                              onPressed: () {
                                //이러면 showDialog가 pop될걸?
                                Navigator.of(context, rootNavigator: true)
                                    .pop();
                              },
                              child: Text(
                                "취소",
                                style: TextStyle(
                                  fontFamily: "Neo",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15.sp,
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
            );
          },
        );
      },
    );
  }

  deleteComment(int commentIndex) {
    showDialog(
      context: context,
      builder: (context) {
        //AlertDialog는 StateLess라서 setState가 안먹음. 따라서 StatefulBuilder로 감싸줌.
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return AlertDialog(
              content: SizedBox(
                height: 250.h,
                width: 350.w,
                child: Column(
                  children: [
                    SizedBox(height: 20.h),
                    Text("댓글 삭제",
                        style: TextStyle(
                          fontFamily: "Neo",
                          fontWeight: FontWeight.bold,
                          fontSize: 18.sp,
                        )),
                    SizedBox(height: 10.h),
                    Text("정말 삭제하시겠습니까??",
                        style: TextStyle(
                          fontFamily: "Neo",
                          //fontWeight: FontWeight.bold,
                          fontSize: 15.sp,
                        )),
                    SizedBox(height: 20.h),
                    // Text(
                    //     '내용 : ' + postController.post.commentList[commentIndex],
                    //     style: TextStyle(
                    //       fontFamily: "Neo",
                    //       //fontWeight: FontWeight.bold,
                    //       fontSize: 12.sp,
                    //     )),
                    SizedBox(height: 20.h),
                    Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 50.h,
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  postController.post.commentWriterList
                                      .removeAt(commentIndex);
                                  postController.post.commentList
                                      .removeAt(commentIndex);

                                  fb_delete_comment(
                                      postController.post.postNum,
                                      postController.post.commentList,
                                      postController.post
                                          .commentWriterList); // 댓글 추가 - 게시글 제목, 댓글 내용, 댓글 작성자 리스트

                                  //checkCountedCommentWriterList 업데이트
                                  checkCountedCommentWriterList();
                                });

                                //이러면 showDialog가 pop될걸?
                                Navigator.of(context, rootNavigator: true)
                                    .pop();

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
                                      builder: (context) => CommunityScreen()),
                                );
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => WrittenPostPage(
                                        postController.post,
                                        postController.index),
                                  ),
                                );
                              },
                              child: Text(
                                "삭제",
                                style: TextStyle(
                                  fontFamily: "Neo",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15.sp,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: SizedBox(
                            height: 50.h,
                            child: ElevatedButton(
                              onPressed: () {
                                //이러면 showDialog가 pop될걸?
                                Navigator.of(context, rootNavigator: true)
                                    .pop();
                              },
                              child: Text(
                                "취소",
                                style: TextStyle(
                                  fontFamily: "Neo",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15.sp,
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
            );
          },
        );
      },
    );
  }
}
