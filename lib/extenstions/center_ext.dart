import 'package:flutter/material.dart';

extension CenterToWidget on Widget {
  Widget setToCenter() {
    return Center(
      child: this,
    );
  }
}
