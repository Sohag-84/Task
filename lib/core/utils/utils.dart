import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:e_commerce_task/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

Widget refresh({required VoidCallback onRefresh, required Widget child}) {
  return CustomRefreshIndicator(
    onRefresh: () async {
      onRefresh();
    },
    builder: (context, child, controller) {
      return Stack(
        alignment: Alignment.topCenter,
        children: [
          if (!controller.isIdle)
            Positioned(
              top: 20.0 * controller.value,
              child: SpinKitWaveSpinner(color: AppColors.orrangeColor),
            ),
          Transform.translate(
            offset: Offset(0, 100.0 * controller.value),
            child: child,
          ),
        ],
      );
    },
    child: child,
  );
}
