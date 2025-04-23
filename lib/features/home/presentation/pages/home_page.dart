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
      appBar: AppBar(),
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
