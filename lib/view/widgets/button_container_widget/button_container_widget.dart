// ignore_for_file: must_be_immutable

import 'package:canteen_superadmin_website/core/colors/colors.dart';
import 'package:flutter/widgets.dart';

import '../../../core/fonts/google_poppins.dart';

class ButtonContainerWidget extends StatelessWidget {
  void Function() onTap;
  final String text;
  final double width;
  final double height;
  final double fontSize;

  ButtonContainerWidget(
      {super.key,
      required this.text,
      required this.width,
      required this.height,
      required this.fontSize,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: const BoxDecoration(
          color: themeColorBlue,
          borderRadius: BorderRadius.horizontal(),
        ),
        width: width,
        height: height,
        child: Center(
          child: GooglePoppinsWidgets(
            textAlign: TextAlign.center,
            color: cWhite,
            fontWeight: FontWeight.w500,
            text: text,
            fontsize: fontSize,
          ),
        ),
      ),
    );
  }
}

class ColorButtonContainerWidget extends StatelessWidget {
  final String text;
  final Color color;

  const ColorButtonContainerWidget(
      {super.key, required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.horizontal(),
      ),
      width: 180,
      height: 40,
      child: Center(
        child: GooglePoppinsWidgets(
          textAlign: TextAlign.center,
          color: cWhite,
          fontWeight: FontWeight.bold,
          text: text,
          fontsize: 14,
        ),
      ),
    );
  }
}
