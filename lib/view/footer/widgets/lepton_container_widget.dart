import 'package:canteen_superadmin_website/view/footer/widgets/primary_font_widget.dart';
import 'package:canteen_superadmin_website/view/footer/widgets/social_media.dart';
import 'package:canteen_superadmin_website/view/widgets/responsive/responsive.dart';
import 'package:flutter/material.dart';

class LeptonContainerWidget extends StatelessWidget {
  const LeptonContainerWidget({
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
                    padding: EdgeInsets.only(left: 20),
                    child: PrimaryFontWidget(
                      text: "Lepton AI Solutions",
                      fontSize: 18,
                      fontweight: FontWeight.bold,
                      color: Color.fromARGB(255, 247, 182, 20),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 20, left: 20),
                    child: SizedBox(
                      width: 350,
                      //height: 250,
                      child: PrimaryFontWidget(
                          text:
                              "Lepton Plus Communications is a customer oriented company offering digital solutions in Healthcare, E-Commerce Applications, Home Automation and Social Networking. We are committed to providing high end sustainable products and services that enhances the quality of life.",
                          fontSize: 13,
                          fontweight: FontWeight.normal,
                          color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Container(
                      child: SocialMediaContact(),
                    ),
                  )
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: PrimaryFontWidget(
                      text: "Lepton AI Solutions",
                      fontSize: 15,
                      fontweight: FontWeight.bold,
                      color: Color.fromARGB(255, 247, 182, 20),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 5, left: 10),
                    child: SizedBox(
                      width: 350,
                      //height: 250,
                      child: PrimaryFontWidget(
                          text:
                              "Lepton Plus Communications is a customer oriented company offering digital solutions in Healthcare, E-Commerce Applications, Home Automation and Social Networking. We are committed to providing high end sustainable products and services that enhances the quality of life.",
                          fontSize: 12,
                          fontweight: FontWeight.normal,
                          color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Container(
                      child: SocialMediaContact(),
                    ),
                  )
                ],
              ),
      ],
    );
  }
}
