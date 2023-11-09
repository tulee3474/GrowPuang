import 'package:growpuang/class/post.dart';
import 'package:growpuang/controller/language_controller.dart';
import 'package:growpuang/model/firebase_read_write.dart';
import 'package:get/get.dart';

class PostListController extends GetxController {
  final languageController = Get.put(LanguageController());

  RxList<Post> _postList = <Post>[].obs;

  RxString _selectedSort = "전체글".obs;
  RxInt _selectedSortNum = 0.obs;
  RxList<String> _sortList = <String>[].obs;

  Future readPostData() async {
    var read = ReadController();

    _postList.value = await read.fb_read_all_post() as List<Post>; // List<Post>
  }

  List<Post> get postList => _postList;

  set postList(List<Post> value) {
    _postList = value.obs;
  }

  String get selectedSort => _selectedSort.value;

  set selectedSort(String value) {
    _selectedSort.value = value;
  }

  int get selectedSortNum => _selectedSortNum.value;

  set selectedSortNum(int value) {
    _selectedSortNum.value = value;
  }

  List<String> get sortList => _sortList;

  set sortList(List<String> value) {
    _sortList = value.obs;
  }

  void deletePostList(Post data) {
    _postList.removeWhere((item) => item.postNum == data.postNum);
  }

  void initSortOpt() {
    _selectedSort.value = languageController.postSortOpt0;
    _sortList.value = [
      languageController.postSortOpt0,
      languageController.postSortOpt1,
      languageController.postSortOpt2,
      languageController.postSortOpt3,
    ];
  }

  // void deletePostListByIndex(int index) {
  //   _postList.removeWhere((item) => item.postNum == _postList[index].postNum);
  // }
}
