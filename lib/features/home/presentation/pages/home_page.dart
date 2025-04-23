import 'package:e_commerce_task/core/config/app_config.dart';
import 'package:e_commerce_task/core/theme/app_colors.dart';
import 'package:e_commerce_task/core/utils/utils.dart';
import 'package:e_commerce_task/core/widget/custom_product_container.dart';
import 'package:e_commerce_task/core/widget/product_shimmer.dart';
import 'package:e_commerce_task/features/home/presentation/bloc/product_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ProductBloc productBloc;

  @override
  void initState() {
    super.initState();
    productBloc = BlocProvider.of<ProductBloc>(context);
    productBloc.add(const ProductFetchedEvent(endPoint: AppConfig.products));
  }

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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<ProductBloc, ProductState>(
          builder: (context, state) {
            if (state is ProductLoading && productBloc.productList.isEmpty) {
              return productShimmerEffect();
            } else if (state is ProductLoadingFailed) {
              return Center(child: Text(state.message));
            } else if (state is ProductLoaded) {
              if (state.productList.isEmpty) {
                return const Center(child: Text("No products available."));
              }

              return refresh(
                onRefresh: () async {
                  productBloc.add(
                    const ProductFetchedEvent(
                      endPoint: AppConfig.products,
                      isRefresh: true,
                    ),
                  );
                },
                child: NotificationListener<ScrollNotification>(
                  onNotification: (scrollInfo) {
                    if (scrollInfo.metrics.pixels ==
                            scrollInfo.metrics.maxScrollExtent &&
                        !state.hasReachedMax) {
                      productBloc.add(
                        const ProductFetchedEvent(endPoint: AppConfig.products),
                      );
                    }
                    return false;
                  },
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 8.h,
                      crossAxisSpacing: 5.w,
                      mainAxisExtent: 282.h,
                    ),
                    itemCount: state.productList.length,
                    itemBuilder: (BuildContext context, int index) {
                      final product = state.productList[index];
                      return customProductContainer(
                        onTap: () {},
                        image:
                            product.thumbnailImage ??
                            "https://rasanasa.com/public/uploads/all/LwmwQSV6qgOsh0zD0IEMSCdf5mrvOmVDSk1e3bze.png",
                        productName: product.name ?? "",
                        sellingPrice: product.strokedPrice ?? "",
                        mainPrice: product.mainPrice,
                        discount: product.discount,
                        rattings: double.parse(product.rating.toString()),
                      );
                    },
                  ),
                ),
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
