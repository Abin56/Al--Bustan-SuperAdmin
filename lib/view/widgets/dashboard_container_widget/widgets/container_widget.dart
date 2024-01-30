import 'package:flutter/material.dart';
import 'package:canteen_superadmin_website/core/colors/colors.dart';


class CustomContainer extends StatelessWidget {
  final double height;
  final double width;
  final Widget? child;

  const CustomContainer({
    Key? key,
    required this.height,
    required this.width,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: AppColors.backGroundColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: AppColors.lightGreyColor,
          width: 1.0,
        ),
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.grey.shade200,
        //     offset: const Offset(2.0, 2.0),
        //     blurRadius: 6.0,
        //     spreadRadius: 2.0,
        //   ),
        //   BoxShadow(
        //     color: Colors.grey.shade200,
        //     offset: const Offset(-1.0, -1.0),
        //     blurRadius: 8.0,
        //     spreadRadius: 2.0,
        //   ),
        // ],
      ),
      child: child,
    );
  }
}
