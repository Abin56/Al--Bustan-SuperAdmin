import 'package:canteen_superadmin_website/core/core.dart';
import 'package:canteen_superadmin_website/view/admin_panel/delivery_admin/status_screen/pending_status/data_list.dart';
import 'package:canteen_superadmin_website/view/admin_panel/store_admin/invetory_sreen.dart';
import 'package:flutter/material.dart';

class PickedOrdersStatusScreen extends StatelessWidget {
  const PickedOrdersStatusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // List<Widget> widgetlist = [];
    return SizedBox(
      height: 1000,
      width: 1050,
      child: Column(
        children: [
          const Row(
            children: [
              Expanded(
                  flex: 1, child: ListViewTableHeaderWidget(headerTitle: 'No')),
              SizedBox(
                width: 01,
              ),
              Expanded(
                  flex: 3,
                  child: ListViewTableHeaderWidget(headerTitle: 'OrderID')),
              SizedBox(
                width: 01,
              ),
              Expanded(
                  flex: 1,
                  child: ListViewTableHeaderWidget(headerTitle: 'QTY')),
              SizedBox(
                width: 01,
              ),
              Expanded(
                  flex: 2,
                  child: ListViewTableHeaderWidget(headerTitle: 'Date')),
              SizedBox(
                width: 01,
              ),
              Expanded(
                  flex: 2,
                  child: ListViewTableHeaderWidget(headerTitle: "Time")),
              SizedBox(
                width: 01,
              ),
              Expanded(
                  flex: 1,
                  child: ListViewTableHeaderWidget(headerTitle: "Price")),
              SizedBox(
                width: 01,
              ),
              Expanded(
                  flex: 1,
                  child: ListViewTableHeaderWidget(headerTitle: "Invoice")),
              SizedBox(
                width: 01,
              ),
              Expanded(
                  flex: 2,
                  child: ListViewTableHeaderWidget(headerTitle: 'Status')),
            ],
          ),
          Expanded(
              child: SizedBox(
            width: 1050,
            child: StreamBuilder(
                stream: dataserver.collection('deliveryAssignList').snapshots(),
                builder: (context, employesnaps) {
                  return ListView.separated(
                      itemBuilder: (context, index) {
                        final data = employesnaps.data!.docs[index];

                        return StreamBuilder(
                            stream: dataserver
                                .collection('EmployeeProfile')
                                .doc(data['employeeId'])
                                .collection('DeliveryRequest')
                                .doc(data['orderId'])
                                .collection('productsDetails')
                                .snapshots(),
                            builder: (context, snaps) {
                              if (snaps.hasData) {
                                if (snaps.data!.docs.isEmpty) {
                                  return PickedDataListWidget(
                                    datalist: data,
                                    index: index,
                                  );
                                } else {
                                  return const SizedBox();
                                }
                              } else {
                                return const Center(
                                  child: CircularProgressIndicator.adaptive(),
                                );
                              }
                            });
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          height: 05,
                        );
                      },
                      itemCount: employesnaps.data!.docs.length);
                }),
          ))
        ],
      ),
    );
  }
}
