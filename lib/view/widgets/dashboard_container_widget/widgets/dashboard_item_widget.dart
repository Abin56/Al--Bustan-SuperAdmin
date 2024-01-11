import 'package:flutter/material.dart';
import 'package:canteen_superadmin_website/view/colors/colors.dart';

class DashboardItem extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final Color bgColor;
  final String title;
  final String value;

  const DashboardItem({
    Key? key,
    required this.icon,
    required this.iconColor,
    required this.bgColor,
    required this.title,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: AppColors.lightGreyColor,
              width: 1.0,
            ),
          ),
          child: Icon(
            icon,
            color: iconColor,
            size: 28,
          ),
        ),
        SizedBox(width: 10),
        Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: AppColors.greyColor,
                fontSize: 14,
                fontWeight: FontWeight.w500,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            // const SizedBox(height: 5),
            // Text(
            //   value,
            //   style: const TextStyle(
            //     fontSize: 26,
            //     fontWeight: FontWeight.w900,
            //   ),
            // ),
          ],
        ),
      ],
    );
  }
}
