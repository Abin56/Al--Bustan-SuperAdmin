import 'package:canteen_superadmin_website/core/colors/colors.dart';
import 'package:canteen_superadmin_website/core/fonts/google_poppins.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

isLoadingBox(BuildContext context) async {
  return showDialog(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: cWhite,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
        content: const SingleChildScrollView(
          child: ListBody(
            children: [],
          ),
        ),
      );
    },
  );
}

class LoadingLottieWidget extends StatelessWidget {
  final double height;
  final double width;
  const LoadingLottieWidget({
    super.key,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GooglePoppinsWidgets(
            text: 'Please Wait ...',
            fontsize: 16,
            fontWeight: FontWeight.bold,
          ),
          Expanded(
            child: SizedBox(
              width: 80,
              child: LottieBuilder.asset(
                'web_images/png/Animation - 1702360112312.json',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
