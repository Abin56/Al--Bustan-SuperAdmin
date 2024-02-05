// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextFormFiledWidget extends StatelessWidget {
  TextEditingController? controller = TextEditingController();
  final String title;
  final String hintText;
  final double width;

  Function(String)? onChanged;
  Iterable<String>? autofillHints;
  FocusNode? focusNode;
  String? Function(String?)? validator;
  Function()? onTap;
  TextInputType? keyboardType;
  bool? enabled;
  TextFormFiledWidget({
    required this.hintText,
    required this.title,
    required this.width,
    this.keyboardType,
    this.controller,
    this.autofillHints,
    this.onChanged,
    this.validator,
    this.onTap,
    this.focusNode,
    this.enabled,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enabled,
      focusNode: focusNode,
      style: GoogleFonts.poppins(fontSize: 12),
      onChanged: onChanged,
      autofillHints: autofillHints,
      onTap: onTap,
      validator: validator,
      keyboardType: keyboardType,
      controller: controller,
      decoration: InputDecoration(
        errorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            borderSide: BorderSide(
              width: 1,
              style: BorderStyle.none,
              color: Colors.red,
            )),
        focusedErrorBorder: const OutlineInputBorder(
          // borderRadius: BorderRadius.all(Radius.circular(4)),
          borderSide: BorderSide(
            width: 1,
            style: BorderStyle.none,
            color: Colors.red,
          ),
        ),
        contentPadding: const EdgeInsets.all(8.0),
        enabledBorder:
            const OutlineInputBorder(borderSide: BorderSide(width: 0.4)),
        hintStyle: const TextStyle(fontSize: 13),
        hintText: hintText,
        focusedBorder: const OutlineInputBorder(
          //<-- SEE HERE
          borderSide: BorderSide(width: 1, color: Colors.green),
        ),
      ),
    );
  }
}
