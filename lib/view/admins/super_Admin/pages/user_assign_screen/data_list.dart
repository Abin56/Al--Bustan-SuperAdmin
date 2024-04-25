import 'package:canteen_superadmin_website/controller/user_controller/user_controller.dart';
import 'package:canteen_superadmin_website/core/colors/colors.dart';
import 'package:canteen_superadmin_website/core/constant/constant.validate.dart';
import 'package:canteen_superadmin_website/model/user_model/user_model.dart';
import 'package:canteen_superadmin_website/view/admins/super_Admin/pages/user_assign_screen/widget/role_dropdown/role_dropdown.dart';
import 'package:canteen_superadmin_website/view/admins/super_Admin/pages/user_assign_screen/widget/ui_templates.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserDataListWidget extends StatelessWidget {
  final UserController userController = Get.put(UserController());
  final UserModel datalist;
  final int index;
  UserDataListWidget({
    required this.index,
    super.key,
    required this.datalist,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: DataContainerWidget2(
                rowMainAccess: MainAxisAlignment.center,
                color: cWhite,
                // width: 150,
                index: index,
                headerTitle: '${index + 1}'),
          ),
          const SizedBox(
            width: 01,
          ),
          Expanded(
            flex: 4,
            child: Row(
              children: [
                Container(
                  height: 45,
                  width: 25,
                  color: cWhite,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 2),
                      child: Image.asset(
                        'assests/web_images/profile.png',
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: DataContainerWidget2(
                      rowMainAccess: MainAxisAlignment.start,
                      color: cWhite,
                      index: index,
                      headerTitle: " ${datalist.name}"),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 01,
          ),
          Expanded(
            flex: 4,
            child: Row(
              children: [
                Container(
                  height: 45,
                  width: 25,
                  color: cWhite,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Image.asset(
                        'assests/web_images/gmail.png',
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: DataContainerWidget2(
                      rowMainAccess: MainAxisAlignment.start,
                      color: cWhite,
                      index: index,
                      headerTitle: " ${datalist.email}"),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 01,
          ),
          Expanded(
            flex: 3,
            child: Row(
              children: [
                Container(
                  height: 45,
                  width: 20,
                  color: cWhite,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 05),
                      child: Image.asset(
                        'assests/web_images/telephone.png',
                        // fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: DataContainerWidget2(
                      rowMainAccess: MainAxisAlignment.start,
                      color: cWhite,
                      index: index,
                      headerTitle: " ${datalist.phoneNo}"),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 01,
          ),
          Expanded(
            flex: 3,
            child: datalist.userrole == ''
                ? UserRoleDropDown(
                    datalist: datalist,
                  )
                : Row(
                    children: [
                      Container(
                        height: 45,
                        width: 25,
                        color: cWhite,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(1),
                            child: Image.asset(
                              'assests/web_images/user_role.png',
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                        ),
                      ),
                      DataContainerWidget2(
                          rowMainAccess: MainAxisAlignment.start,
                          color: cWhite,
                          index: index,
                          width: 114,
                          headerTitle: " ${datalist.userrole}"),
                      Container(
                        height: 45,
                        color: cWhite,
                        child: Center(
                          child: IconButton(
                              onPressed: () async {
                                await userController.updateUserRole(
                                  datalist,
                                );
                              },
                              icon: const Icon(
                                Icons.mode_edit_outline,
                                size: 20,
                                color: cGreen,
                              )),
                        ),
                      )
                    ],
                  ),
          ),
          const SizedBox(
            width: 01,
          ),

          Expanded(
            flex: 3,
            child: datalist.activate == false
                ? Row(
                    children: [
                      Container(
                        height: 45,
                        width: 30,
                        color: cWhite,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: Image.asset(
                              'assests/web_images/not_active.png',
                              // fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: DataContainerWidget2(
                            rowMainAccess: MainAxisAlignment.start,
                            color: cWhite,
                            index: index,
                            headerTitle: "Not Actived"),
                      ),
                      Container(
                        height: 45,
                        color: cWhite,
                        child: Center(
                          child: Tooltip(
                            preferBelow: false,
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(10.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 3,
                                  blurRadius: 7,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            message: "Activate",
                            child: IconButton(
                                onPressed: () async {
                                  await userController.updateUserAccess(
                                      datalist, true);
                                },
                                icon: const Icon(
                                  Icons.check,
                                  size: 20,
                                  color: cGreen,
                                )),
                          ),
                        ),
                      )
                    ],
                  )
                : Row(
                    children: [
                      Container(
                        height: 45,
                        width: 30,
                        color: cWhite,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: Image.asset(
                              'assests/web_images/active.png',
                              // fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: DataContainerWidget2(
                            rowMainAccess: MainAxisAlignment.start,
                            color: cWhite,
                            index: index,
                            headerTitle: "Activated"),
                      ),
                      Container(
                        height: 45,
                        color: cWhite,
                        child: Center(
                          child: Tooltip(
                            preferBelow: false,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(10.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 3,
                                  blurRadius: 7,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            message: "Deactive",
                            child: IconButton(
                                onPressed: () async {
                                  await userController.updateUserAccess(
                                      datalist, false);
                                },
                                icon: const Icon(
                                  Icons.close,
                                  size: 20,
                                  color: cred,
                                )),
                          ),
                        ),
                      )
                    ],
                  ),
          ),

          Expanded(
            flex: 2,
            child: Row(
              children: [
                Container(
                  height: 45,
                  width: 30,
                  color: cWhite,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(6),
                      child: Image.asset(
                        'assests/web_images/ink.png',
                        // fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: DataContainerWidget2(
                      rowMainAccess: MainAxisAlignment.start,
                      color: cWhite,
                      index: index,
                      headerTitle:
                          dateConveter(DateTime.parse(datalist.joindate))),
                ),
              ],
            ),
          ),
          // Expanded(
          //   flex: 2,
          //   child: SizedBox(
          //       child: ButtonContainerWidget(
          //     text: "INVOICE",
          //     width: 100,
          //     height: 40,
          //     fontSize: 11,
          //     onTap: () {},
          //   )),
          // ),
          // const SizedBox(
          //   width: 01,
          // ),
          // const Expanded(
          //   flex: 1,
          //   child: SizedBox(
          //       // child: Row(
          //       //   children: [
          //       //     ButtonContainerWidget(
          //       //       text: "PENDING",
          //       //       width: 100,
          //       //       height: 40,
          //       //       fontSize: 11,
          //       //       onTap: () {},
          //       //     ),
          //       //     const SizedBox(
          //       //       width: 10,
          //       //     ),
          //       //     SizedBox(
          //       //         height: 25,
          //       //         width: 25,
          //       //         child: LottieBuilder.asset(
          //       //             'assests/web_images/pending_animation.json')),
          //       //   ],
          //       // ),
          //       ),
          // )
        ],
      ),
    );
  }
}
