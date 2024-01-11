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
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
          child: Row(
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
        Padding(
          padding: const EdgeInsets.only(left: 50, right: 50),
          child: Row(
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      iconData1,
                      color: AppColors.greenColor,
                      size: 40,
                    ),
                    const Text(
                      "Total Orders",
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
              // ignore: prefer_const_constructors
              Spacer(),

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
                  padding: const EdgeInsets.only(top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        iconData2,
                        color: AppColors.greenColor,
                        size: 40,
                      ),
                      const Text(
                        "To be Deliver",
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
          ),
        )
      ],
    );
  }
}

class ScendRowoneWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final IconData iconData1;

  const ScendRowoneWidget({
    super.key,
    required this.title,
    required this.icon,
    required this.iconData1,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 10,
            right: 30,
            top: 10,
            bottom: 20,
          ),
          child: Row(
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Icon(
                  iconData1,
                  color: AppColors.greenColor,
                  size: 40,
                ),
              ),
              const Text(
                "No of Canteen",
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
      ],
    );
  }
}
