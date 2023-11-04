import 'package:growpuang/class/post.dart';
import 'package:growpuang/model/firebase_read_write.dart';
import 'package:get/get.dart';

class PostListController extends GetxController {
  RxList<Post> _postList = <Post>[].obs;

  Future readPostData() async {
    var read = ReadController();

    _postList.value = await read.fb_read_all_post() as List<Post>; // List<Post>
  }

  List<Post> get postList => _postList;

  set postList(List<Post> value) {
    _postList = value.obs;
  }

  void deletePostList(Post data) {
    _postList.removeWhere((item) => item.postNum == data.postNum);
  }

  // void deletePostListByIndex(int index) {
  //   _postList.removeWhere((item) => item.postNum == _postList[index].postNum);
  // }
}
