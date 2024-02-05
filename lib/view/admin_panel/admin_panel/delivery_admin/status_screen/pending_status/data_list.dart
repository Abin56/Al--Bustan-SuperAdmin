import 'package:canteen_superadmin_website/view/admin_panel/store_admin/invetory_sreen.dart';
import 'package:canteen_superadmin_website/view/widgets/button_container_widget/button_container_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class PickedDataListWidget extends StatelessWidget {
  final QueryDocumentSnapshot<Map<String, dynamic>> datalist;
  final int index;
  const PickedDataListWidget({
    required this.index,
    super.key,
    required this.datalist,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: DataContainerWidget(
                color: index % 2 == 0
                    ? Colors.blue.withOpacity(0.2)
                    : Colors.pink.withOpacity(0.2),
                width: 150,
                index: index,
                headerTitle: '${index + 1}'),
          ),
          const SizedBox(
            width: 01,
          ),
          Expanded(
            flex: 3,
            child: DataContainerWidget(
                color: index % 2 == 0
                    ? Colors.blue.withOpacity(0.2)
                    : Colors.pink.withOpacity(0.2),
                width: 150,
                index: index,
                headerTitle: datalist['orderId']),
          ),
          const SizedBox(
            width: 01,
          ),
          Expanded(
            flex: 1,
            child: DataContainerWidget(
                color: index % 2 == 0
                    ? Colors.blue.withOpacity(0.2)
                    : Colors.pink.withOpacity(0.2),
                width: 50,
                index: index,
                headerTitle: '100'),
          ),
          const SizedBox(
            width: 01,
          ),
          Expanded(
            flex: 2,
            child: DataContainerWidget(
                color: index % 2 == 0
                    ? Colors.blue.withOpacity(0.2)
                    : Colors.pink.withOpacity(0.2),
                width: 100,
                index: index,
                headerTitle: '30-10-2000'),
          ),
          const SizedBox(
            width: 01,
          ),
          Expanded(
            flex: 2,
            child: DataContainerWidget(
                color: index % 2 == 0
                    ? Colors.blue.withOpacity(0.2)
                    : Colors.pink.withOpacity(0.2),
                width: 100,
                index: index,
                headerTitle: '10 : 00 Am'),
          ),
          const SizedBox(
            width: 01,
          ),
          Expanded(
            flex: 1,
            child: DataContainerWidget(
                color: index % 2 == 0
                    ? Colors.blue.withOpacity(0.2)
                    : Colors.pink.withOpacity(0.2),
                width: 100,
                index: index,
                headerTitle: '1000/-'),
          ),
          const SizedBox(
            width: 03,
          ),
          Expanded(
            flex: 1,
            child: SizedBox(
                child: ButtonContainerWidget(
              text: "INVOICE",
              width: 100,
              height: 40,
              fontSize: 11,
              onTap: () {},
            )),
          ),
          const SizedBox(
            width: 01,
          ),
          Expanded(
            flex: 2,
            child: SizedBox(
              child: Row(
                children: [
                  ButtonContainerWidget(
                    text: "PENDING",
                    width: 100,
                    height: 40,
                    fontSize: 11,
                    onTap: () {},
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                      height: 25,
                      width: 25,
                      child: LottieBuilder.asset(
                          'web_images/pending_animation.json')),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
