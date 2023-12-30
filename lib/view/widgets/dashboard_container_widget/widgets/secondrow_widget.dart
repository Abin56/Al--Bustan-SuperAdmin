import 'package:canteen_superadmin_website/view/colors/colors.dart';
import 'package:canteen_superadmin_website/view/constant/constant.validate.dart';
import 'package:flutter/material.dart';

class ScendRowWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final IconData iconData1;
  final IconData iconData2;

  const ScendRowWidget({
    super.key,
    required this.title,
    required this.icon,
    required this.iconData1,
    required this.iconData2,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 14),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Spacer(),
              IconButton(
                onPressed: () {},
                icon: Icon(icon),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 140,
              width: 140,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 242, 242, 245),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: AppColors.lightGreyColor,
                  width: 1.0,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      iconData1,
                      color: AppColors.greenColor,
                      size: 40,
                    ),
                    const Text(
                      "Quantity in Hand",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Text(
                      "89",
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            sWidtht5,
            Container(
              height: 140,
              width: 140,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 242, 242, 245),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: AppColors.lightGreyColor,
                  width: 1.0,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      iconData2,
                      color: AppColors.greenColor,
                      size: 40,
                    ),
                    const Text(
                      "Will be Received",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Text(
                      "09",
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
