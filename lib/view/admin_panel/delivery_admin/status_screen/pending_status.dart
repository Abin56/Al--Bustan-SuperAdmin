import 'package:canteen_superadmin_website/view/admin_panel/store_admin/invetory_sreen.dart';
import 'package:flutter/material.dart';

class PendingOrdersStatusScreen extends StatelessWidget {
  const PendingOrdersStatusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // List<Widget> widgetlist = [];
    return const SingleChildScrollView(
      child: Column(
        children: [
          Row(
            children: [
              ListViewTableHeaderWidget(width: 150, headerTitle: 'OrderID'),
              ListViewTableHeaderWidget(width: 50, headerTitle: 'QTY'),
              ListViewTableHeaderWidget(width: 100, headerTitle: 'Date'),
              ListViewTableHeaderWidget(width: 150, headerTitle: 'Status'),
              ListViewTableHeaderWidget(width: 100, headerTitle: "Time"),
              ListViewTableHeaderWidget(width: 100, headerTitle: "Price"),
              ListViewTableHeaderWidget(width: 100, headerTitle: "Invoice"),
            ],
          ),
        ],
      ),
    );
  }
}
