import 'package:flutter/material.dart';

extension PaddingToWidget on Widget {
  Widget setHorizontalPadding(BuildContext context, {required double value}) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: value,
      ),
      child: this,
    );
  }

  Widget setVerticalPadding(BuildContext context, {required double value}) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: value,
      ),
      child: this,
    );
  }

  Widget setSymmetricPadding(BuildContext context,
      {required double horizontal, required double vertical}) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: horizontal,
        vertical: vertical,
      ),
      child: this,
    );
  }

  Widget setOnlyPadding(BuildContext context,
      {double top = 0, double bottom = 0, double right = 0, double left = 0}) {
    return Padding(
      padding: EdgeInsets.only(
        top: top,
        bottom: bottom,
        right: right,
        left: left,
      ),
      child: this,
    );
  }
}
