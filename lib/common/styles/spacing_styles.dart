import 'package:apps/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class SpacingStyles {
  static const EdgeInsetsGeometry paddingWithAppBarHeight = EdgeInsets.only(
    top: Sizes.appBarHeight,
    left: Sizes.defaultSpace,
    right: Sizes.defaultSpace,
    bottom: Sizes.defaultSpace,
  );
}
