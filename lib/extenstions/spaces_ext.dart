import 'package:flutter/material.dart';

extension Spaces on num {
  Widget setHorizontalSpace() {
    return SizedBox(
      width: toDouble(),
    );
  }

  Widget setVerticalSpace() {
    return SizedBox(
      height: toDouble(),
    );
  }
}
