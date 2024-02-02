import 'package:canteen_superadmin_website/view/footer/widgets/company_container_widget.dart';
import 'package:canteen_superadmin_website/view/footer/widgets/contact_uscontainer_widget.dart';
import 'package:canteen_superadmin_website/view/footer/widgets/copyright_container_widget.dart';
import 'package:canteen_superadmin_website/view/footer/widgets/lepton_container_widget.dart';
import 'package:canteen_superadmin_website/view/widgets/responsive/responsive.dart';
import 'package:flutter/material.dart';

class FooterFinal extends StatelessWidget {
  const FooterFinal({super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          ResponsiveWebSite.isDesktop(context)
              ? Container(
                  width: screenSize.width,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Color.fromRGBO(40, 41, 50, 1.0),
                      Color.fromRGBO(40, 41, 50, 1.0),
                      // Colors.black,
                      // Color.fromARGB(255, 6, 19, 39),
                      // Colors.blueGrey,
                      // Colors.black,
                    ],
                  )),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 20.0,
                    ),
                    child: Column(
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                                height: 350, child: LeptonContainerWidget()),
                            SizedBox(
                              height: 350,
                              child: CompanyContainerWidget(),
                            ),
                            SizedBox(
                              // color: Colors.red,
                              height: 350,
                              child: ContactUsContainerWidget(),
                            ),
                          ],
                        ),
                        Container(
                          height: 40,
                          width: double.infinity,
                          color: Colors.black,
                          child: const CopyRightContainerWidget(),
                        ),
                      ],
                    ),
                  ),
                )
              : ResponsiveWebSite.isTablet(context)
                  ? Container(
                      width: screenSize.width,
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          Color.fromRGBO(40, 41, 50, 1.0),
                          Color.fromRGBO(40, 41, 50, 1.0),
                          // Colors.black,
                          // Color.fromARGB(255, 6, 19, 39),
                          // Colors.blueGrey,
                          // Colors.black,
                        ],
                      )),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 20.0,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(
                                height: 220,
                                width: 400,
                                child: Center(child: LeptonContainerWidget())),
                            const SizedBox(
                              height: 250,
                              width: 400,
                              child: Center(child: CompanyContainerWidget()),
                            ),
                            const SizedBox(
                              height: 330,
                              width: 400,
                              child: Center(child: ContactUsContainerWidget()),
                            ),
                            Container(
                              height: 40,
                              width: double.infinity,
                              color: Colors.black,
                              child: const CopyRightContainerWidget(),
                            ),
                          ],
                        ),
                      ),
                    )
                  : ResponsiveWebSite.isMobile(context)
                      ? Container(
                          width: screenSize.width,
                          decoration: const BoxDecoration(
                              gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [
                              Color.fromRGBO(40, 41, 50, 1.0),
                              Color.fromRGBO(40, 41, 50, 1.0),
                              // Color.fromARGB(255, 6, 19, 39),
                              // Colors.blueGrey,
                              // Colors.black,
                            ],
                          )),
                          child: Padding(
                            padding: const EdgeInsets.only(
                              top: 10.0,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const SizedBox(
                                    height: 280,
                                    width: 400,
                                    child:
                                        Center(child: LeptonContainerWidget())),
                                const SizedBox(
                                  height: 250,
                                  width: 400,
                                  child:
                                      Center(child: CompanyContainerWidget()),
                                ),
                                const SizedBox(
                                  height: 330,
                                  width: 400,
                                  child:
                                      Center(child: ContactUsContainerWidget()),
                                ),
                                Container(
                                  height: 60,
                                  width: double.infinity,
                                  color: Colors.black,
                                  child: const CopyRightContainerWidget(),
                                ),
                              ],
                            ),
                          ),
                        )
                      : const Column(),
        ],
      ),
    );
  }
}
