import 'package:flutter/material.dart';
import 'package:growpuang/view/widget/mbti/MbtiDiamond.dart';

import 'FirstAppBar.dart';

class CommonAppBar extends StatelessWidget {
  const CommonAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const FirstAppBar(),
        MbtiDiamond.goUp(),
      ],
    );
  }
}
