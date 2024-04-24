import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PrimaryFontWidget extends StatelessWidget {
  const PrimaryFontWidget(
      {super.key,
      required this.text,
      required this.fontSize,
      required this.fontweight,
      required this.color});

  final String text;
  final double fontSize;
  final FontWeight fontweight;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.poppins(
          fontSize: fontSize, fontWeight: fontweight, color: color),
    );
  }
}
