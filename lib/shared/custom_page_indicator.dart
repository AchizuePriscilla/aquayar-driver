import 'package:aquayar_driver/shared/palette.dart';
import 'package:flutter/material.dart';

class CustomPageIndicator extends StatelessWidget {
  final int currentPage;
  final int itemCount;
  final ValueChanged<int> onPageSelected;
  final Color color;

  const CustomPageIndicator({
    Key? key,
    required this.currentPage,
    required this.itemCount,
    required this.onPageSelected,
    required this.color,
  }) : super(
          key: key,
        );
  static const double _kIndicatorHeight = 4.0;
  static const double _kIndicatorWidth = 19.0;

  Widget _buildDot(int index) {
    return Center(
      child: Container(
        width: _kIndicatorWidth,
        height: _kIndicatorHeight,
        decoration: BoxDecoration(
            color: index == currentPage ? Palette.aquayarBlack : color,
            borderRadius: BorderRadius.circular(10)),
        child: InkWell(
          onTap: () => onPageSelected(index),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List<Widget>.generate(itemCount, _buildDot),
    );
  }
}
