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
        mainAxisExtent: 227.h,
      ),
      itemCount: 15,
      itemBuilder: (BuildContext context, int index) {
        return Column(
          children: [
            Container(
              height: 190.h,
              width: 175.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.r),
                color: Colors.white,
              ),
            ),
            Gap(5.w),
            Container(width: 165.w, height: 10.h, color: Colors.white),
            Gap(5.w),
            Container(width: 165.w, height: 10.h, color: Colors.white),
          ],
        );
      },
    ),
  );
}
