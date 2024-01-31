import 'package:canteen_superadmin_website/core/colors/colors.dart';
import 'package:canteen_superadmin_website/core/fonts/google_heebo.dart';
import 'package:canteen_superadmin_website/core/fonts/google_poppins.dart';
import 'package:canteen_superadmin_website/view/widgets/delivery_list/delivery_list_show.dart';
import 'package:flutter/material.dart';

class ReturnScreen extends StatelessWidget {
  const ReturnScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            SizedBox(
                width: 620,
                height: 900,
                child: Column(
                  children: [
                    GoogleHeeboWidget(text: "Suppliers", fontsize: 25),
                    const Row(
                      children: [
                        HeaderOfDeliveryAdmin(text: "No.", flex: 1),
                        HeaderOfDeliveryAdmin(text: "Item Name", flex: 2),
                        HeaderOfDeliveryAdmin(text: "Company Name", flex: 2),
                        HeaderOfDeliveryAdmin(text: "Date", flex: 2),
                        //  HeaderOfDeliveryAdmin(text: "Out Price",flex: 2),
                        //  HeaderOfDeliveryAdmin(text:  "Action",flex: 1)
                      ],
                    ),
                    Expanded(
                      child: ListView.separated(
                          itemBuilder: (context, index) {
                            return SizedBox(
                              width: 570,
                              height: 45,
                              child: Row(
                                children: [
                                  DeliveryAdminListContainers(
                                      text: '${index + 1}', flex: 1),
                                 AlBustanTableViewApp(
                                    text: "Boost jbhjdf fghf ghiruhgiurh",
                                    flex: 2,
                                    color: Colors.pink.withOpacity(0.2),
                                  ),
                                  // const DeliveryAdminListContainers(text:  "GYtuhrhgdk",flex: 2,),
                                  AlBustanTableViewApp(
                                      text: "Al Bustan",
                                      flex: 2,
                                       color: Colors.pink.withOpacity(0.2),
                                          ),
                                  const DeliveryAdminListContainers(
                                    text: "23/04/24",
                                    flex: 2,
                                  ),
                                  //  const DeliveryAdminListContainers(text:  "5000",flex: 2,),
                                  //  const DeliveryAdminListContainers(text:  "🛒",flex: 1,),
                                ],
                              ),
                            );
                          },
                          separatorBuilder: (context, index) => const SizedBox(
                                height: 1,
                              ),
                          itemCount: 17),
                    ),
                  ],
                )),
            const SizedBox(
              width: 15,
            ),
            SizedBox(
                width: 620,
                height: 900,
                child: Column(
                  children: [
                    GoogleHeeboWidget(text: "Cateen", fontsize: 25),
                    const Row(
                      children: [
                        HeaderOfDeliveryAdmin(text: "No.", flex: 1),
                        HeaderOfDeliveryAdmin(text: "Item Name", flex: 2),
                        // HeaderOfDeliveryAdmin(text: "Company Name",flex: 2),
                        HeaderOfDeliveryAdmin(text: "Cateen Name", flex: 2),
                        HeaderOfDeliveryAdmin(text: "Date", flex: 2),
                        //HeaderOfDeliveryAdmin(text:  "Action",flex: 1)
                      ],
                    ),
                    Expanded(
                      child: ListView.separated(
                          itemBuilder: (context, index) {
                            return SizedBox(
                              width: 570,
                              height: 45,
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      height: 45,
                                      decoration: BoxDecoration(
                                          border: const Border(
                                              right: BorderSide(color: cWhite, width: 5),
                                              bottom: BorderSide(color: cWhite)),
                                          color: const Color.fromARGB(255, 247, 234, 121).withOpacity(0.7)),
                                      child: Center(child: Text("${index+1}"),),
                                    ),
                                  ),
                                  AlBustanTableViewApp(
                                    text: "Boost jbhjdf fghf ghiruhgiurh",
                                    flex: 2,
                                    color:
                                        const Color.fromARGB(255, 247, 234, 121)
                                            .withOpacity(0.7),
                                  ),
                                  // const DeliveryAdminListContainers(text:  "GYtuhrhgdk",flex: 2,),
                                  AlBustanTableViewApp(
                                      text: "Al Bustan",
                                      flex: 2,
                                      color: const Color.fromARGB(
                                              255, 247, 234, 121)
                                          .withOpacity(0.7)),
                                  Expanded(
                                    flex: 2,
                                    child: Container(
                                      height: 45,
                                      decoration: BoxDecoration(
                                          border: const Border(
                                              right: BorderSide(color: cWhite, width: 5),
                                              bottom: BorderSide(color: cWhite)),
                                          color: const Color.fromARGB(255, 247, 234, 121).withOpacity(0.7)),
                                      child: Center(child: GooglePoppinsWidgets(text: "23/04/24", fontsize: 13 )),
                                    ),
                                  ),
                                  // const DeliveryAdminListContainers(text:  "🛒",flex: 1,),
                                ],
                              ),
                            );
                          },
                          separatorBuilder: (context, index) => const SizedBox(
                                height: 1,
                              ),
                          itemCount: 17),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
