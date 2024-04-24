import 'package:canteen_superadmin_website/core/colors/colors.dart';
import 'package:canteen_superadmin_website/core/fonts/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          colors: [Color(0xff232526), Color(0xff414345)],
        )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFontWidget(
              text: 'LEPTON TEST PAGE',
              fontsize: 60,
              color: cWhite,
            ),
            SizedBox(
                height: 300,
                width: 300,
                child: LottieBuilder.asset(
                    'web_images/lottie/under_construction.json'))
          ],
        ),
      ),
    );
  }
}
