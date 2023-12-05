import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:growpuang/controller/language_controller.dart';
import 'package:growpuang/controller/personal_contoller.dart';
import 'package:growpuang/view/widget/appBar.dart';
import 'package:growpuang/view/widget/end_dialog.dart';
import 'package:growpuang/view/widget/graduate_dialog.dart';
import 'package:growpuang/view/widget/navigateBar.dart';
import 'controller/post_list_controller.dart';

class MainPage extends StatelessWidget {
  final languageController = Get.put(LanguageController());
  final postListController = Get.put(PostListController());
  final personalController = Get.put(PersonalController());

  MainPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // 여기에서 팝업을 표시하거나 확인 로직을 추가할 수 있습니다.
        bool shouldClose = (await showExitPopup(context)) as bool;
        return shouldClose;
      },
      child: Scaffold(
        appBar: null,
        body: Stack(
          children: [
            appBar(),


            Positioned(
              left: 10.w,
              right: 10.w,
              top: 250.h,
              child: Center(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        personalController.option1 +
                            ' ' +
                            personalController.option2,
                        style: TextStyle(
                          color: Color(0xFF143264),
                          fontSize: 30.sp,
                          fontFamily: 'YourFontFamily',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Positioned(
                      top: 40.h,
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: GestureDetector(
                          onTap: () {
                            showDialog(
                                context: context,
                                barrierDismissible: true,
                                builder: (BuildContext context) {
                                  return GraduateDialog();
                                });
                          },
                          child: Container(
                            width: 270.w,
                            height: 230.h,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                    'assets/images/${personalController.pick_img}'),
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 30.h),
                    Table(
                      defaultVerticalAlignment:
                          TableCellVerticalAlignment.middle,
                      children: [
                        buildTableRow(
                            languageController.language == '한국어' ? '체력' : 'HP',
                            personalController.hpScore,
                            30),
                        buildTableRow(languageController.intellect,
                            personalController.intellectScore, 30),
                        buildTableRow(languageController.activity,
                            personalController.participateActList.length, 6),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            navigateBar(),
          ],
        ),
      ),
    );
  }

  Future<Future> showExitPopup(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return EndDialog();
      },
    );
  }

  TableRow buildTableRow(String label, int value, int total) {
    return TableRow(
      children: [
        buildTableCell(label),
        buildProgressBarTableCell(value, total),
        buildTextTableCell('$value / $total'),
      ],
    );
  }

  TableCell buildTableCell(String label) {
    return TableCell(
      child: Container(
        padding: EdgeInsets.all(8.0),
        alignment: Alignment.center,
        child: Text(
          label,
          style: TextStyle(
            color: Color(0xFF143264),
            fontSize: 20.sp,
            fontFamily: 'YourFontFamily',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  TableCell buildProgressBarTableCell(int value, int total) {
    return TableCell(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 0.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30.0),
          child: LinearProgressIndicator(
            minHeight: 20.0.h,
            value: value / total,
            valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF143264)),
          ),
        ),
      ),
    );
  }

  TableCell buildTextTableCell(String text) {
    return TableCell(
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(8.0),
        child: Text(
          text,
          style: TextStyle(
            color: Color(0xFF143264),
            fontSize: 20.sp,
            fontFamily: 'YourFontFamily',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
