// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GoogleHeeboWidget extends StatelessWidget {
  String text;
  double fontsize;
  FontWeight? fontWeight;
  Color? color;
  TextAlign? textAlign;
  double? textScaleFactor;
  TextDecoration? decoration;

  GoogleHeeboWidget({
    required this.text,
    required this.fontsize,
    this.fontWeight,
    this.color,
    this.textAlign,
    this.textScaleFactor,
    this.decoration,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      overflow: TextOverflow.ellipsis,
      style: GoogleFonts.heebo(
        decoration: decoration,
        fontSize: fontsize,
        fontWeight: fontWeight,
        color: color,
      ),
    );
  }
}
