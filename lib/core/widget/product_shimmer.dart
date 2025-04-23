import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:shimmer/shimmer.dart';

Widget productShimmerEffect() {
  return Shimmer.fromColors(
    baseColor: Colors.grey[300]!,
    highlightColor: Colors.grey[100]!,
    child: GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 8.w,
        crossAxisSpacing: 5.h,
        mainAxisExtent: 217.h,
      ),
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return Column(
          children: [
            Container(
              height: 180.h,
              width: 155.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.r),
                color: Colors.white,
              ),
            ),
            Gap(5.w),
            Container(width: 145.w, height: 10.h, color: Colors.white),
            Gap(5.w),
            Container(width: 145.w, height: 10.h, color: Colors.white),
          ],
        );
      },
    ),
  );
}
