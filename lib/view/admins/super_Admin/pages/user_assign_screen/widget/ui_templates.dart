import 'package:canteen_superadmin_website/core/colors/colors.dart';
import 'package:flutter/material.dart';

class TableHeaderWidget extends StatelessWidget {
  final String headerTitle;
  final double? width;

  const TableHeaderWidget({
    this.width,
    required this.headerTitle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: width,
      decoration: BoxDecoration(
          color: const Color.fromARGB(250, 250, 250, 252),
          border: Border.symmetric(
            horizontal: BorderSide(color: cBlack.withOpacity(0.5)),
          )),
      child: Center(
        child: Text(
          headerTitle,
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
        ),
      ),
    );
  }
}

class DataContainerWidget2 extends StatelessWidget {
  final MainAxisAlignment rowMainAccess;
  final int index;
  final String headerTitle;
  final double? width;
  final Color? color;
  final double? height;

  const DataContainerWidget2({
    required this.index,
    this.color,
    this.width,
    this.height,
    required this.headerTitle,
    super.key,
    required this.rowMainAccess,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: width,
      decoration: BoxDecoration(
        color: color,
      ),
      child: Row(
        mainAxisAlignment: rowMainAccess,
        children: [
          Text(
            headerTitle,
            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 12.5),
          ),
        ],
      ),
    );
  }
}
