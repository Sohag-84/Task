import 'package:e_commerce_task/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import 'custom_image_container.dart';

Widget customProductContainer({
  required VoidCallback onTap,
  required String image,
  required String productName,
  String? discount,
  String? mainPrice,
  double nameFontSize = 12,
  double imageHeight = 190,
  required String sellingPrice,
  required double rattings,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: 150.w,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.r)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ///product image & favorite icon
          Stack(
            children: [
              customImage(
                imagePath: image,
                height: imageHeight.h,
                width: double.infinity,
              ),

              ///favorite
              Positioned(
                top: 5,
                right: 8,
                child: Container(
                  padding: EdgeInsets.all(5.r),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColors.normalGrey.withValues(alpha: 0.2),
                    shape: BoxShape.circle,
                  ),
                  child: Center(child: Icon(Icons.favorite_border_outlined)),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ///name
                Text(
                  productName,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.darkGrey,
                  ),
                ),
                Gap(2.h),

                ///discount & selling price
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ///price
                    Row(
                      children: [
                        Text(
                          "\$ $sellingPrice",
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),

                        Gap(5.w),
                        discount != null && discount != "-0%"
                            ? Text(
                              "\$$mainPrice",
                              style: TextStyle(
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.normalGrey,
                                decoration: TextDecoration.lineThrough,
                              ),
                            )
                            : const SizedBox(),
                        Gap(5.w),
                        discount != null && discount != "-0%"
                            ? Text(
                              "$discount % OFF",
                              style: TextStyle(
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.orrangeColor,
                              ),
                            )
                            : const SizedBox(),
                      ],
                    ),
                  ],
                ),

                Gap(2.h),
                //ratings section
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.orrangeColor,
                      ),
                      child: Icon(
                        Icons.star_border_outlined,
                        color: AppColors.whiteColor,
                        size: 15.h,
                      ),
                    ),
                    Gap(2.w),
                    Text(
                      "$rattings",
                      style: TextStyle(
                        color: AppColors.darkGrey,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
