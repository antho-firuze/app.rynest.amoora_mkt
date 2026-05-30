import 'package:flutter/material.dart';

import 'ui_helper.dart';

extension OrientationContext on BuildContext {
  // bool isLandscape({double width = 500, double aspectRatio = 0.5625}) {
  //   // large screen : width > 1000 & height > 1000
  //   final size = MediaQuery.of(this).size;
  //   width = (size.width < 1000 && size.height < 1000) ? 500 : 1100;
  //   aspectRatio = (size.width < 1000 && size.height < 1000) ? 0.5625 : 0.76;
  //   // print("aspectRatio | $aspectRatio");
  //   // print("size.width | ${size.width}");
  //   // print("size.height | ${size.height}");
  //   return size.width > width
  //       ? true
  //       : size.aspectRatio > aspectRatio
  //       ? true
  //       : false;
  // }

  bool get isLandscape => MediaQuery.of(this).size.aspectRatio > 1 ? true : false;

  bool get isBigScreen => screenWidth < 1000 && screenHeight < 1000 ? false : true;
  
  bool get isWidthScreen => screenWidth > 500 ? true : false;
}
