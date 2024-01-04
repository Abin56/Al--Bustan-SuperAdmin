import 'package:canteen_superadmin_website/view/colors/colors.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

class PackageSetUpWidget extends StatelessWidget {
  final int index;
  const PackageSetUpWidget({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      decoration: BoxDecoration(
          color: index % 2 == 0
              ? Colors.grey.withOpacity(0.3)
              : Colors.blue.withOpacity(0.3),
          border: Border.all(color: cGrey.withOpacity(0.2))),
      child: Center(
          child: DropdownSearch(
        items: const ['Pieces', 'Packet', 'Cartoon'],
      )),
    );
  }
}