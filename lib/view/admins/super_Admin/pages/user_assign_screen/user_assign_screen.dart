import 'package:canteen_superadmin_website/controller/user_controller/user_controller.dart';
import 'package:canteen_superadmin_website/core/constant/const.dart';
import 'package:canteen_superadmin_website/core/core.dart';
import 'package:canteen_superadmin_website/model/user_model/user_model.dart';

import 'package:canteen_superadmin_website/view/admins/super_Admin/pages/user_assign_screen/data_list.dart';
import 'package:canteen_superadmin_website/view/admins/super_Admin/pages/user_assign_screen/widget/ui_templates.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserAssignListScreen extends StatelessWidget {
  final UserController userController = Get.put(UserController());
   UserAssignListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // List<Widget> widgetlist = [];
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        color: Colors.grey.withOpacity(0.2),
        height: 1000,
        width: 1200,
        child: Column(
          children: [
            const Row(
              children: [
                Expanded(flex: 1, child: TableHeaderWidget(headerTitle: 'No')),
                SizedBox(
                  width: 01,
                ),
                Expanded(
                    flex: 4, child: TableHeaderWidget(headerTitle: 'Name')),
                SizedBox(
                  width: 01,
                ),
                Expanded(
                    flex: 4, child: TableHeaderWidget(headerTitle: 'Email')),
                SizedBox(
                  width: 01,
                ),
                Expanded(
                    flex: 3, child: TableHeaderWidget(headerTitle: 'Phone')),
                SizedBox(
                  width: 01,
                ),
                Expanded(
                    flex: 3,
                    child: TableHeaderWidget(headerTitle: 'User Role')),
                SizedBox(
                  width: 01,
                ),
                Expanded(
                    flex: 3, child: TableHeaderWidget(headerTitle: "Status")),
                SizedBox(
                  width: 01,
                ),
                Expanded(
                    flex: 2,
                    child: TableHeaderWidget(headerTitle: "Join Date")),
              ],
            ),
            Expanded(
                child: SizedBox(
              width: 1200,
              child: StreamBuilder(
                  stream: dataserver.collection('EmployeeProfile').snapshots(),
                  builder: (context, employesnaps) {
                    if (employesnaps.hasData) {
                      return ListView.separated(
                          itemBuilder: (context, index) {
                            final data = UserModel.fromMap(
                                employesnaps.data!.docs[index].data());

                            return UserDataListWidget(
                              datalist: data,
                              index: index,
                            );
                          },
                          separatorBuilder: (context, index) {
                            return const SizedBox(
                              height: 02,
                            );
                          },
                          itemCount: employesnaps.data!.docs.length);
                    } else {
                      return const Center(
                        child: circularPIndicator,
                      );
                    }
                  }),
            ))
          ],
        ),
      ),
    );
  }
}
