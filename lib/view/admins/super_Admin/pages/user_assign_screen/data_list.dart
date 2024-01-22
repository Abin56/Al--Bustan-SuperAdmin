import 'package:canteen_superadmin_website/core/colors/colors.dart';
import 'package:canteen_superadmin_website/model/user_model/user_model.dart';
import 'package:canteen_superadmin_website/view/admins/super_Admin/pages/user_assign_screen/widget/ui_templates.dart';
import 'package:flutter/material.dart';

class UserDataListWidget extends StatelessWidget {
  final UserModel datalist;
  final int index;
  const UserDataListWidget({
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
                        'web_images/profile.png',
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
                        'web_images/gmail.png',
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
                        'web_images/telephone.png',
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
            child:
            
             Row(
              children: [
                Container(
                  height: 45,
                  width: 25,
                  color: cWhite,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(1),
                      child: Image.asset(
                        'web_images/user_role.png',
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
                    headerTitle: " ${'employee'}"),
                Container(
                  height: 45,
                  color: cWhite,
                  child: Center(
                    child: IconButton(
                        onPressed: () async {},
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
            child: Row(
              children: [
                Container(
                  height: 45,
                  width: 30,
                  color: cWhite,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Image.asset(
                        'web_images/not_active.png',
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
                        'web_images/ink.png',
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
                      headerTitle: ' 30-10-3000'),
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
          //       //             'web_images/pending_animation.json')),
          //       //   ],
          //       // ),
          //       ),
          // )
        ],
      ),
    );
  }
}
