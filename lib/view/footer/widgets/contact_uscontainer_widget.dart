import 'package:canteen_superadmin_website/core/colors/colors.dart';
import 'package:canteen_superadmin_website/view/footer/widgets/primary_font_widget.dart';
import 'package:canteen_superadmin_website/view/widgets/responsive/responsive.dart';
import 'package:flutter/material.dart';

class ContactUsContainerWidget extends StatelessWidget {
  const ContactUsContainerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ResponsiveWebSite.isDesktop(context)
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 30),
                    child: PrimaryFontWidget(
                      text: "Contact Us",
                      fontSize: 18,
                      fontweight: FontWeight.bold,
                      color: Color.fromARGB(255, 247, 182, 20),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(right: 20.0, left: 20, top: 20),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 70,
                            height: 50,
                            child: Image.asset(
                              'web_images/albustanwhite.png',
                              fit: BoxFit.fill,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: PrimaryFontWidget(
                                text: "AL BUSTAN",
                                fontSize: 15,
                                fontweight: FontWeight.bold,
                                color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 20.0, left: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.location_on_sharp,
                          color: AppColors.lightGreyColor,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        PrimaryFontWidget(
                            text:
                                'Amman Street, Al Qusais Industrial Area 3,\n Dubai Unit- ed Arab Emirates,PO Box 20584.',
                            fontSize: 13,
                            fontweight: FontWeight.w500,
                            color: Colors.white)
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 20.0, left: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(width: 5),
                        Icon(
                          Icons.phone,
                          color: AppColors.lightGreyColor,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        PrimaryFontWidget(
                            text: '+04-267-7644 / 050-495-7335',
                            fontSize: 13,
                            fontweight: FontWeight.w500,
                            color: Colors.white)
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 20.0, left: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.mail,
                          color: AppColors.lightGreyColor,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        PrimaryFontWidget(
                            text:
                                'info@leptonaisolutions.com,\nleptonaisolutions@gmail.com',
                            fontSize: 13,
                            fontweight: FontWeight.w500,
                            color: Colors.white)
                      ],
                    ),
                  ),
                ],
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 30, bottom: 20),
                    child: PrimaryFontWidget(
                      text: "Contact Us",
                      fontSize: 15,
                      fontweight: FontWeight.bold,
                      color: Color.fromARGB(255, 247, 182, 20),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(right: 5.0, left: 20, top: 5),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 30,
                            height: 30,
                            child: Image.asset(
                              'assets/images/leptonlogogreen.png',
                              fit: BoxFit.fill,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: PrimaryFontWidget(
                                text: "Lepton\nAI Solutions",
                                fontSize: 13,
                                fontweight: FontWeight.bold,
                                color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 5.0, left: 20, top: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                            height: 18.0,
                            width: 18.0,
                            // color: Colors.transparent,
                            child: IconButton(
                              padding: EdgeInsets.all(0.0),
                              color: AppColors.lightGreyColor,
                              icon: Icon(Icons.location_on_sharp, size: 18.0),
                              onPressed: null,
                            )),
                        // Icon(
                        //   Icons.location_on_sharp,
                        //   color: Colors.white,
                        // ),
                        SizedBox(
                          width: 5,
                        ),
                        PrimaryFontWidget(
                            text:
                                'Lepton AI solutions \nmiddle east lmt.,\nOffice 105,\nKasco tower,\nAlqusais,\nDubai uae',
                            fontSize: 12,
                            fontweight: FontWeight.w500,
                            color: Colors.white)
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 5.0, left: 20, top: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                            height: 18.0,
                            width: 18.0,
                            // color: Colors.transparent,
                            child: IconButton(
                              padding: EdgeInsets.all(0.0),
                              color: AppColors.lightGreyColor,
                              icon: Icon(Icons.phone, size: 18.0),
                              onPressed: null,
                            )),
                        SizedBox(
                          width: 5,
                        ),
                        PrimaryFontWidget(
                            text: '+971525892916',
                            fontSize: 12,
                            fontweight: FontWeight.w500,
                            color: Colors.white)
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 5.0, left: 20, top: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                            height: 18.0,
                            width: 18.0,
                            // color: Colors.transparent,
                            child: IconButton(
                              padding: EdgeInsets.all(0.0),
                              color: AppColors.lightGreyColor,
                              icon: Icon(Icons.mail, size: 18.0),
                              onPressed: null,
                            )),
                        SizedBox(
                          width: 5,
                        ),
                        PrimaryFontWidget(
                            text:
                                'info@leptonaisolutions.com,\nleptonaisolutions@gmail.com',
                            fontSize: 11,
                            fontweight: FontWeight.w500,
                            color: Colors.white)
                      ],
                    ),
                  ),
                ],
              ),
      ],
    );
  }
}
