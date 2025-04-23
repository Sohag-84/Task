import 'package:e_commerce_task/core/theme/app_colors.dart';
import 'package:e_commerce_task/core/widget/custom_product_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.h),
        child: AppBar(
          title: SizedBox(
            height: 40.h,
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: "Search Anything",
                hintStyle: TextStyle(
                  color: AppColors.lightGrey,
                  fontSize: 13.sp,
                ),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 2.w,
                  vertical: 2,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  borderSide: BorderSide(color: AppColors.lightGrey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  borderSide: BorderSide(color: AppColors.lightGrey),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  borderSide: BorderSide(color: AppColors.lightGrey),
                ),
              ),
            ),
          ),
        ),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 8.h,
          crossAxisSpacing: 5.w,
          mainAxisExtent: 282.h,
        ),
        itemCount: 14,
        itemBuilder: (BuildContext context, int index) {
          return customProductContainer(
            onTap: () {},
            image:
                "https://rasanasa.com/public/uploads/all/LwmwQSV6qgOsh0zD0IEMSCdf5mrvOmVDSk1e3bze.png",
            productName: "Allen Solly Regular fit cotton shirt",
            sellingPrice: "35",
            mainPrice: "25",
            discount: "12",
            rattings: 4.5,
          );
        },
      ),
    );
  }
}
