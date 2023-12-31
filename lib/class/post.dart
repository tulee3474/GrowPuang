class Post {
  String postTitle = ""; // 게시물 제목
  int postNum = 0; // 게시물 넘버
  String postWriter = ""; // 작성자 이름
  String postWriterUserId = ""; // 작성자 이름
  List<String> commentList = []; // 댓글 리스트
  List<String> commentWriterList = []; // 댓글 작성자 리스트
  List<String> commentWriterUserIdList = [];
  List<String> recommendList = []; // 좋아요 누른 사람 리스트
  int recommendNum = 0; // 좋아요 수
  String postContent = ''; //게시물 내용
  int sortOpt = 1; //소트 방법 (게시물 카테고리) -> 1 or 2 or 3

  Post(
    this.postTitle,
    this.postNum,
    this.postWriter,
    this.postWriterUserId,
    this.commentList,
    this.commentWriterList,
    this.commentWriterUserIdList,
    this.recommendList,
    this.recommendNum,
    this.postContent,
    this.sortOpt,
  );

  Map<String, dynamic> toJson() => {
        'postTitle': postTitle,
        'postNum': postNum,
        'postWriter': postWriter,
        'commentList': commentList,
        'commentWriterList': commentWriterList,
        'recommendList': recommendList,
        'recommendNum': recommendNum,
        'postContent': postContent,
        'sortOpt': sortOpt,
      };
}
