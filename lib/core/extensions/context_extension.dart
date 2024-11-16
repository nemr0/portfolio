import 'package:flutter/widgets.dart';

extension ContextExtension on BuildContext{
  double get width => MediaQuery.sizeOf(this).width;
  double get height => MediaQuery.sizeOf(this).height;
  bool get mobile => MediaQuery.sizeOf(this).shortestSide < 600;
  bool get portrait => MediaQuery.orientationOf(this) == Orientation.portrait;
  Size get screenUtilSize => mobile || (!mobile && portrait)?const Size(430, 932):const Size(832, 1280);
}