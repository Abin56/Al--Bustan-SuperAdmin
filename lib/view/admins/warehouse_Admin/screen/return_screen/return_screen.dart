import 'package:canteen_superadmin_website/core/fonts/google_heebo.dart';
import 'package:canteen_superadmin_website/view/widgets/delivery_list/delivery_list_show.dart';
import 'package:flutter/material.dart';

class ReturnScreen extends StatelessWidget {
  const ReturnScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              SizedBox(
                width: 670,
                height: 900,
                child: Column(
                  children: [
                    GoogleHeeboWidget(text: "Suppliers", fontsize: 25),
                    const Row(
                      children: [ 
                         HeaderOfDeliveryAdmin(text: "No.",flex: 1),
                         HeaderOfDeliveryAdmin(text: "Item Name",flex: 3),
                         HeaderOfDeliveryAdmin(text: "Company Name",flex: 3),
                         HeaderOfDeliveryAdmin(text: "Date",flex: 2),
                        //  HeaderOfDeliveryAdmin(text: "Out Price",flex: 2),
                        //  HeaderOfDeliveryAdmin(text:  "Action",flex: 1)
                      ],
                    ),
                    Expanded(
                      child: ListView.separated(
                        itemBuilder: (context, index) {
                          return   SizedBox(
                            width: 620,
                            height: 45,
                            child: Row(
                              children: [ 
                             DeliveryAdminListContainers(text:  '${index+1}',flex: 1),
                             const DeliveryAdminListContainers(text:  "Milk",flex: 3,),
                             const DeliveryAdminListContainers(text:  "Getyunjdfhf",flex: 3,),
                             const DeliveryAdminListContainers(text:  "23/04/24",flex: 2,),
                            //  const DeliveryAdminListContainers(text:  "5000",flex: 2,),
                            //  const DeliveryAdminListContainers(text:  "🛒",flex: 1,),
                            ],
                            ),
                          );
                        },
                         separatorBuilder: (context, index) => const SizedBox(height: 1,), 
                         itemCount: 17),
                    ), 
                  ],
                )),
                const SizedBox(width: 7,),
              SizedBox(
                width: 670,
                height: 900,
                child: Column(
                  children: [
                    GoogleHeeboWidget(text: "Cateen", fontsize: 25),
                    const Row(
                      children: [ 
                         HeaderOfDeliveryAdmin(text: "No.",flex: 1),
                         HeaderOfDeliveryAdmin(text: "Item Name",flex: 3),
                        // HeaderOfDeliveryAdmin(text: "Company Name",flex: 2),
                         HeaderOfDeliveryAdmin(text: "Cateen Name",flex: 3),
                         HeaderOfDeliveryAdmin(text: "Date",flex: 2),
                         //HeaderOfDeliveryAdmin(text:  "Action",flex: 1)
                      ],
                    ),
                    Expanded(
                      child: ListView.separated(
                        itemBuilder: (context, index) {
                          return   SizedBox(
                            width: 620,
                            height: 45,
                            child: Row(
                              children: [ 
                             AlBustanTableViewApp(text:  '${index+1}',flex: 1,color:  const Color.fromARGB(255, 247, 234, 121).withOpacity(0.5),),
                              AlBustanTableViewApp(text:  "Boost",flex: 3,color: const Color.fromARGB(255, 247, 234, 121).withOpacity(0.5),),
                            // const DeliveryAdminListContainers(text:  "GYtuhrhgdk",flex: 2,),
                              AlBustanTableViewApp(text:  "Al Bustan",flex: 3,color: const Color.fromARGB(255, 247, 234, 121).withOpacity(0.5)),
                              AlBustanTableViewApp(text:  "23/04/24",flex: 2,color: const Color.fromARGB(255, 247, 234, 121).withOpacity(0.5)),
                            // const DeliveryAdminListContainers(text:  "🛒",flex: 1,),
                            ],
                            ),
                          );
                        },
                         separatorBuilder: (context, index) => const SizedBox(height: 1,), 
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