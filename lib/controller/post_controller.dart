import 'package:growpuang/class/post.dart';
import 'package:get/get.dart';

class PostController extends GetxController {
  Rx<Post> _post = Post('', 0, '', [], [], [], 0, '').obs;
  Rx<int> _index = 0.obs;
  RxList<String> _countedCommentWriterList = <String>[].obs;
  RxList<String> _threeDotsCommendList = <String>["새로고침", "신고"].obs;

  Post get post => _post.value;

  set post(Post value) {
    _post = value.obs;
  }

  int get index => _index.value;

  set index(int value) {
    _index = value.obs;
  }

  List<String> get countedCommentWriterList => _countedCommentWriterList;

  set countedCommentWriterList(List<String> value) {
    _countedCommentWriterList = value.obs;
  }

  List<String> get threeDotsCommendList => _threeDotsCommendList.value;

  set threeDotsCommendList(List<String> value) {
    _threeDotsCommendList = value.obs;
  }
}
