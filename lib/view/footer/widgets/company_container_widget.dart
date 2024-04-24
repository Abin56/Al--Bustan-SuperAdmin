import 'package:canteen_superadmin_website/core/colors/colors.dart';
import 'package:canteen_superadmin_website/view/footer/widgets/primary_font_widget.dart';
import 'package:canteen_superadmin_website/view/widgets/responsive/responsive.dart';
import 'package:flutter/material.dart';

class CompanyContainerWidget extends StatelessWidget {
  const CompanyContainerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ResponsiveWebSite.isDesktop(context)
            ? Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: PrimaryFontWidget(
                      text: "Company",
                      fontSize: 18,
                      fontweight: FontWeight.bold,
                      color: Color.fromARGB(255, 247, 182, 20),
                    ),
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.arrow_forward_ios,
                        color: AppColors.lightGreyColor,
                      ),
                      TextButton(
                          onPressed: () {},
                          child: const PrimaryFontWidget(
                              text: 'Home',
                              fontSize: 13,
                              fontweight: FontWeight.w500,
                              color: Colors.white)),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.arrow_forward_ios,
                        color: AppColors.lightGreyColor,
                      ),
                      TextButton(
                          onPressed: () {},
                          child: const PrimaryFontWidget(
                              text: 'Academic Slutions',
                              fontSize: 13,
                              fontweight: FontWeight.w500,
                              color: Colors.white)),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.arrow_forward_ios,
                        color: AppColors.lightGreyColor,
                      ),
                      TextButton(
                          onPressed: () {},
                          child: const PrimaryFontWidget(
                              text: 'Telemedicine Solutions',
                              fontSize: 13,
                              fontweight: FontWeight.w500,
                              color: Colors.white)),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.arrow_forward_ios,
                        color: AppColors.lightGreyColor,
                      ),
                      TextButton(
                          onPressed: () {},
                          child: const PrimaryFontWidget(
                              text: 'E- Commerce',
                              fontSize: 13,
                              fontweight: FontWeight.w500,
                              color: Colors.white)),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.arrow_forward_ios,
                        color: AppColors.lightGreyColor,
                      ),
                      TextButton(
                          onPressed: () {},
                          child: const PrimaryFontWidget(
                              text: 'Social Media',
                              fontSize: 13,
                              fontweight: FontWeight.w500,
                              color: Colors.white)),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.arrow_forward_ios,
                        color: AppColors.lightGreyColor,
                      ),
                      TextButton(
                          onPressed: () {},
                          child: const PrimaryFontWidget(
                              text: 'Legal Solutions',
                              fontSize: 13,
                              fontweight: FontWeight.w500,
                              color: Colors.white)),
                    ],
                  ),
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 30, bottom: 20),
                    child: PrimaryFontWidget(
                      text: "Company",
                      fontSize: 15,
                      fontweight: FontWeight.bold,
                      color: Color.fromARGB(255, 247, 182, 20),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                      children: [
                        const SizedBox(
                            height: 18.0,
                            width: 18.0,
                            // color: Colors.transparent,
                            child: IconButton(
                              padding: EdgeInsets.all(0.0),
                              // color: Colors.white,
                              icon: Icon(
                                Icons.arrow_forward_ios,
                                size: 18.0,
                                color: AppColors.lightGreyColor,
                              ),
                              onPressed: null,
                            )),
                        TextButton(
                            onPressed: () {},
                            child: const PrimaryFontWidget(
                                text: 'Home',
                                fontSize: 13,
                                fontweight: FontWeight.w500,
                                color: Colors.white)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                      children: [
                        const SizedBox(
                            height: 18.0,
                            width: 18.0,
                            // color: Colors.transparent,
                            child: IconButton(
                              padding: EdgeInsets.all(0.0),
                              // color: Colors.white,
                              icon: Icon(
                                Icons.arrow_forward_ios,
                                size: 18.0,
                                color: AppColors.lightGreyColor,
                              ),
                              onPressed: null,
                            )),
                        TextButton(
                            onPressed: () {},
                            child: const PrimaryFontWidget(
                                text: 'Academic Slutions',
                                fontSize: 13,
                                fontweight: FontWeight.w500,
                                color: Colors.white)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                      children: [
                        const SizedBox(
                            height: 18.0,
                            width: 18.0,
                            // color: Colors.transparent,
                            child: IconButton(
                              padding: EdgeInsets.all(0.0),
                              // color: Colors.white,
                              icon: Icon(
                                Icons.arrow_forward_ios,
                                size: 18.0,
                                color: AppColors.lightGreyColor,
                              ),
                              onPressed: null,
                            )),
                        TextButton(
                            onPressed: () {},
                            child: const PrimaryFontWidget(
                                text: 'Telemedicine Solutions',
                                fontSize: 13,
                                fontweight: FontWeight.w500,
                                color: Colors.white)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                      children: [
                        const SizedBox(
                            height: 18.0,
                            width: 18.0,
                            // color: Colors.transparent,
                            child: IconButton(
                              padding: EdgeInsets.all(0.0),
                              // color: Colors.white,
                              icon: Icon(
                                Icons.arrow_forward_ios,
                                size: 18.0,
                                color: AppColors.lightGreyColor,
                              ),
                              onPressed: null,
                            )),
                        TextButton(
                            onPressed: () {},
                            child: const PrimaryFontWidget(
                                text: 'E- Commerce',
                                fontSize: 13,
                                fontweight: FontWeight.w500,
                                color: Colors.white)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                      children: [
                        const SizedBox(
                            height: 18.0,
                            width: 18.0,
                            // color: Colors.transparent,
                            child: IconButton(
                              padding: EdgeInsets.all(0.0),
                              // color: Colors.white,
                              icon: Icon(
                                Icons.arrow_forward_ios,
                                size: 18.0,
                                color: AppColors.lightGreyColor,
                              ),
                              onPressed: null,
                            )),
                        TextButton(
                            onPressed: () {},
                            child: const PrimaryFontWidget(
                                text: 'Social Media',
                                fontSize: 13,
                                fontweight: FontWeight.w500,
                                color: Colors.white)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                      children: [
                        const SizedBox(
                            height: 18.0,
                            width: 18.0,
                            // color: Colors.transparent,
                            child: IconButton(
                              padding: EdgeInsets.all(0.0),
                              // color: Colors.white,
                              icon: Icon(
                                Icons.arrow_forward_ios,
                                size: 18.0,
                                color: AppColors.lightGreyColor,
                              ),
                              onPressed: null,
                            )),
                        TextButton(
                            onPressed: () {},
                            child: const PrimaryFontWidget(
                                text: 'Legal Solutions',
                                fontSize: 13,
                                fontweight: FontWeight.w500,
                                color: Colors.white)),
                      ],
                    ),
                  ),
                ],
              ),
      ],
    );
  }
}
