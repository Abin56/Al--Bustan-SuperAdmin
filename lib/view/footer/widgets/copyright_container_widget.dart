import 'package:canteen_superadmin_website/view/footer/widgets/primary_font_widget.dart';
import 'package:canteen_superadmin_website/view/widgets/responsive/responsive.dart';
import 'package:flutter/material.dart';

class CopyRightContainerWidget extends StatelessWidget {
  const CopyRightContainerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ResponsiveWebSite.isDesktop(context)
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    "Copyright © All rights reserved | by Lepton",
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: const PrimaryFontWidget(
                          text: 'Privacy Policy',
                          fontSize: 15,
                          fontweight: FontWeight.w500,
                          color: Colors.white)),
                ],
              )
            : ResponsiveWebSite.isTablet(context)
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text(
                        "Copyright © All rights reserved | by Lepton",
                        style: TextStyle(fontSize: 13, color: Colors.white),
                      ),
                      TextButton(
                          onPressed: () {},
                          child: const PrimaryFontWidget(
                              text: 'Privacy Policy',
                              fontSize: 13,
                              fontweight: FontWeight.w500,
                              color: Colors.white)),
                    ],
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Copyright © All rights reserved | by Lepton",
                        style: TextStyle(fontSize: 11, color: Colors.white),
                      ),
                      TextButton(
                          onPressed: () {},
                          child: const PrimaryFontWidget(
                              text: 'Privacy Policy',
                              fontSize: 11,
                              fontweight: FontWeight.w500,
                              color: Colors.white)),
                    ],
                  ),
      ],
    );
  }
}
