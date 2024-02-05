import 'package:canteen_superadmin_website/view/admins/store_Admin/screen/low_stock_alert_widget.dart';
import 'package:flutter/material.dart';

class DeliveryStatusScreen extends StatelessWidget {
  const DeliveryStatusScreen({super.key});

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
