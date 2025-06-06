import 'package:any_image_view/any_image_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget customImage({required String imagePath, double? width, double? height}) {
  return AnyImageView(
    imagePath: imagePath,
    height: height ?? height,
    width: width ?? width,
    boxFit: BoxFit.fill,
    borderRadius: BorderRadius.circular(8.r),
  );
}
