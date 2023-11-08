import 'dart:async';
import 'package:growpuang/class/post.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:growpuang/controller/personal_contoller.dart';

//Write하는 부분

//Community
void fb_add_post(postTitle, postNum, postWriter, postContent) {
  //합쳐쓰기
  FirebaseFirestore.instance.collection("커뮤니티").doc('$postNum').set({
    'postTitle': postTitle,
    'postNum': postNum,
    'postWriter': postWriter,
    'commentList': [], //첫 작성이니까
    'commentWriterList': [], //첫 작성이니까
    'recommendList': [], //첫 작성이니까
    'recommendNum': 0,
    'postContent': postContent,
  }, SetOptions(merge: true));

  //게시물 목록에 이름 작성
  FirebaseFirestore.instance.collection("커뮤니티").doc("게시물목록").update({
    "게시물": FieldValue.arrayUnion([postNum]),
  });
  print("파이어베이스 업로드 완료");
}

void fb_modify_post(postTitle, postNum, postContent) {
  //합쳐쓰기
  FirebaseFirestore.instance.collection("커뮤니티").doc('$postNum').set({
    'postTitle': postTitle,
    'postContent': postContent,
  }, SetOptions(merge: true));

  print("파이어베이스 업로드 완료");
}

fb_delete_post(postNum, posts) {
  FirebaseFirestore.instance.collection("커뮤니티").doc('$postNum').delete();

  List<int> postNumList = [];
  for (int i = 0; i < posts.length; i++) {
    postNumList.add(posts[i].postNum);
  }

  //게시물 목록에서도 삭제
  FirebaseFirestore.instance.collection("커뮤니티").doc("게시물목록").set({
    '게시물': postNumList,
  }, SetOptions(merge: true));
}

void fb_add_comment(postNum, comment, commentWriterList) {
  FirebaseFirestore.instance.collection("커뮤니티").doc('$postNum').update({
    "commentList": FieldValue.arrayUnion([comment]),
  });
  FirebaseFirestore.instance.collection("커뮤니티").doc('$postNum').set({
    'commentWriterList': commentWriterList,
  }, SetOptions(merge: true));
  // 아래 방법은 중복 토큰이 저장 안됨. 할 수 없이 리스트 전체를 저장함
  // FirebaseFirestore.instance.collection("커뮤니티").doc(postTitle).update({
  //   "commentWriterList": FieldValue.arrayUnion([commentWriter]),
  // });

  print("파이어베이스 업로드 완료");
}

fb_delete_comment(postNum, commentList, commentWriterList) {
  //commentList, commentWriterList를 둘 다 덮어쓰기 하는 방법으로
  FirebaseFirestore.instance.collection("커뮤니티").doc('$postNum').set({
    'commentList': commentList,
  }, SetOptions(merge: true));

  FirebaseFirestore.instance.collection("커뮤니티").doc('$postNum').set({
    'commentWriterList': commentWriterList,
  }, SetOptions(merge: true));
}

void fb_add_recommend(postNum, recommender, recommendNum) {
  FirebaseFirestore.instance.collection("커뮤니티").doc('$postNum').update({
    "recommendList": FieldValue.arrayUnion([recommender]),
  });

  FirebaseFirestore.instance.collection("커뮤니티").doc('$postNum').set({
    'recommendNum': recommendNum + 1,
  }, SetOptions(merge: true));

  print("파이어베이스 업로드 완료");
}

fb_delete_recommend(postNum, recommendList, recommendNum) {
  //recommendList 덮어쓰기 하는 방법으로
  FirebaseFirestore.instance.collection("커뮤니티").doc('$postNum').set({
    'recommendList': recommendList,
  }, SetOptions(merge: true));

  FirebaseFirestore.instance.collection("커뮤니티").doc('$postNum').set({
    'recommendNum': recommendNum - 1,
  }, SetOptions(merge: true));
}

//
//
//
//
//
//
//
//Read하는 부분
class ReadController extends GetxController {
  final db = FirebaseFirestore.instance;

  //Community
  Future<List> fb_read_all_post() async {
    //커뮤니티 게시글 확인을 위함
    final personalController = Get.put(PersonalController());
    personalController.communityResult = 0;

    List<Post> data = [];

    List<int> postNumList = await fb_read_post_list() as List<int>;

    for (int i = 0; i < postNumList.length; i++) {
      Post read_data = await fb_read_one_post(postNumList[i]);
      data.add(read_data);
      if (read_data.postWriter == personalController.userId) {
        personalController.communityResult += 1;
      }
    }

    return data;
  }

  Future<List> fb_read_post_list() async {
    var data = await db.collection("커뮤니티").doc("게시물목록").get();

    List<int> postNumList = [];
    for (int i = 0; i < data.data()!['게시물'].length; i++) {
      postNumList.add(data.data()!['게시물'][i] as int);
    }
    return postNumList;
  }

  Future<Post> fb_read_one_post(int targetPostNum) async {
    var data = await db.collection('커뮤니티').doc('$targetPostNum').get();

    String postTitle = data.data()!['postTitle'] as String;
    int postNum = data.data()!['postNum'] as int;
    String postWriter = data.data()!['postWriter'] as String;
    int recommendNum = data.data()!['recommendNum'] as int;
    String postContent = data.data()!['postContent'] as String;

    //Error: Expected a value of type 'List<int>', but got one of type 'List<dynamic>'
    //위 에러 때문에 하나식 일일히 형변환함. 리스트를 통으로 형변환하면 에러
    List<dynamic> commentList2 = data.data()!['commentList'];
    List<String> commentList = [];
    for (int i = 0; i < commentList2.length; i++) {
      commentList.add(commentList2[i] as String);
    }
    List<dynamic> commentWriterList2 = data.data()!['commentWriterList'];
    List<String> commentWriterList = [];
    for (int i = 0; i < commentWriterList2.length; i++) {
      commentWriterList.add(commentWriterList2[i] as String);
    }

    List<dynamic> recommendList2 = data.data()!['recommendList'];
    List<String> recommendList = [];
    for (int i = 0; i < recommendList2.length; i++) {
      recommendList.add(recommendList2[i] as String);
    }

    Post postData = Post(
      postTitle,
      postNum,
      postWriter,
      commentList,
      commentWriterList,
      recommendList,
      recommendNum,
      postContent,
    );

    return postData;
  }

  //부가 함수
  List<int> parseDate(date) {
    List<int> returnData = [];

    returnData.add(date ~/ 10000); //year
    int index1 = date % 10000;
    returnData.add(index1 ~/ 100); //month
    int index2 = date % 100;
    returnData.add(index2); //day

    return returnData;
  }

  List<int> parseTime(time) {
    List<int> returnData = [];

    returnData.add(time ~/ 100000000); //year
    int index1 = time % 100000000;
    returnData.add(index1 ~/ 1000000); //month
    int index2 = time % 1000000;
    returnData.add(index2 ~/ 10000); //day
    int index3 = time % 10000;
    returnData.add(index3 ~/ 100); // hour
    int index4 = time % 100;
    returnData.add(index4); //time

    return returnData;
  }
}
