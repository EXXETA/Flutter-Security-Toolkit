import 'package:flutter/material.dart';

extension PaddedWidget on Widget {
  Widget padding({
    double left = 0.0,
    double top = 0.0,
    double right = 0.0,
    double bottom = 0.0,
  }) =>
      Padding(
        padding: EdgeInsets.only(
          left: left,
          top: top,
          right: right,
          bottom: bottom,
        ),
        child: this,
      );

  Widget paddingAll(double all) =>
      padding(left: all, top: all, right: all, bottom: all);
}
