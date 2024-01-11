import 'package:canteen_superadmin_website/controller/store_controller.dart';
import 'package:canteen_superadmin_website/model/category_model.dart';
import 'package:canteen_superadmin_website/view/admin_panel/inventory/widget/custom_button.dart';
import 'package:canteen_superadmin_website/view/colors/colors.dart';
import 'package:canteen_superadmin_website/view/constant/constant.validate.dart';
import 'package:canteen_superadmin_website/view/fonts/google_poppins.dart';
import 'package:canteen_superadmin_website/view/widgets/custom_showDilog/custom_showdilog.dart';
import 'package:canteen_superadmin_website/view/widgets/textform%20feild%20Widget/textformfeildWidget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryWidget extends StatelessWidget {
  CategoryWidget({super.key});
  final getStroreCtr = Get.put(StoreController());
  @override
  Widget build(BuildContext context) {
    final sizeH = MediaQuery.of(context).size.height;
    final sizeW = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        height: sizeH * 0.85,
        width: double.infinity,
        decoration: BoxDecoration(
            color: cWhite,
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(blurRadius: 0.5),
            ]),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  GooglePoppinsWidgets(
                    text: "Category",
                    fontsize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                  const Spacer(),
                  CustomGradientButton(
                    height: sizeH * 0.05,
                    width: sizeW * 0.1,
                    onPressed: () {
                      customShowDilogBox(
                          context: context,
                          title: 'Add Category',
                          children: [
                            TextFormFiledContainerWidget(
                                controller: getStroreCtr.categoryCtr,
                                hintText: "Category",
                                title: "Category",
                                width: 200)
                          ],
                          actiononTapfuction: () {
                            getStroreCtr
                                .addCategory(getStroreCtr.categoryCtr.text);
                          },
                          doyouwantActionButton: true);
                    },
                    text: 'Add Category',
                  ),
                  // GestureDetector(
                  //   onTap: () {
                  //     customShowDilogBox(
                  //         context: context,
                  //         title: 'Add Category',
                  //         children: [
                  //           TextFormFiledContainerWidget(
                  //               controller: getStroreCtr.categoryCtr,
                  //               hintText: "Category",
                  //               title: "Category",
                  //               width: 200)
                  //         ],
                  //         actiononTapfuction: () {
                  //           getStroreCtr
                  //               .addCategory(getStroreCtr.categoryCtr.text);
                  //         },
                  //         doyouwantActionButton: true);
                  //   },
                  //   child: Container(
                  //     height: 40,
                  //     decoration: BoxDecoration(
                  //         borderRadius: BorderRadius.circular(10),
                  //         color: cGreen),
                  //     child: Padding(
                  //       padding: const EdgeInsets.all(8.0),
                  //       child: Center(
                  //         child: Padding(
                  //           padding: const EdgeInsets.symmetric(
                  //               vertical: 0, horizontal: 20),
                  //           child: GooglePoppinsWidgets(
                  //               text: "Add Category",
                  //               fontsize: 14,
                  //               color: cWhite),
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('ProductCategory')
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.data!.docs.isEmpty) {
                      return Center(
                        child:
                            GooglePoppinsWidgets(text: "No data", fontsize: 15),
                      );
                    } else if (!snapshot.hasData) {
                      return Center(
                        child:
                            GooglePoppinsWidgets(text: "No data", fontsize: 15),
                      );
                    } else {
                      return ListView.separated(
                          itemBuilder: (context, index) {
                            final data = ProductCategoryModel.fromMap(
                                snapshot.data!.docs[index].data());

                            return CategoryTile(
                              data: data,
                            );
                          },
                          separatorBuilder: (context, index) {
                            return sHeight10;
                          },
                          itemCount: snapshot.data!.docs.length);
                    }
                  }),
            ))
          ],
        ),
      ),
    );
  }
}

class CategoryTile extends StatelessWidget {
  CategoryTile({super.key, required this.data});
  final getStroreCtr = Get.put(StoreController());
  final ProductCategoryModel data;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: AppColors.backGroundColor,
          border: Border.all(width: 1, color: Colors.black45)
          // borderRadius: BorderRadius.circular(10),
          ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          children: [
            GooglePoppinsWidgets(text: data.categoryName, fontsize: 16),
            const Spacer(),
            IconButton(
              onPressed: () {
                getStroreCtr.categoryCtr.text = data.categoryName;
                customShowDilogBox(
                    context: context,
                    title: 'Edit Category',
                    children: [
                      TextFormFiledContainerWidget(
                          controller: getStroreCtr.categoryCtr,
                          hintText: "Category",
                          title: "Category",
                          width: 200)
                    ],
                    actiononTapfuction: () {
                      getStroreCtr.editCategory(
                          getStroreCtr.categoryCtr.text, data.docid);
                    },
                    doyouwantActionButton: true);
              },
              icon: iconWidget(
                icon: Icons.edit_note_outlined,
                color: cBlack,
                size: 26,
              ),
            )
          ],
        ),
      ),
    );
  }
}
