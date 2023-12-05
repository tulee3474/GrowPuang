import 'package:flutter/material.dart';
import 'FirstAppBar.dart';
import 'MbtiDiamond.dart';

class MbtiBackground extends StatelessWidget {
  const MbtiBackground({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: [
        _buildFirstAppBar(),
        _buildMbtiDiamond(),
      ],
    );
  }

  Widget _buildFirstAppBar() {
    return const FirstAppBar();
  }

  Widget _buildMbtiDiamond() {
    return MbtiDiamond();
  }
}