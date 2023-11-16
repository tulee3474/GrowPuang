import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:growpuang/view/home_screen.dart';
import 'package:growpuang/view/knowledge/firstQuizPage.dart';
import 'package:growpuang/view/widget/appBar.dart';
import 'package:growpuang/view/widget/navigateBar.dart';

class TestKnowledgeMain extends StatefulWidget {
  @override
  State<TestKnowledgeMain> createState() => _TestKnowledgeMainState();
}

class _TestKnowledgeMainState extends State<TestKnowledgeMain> {
  Color _color = Colors.white;

  void _changeButtonColor() {
    setState(() {
      // Change the button color to a new color when pressed
      _color = _color == Colors.white ? Color(0xFF143264) : Colors.white;
    });
  }

  int state = 0;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: null,
      body: Stack(
        children: [
          appBar(),
          Column(
            children: [
              Expanded(
                flex: 2,
                child: Container(),
              ),
              Expanded(
                flex: 7,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(20.w, 50.w, 20.h, 200.h),
                  child: Container(
                    decoration: const BoxDecoration(color: Colors.white),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("수강할과목을 골라주세요"),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                              onTap: () {_changeButtonColor();},
                              child: Container(
                                child: Text(
                                  "자료구조",
                                ),
                                color: _color,
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  // Change the button color to a new color when pressed
                                  _color = _color == Colors.white ? Color(0xFF143264) : Colors.white;
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.symmetric(horizontal: 50.w),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(2),
                                ),
                                backgroundColor: _color,
                                foregroundColor: Colors.white,
                              ),
                              child: const Text(
                                "자료구조",
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          navigateBar(),
        ],
      ),
    );
  }
}
