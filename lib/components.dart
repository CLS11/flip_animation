import 'package:flutter/material.dart';

enum CircleSide {
  left,
  right,
}

extension ToPath on CircleSide {
  Path toPath(Size size) {
    final path = Path();

    //Offset to begin the drawing from
    late Offset offset;
    late bool clockwise;

    switch (this) {
      case CircleSide.left:
        path.moveTo(size.width, 0);
        offset = Offset(size.width, size.height);
        clockwise = false;
        break;
      case CircleSide.right:
        offset = Offset(0, size.height);
        clockwise = true;
        break;
    }
    path
      ..arcToPoint(
        offset,
        radius: Radius.elliptical(size.width / 2, size.height / 2),
        clockwise: clockwise,
      )

      //closing the path
      ..close(); //path.close();
    return path;
  }
}
