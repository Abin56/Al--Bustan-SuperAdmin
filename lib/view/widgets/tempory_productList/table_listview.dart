// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:canteen_superadmin_website/view/fonts/google_poppins.dart';
import 'package:canteen_superadmin_website/view/widgets/tempory_productList/productEdit_widgets/campany_setup.dart';
import 'package:canteen_superadmin_website/view/widgets/tempory_productList/productEdit_widgets/category_setup.dart';
import 'package:canteen_superadmin_website/view/widgets/tempory_productList/productEdit_widgets/inprice_setup.dart';
import 'package:canteen_superadmin_website/view/widgets/tempory_productList/productEdit_widgets/outprice_setup.dart';
import 'package:canteen_superadmin_website/view/widgets/tempory_productList/productEdit_widgets/packagetype_setup.dart';
import 'package:canteen_superadmin_website/view/widgets/tempory_productList/productEdit_widgets/qty_setup.dart';
import 'package:canteen_superadmin_website/view/widgets/tempory_productList/productEdit_widgets/return_setup.dart';
import 'package:canteen_superadmin_website/view/widgets/tempory_productList/productEdit_widgets/unit_setup.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:canteen_superadmin_website/controller/tempProduct_controller.dart/tempProduct_controller.dart';
import 'package:canteen_superadmin_website/view/colors/colors.dart';
import 'package:canteen_superadmin_website/view/widgets/custom_showDilog/custom_showdilog.dart';
import 'package:canteen_superadmin_website/view/widgets/tempory_productList/productEdit_widgets/barcode_setup.dart';
import 'package:canteen_superadmin_website/view/widgets/tempory_productList/productEdit_widgets/product_name.dart';
import 'package:canteen_superadmin_website/view/widgets/textform%20feild%20Widget/textformfeildWidget.dart';

class TableListviewWidget extends StatelessWidget {
  final TempProductController tempProductController =
      Get.put(TempProductController());
  TableListviewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('temporaryCollection')
            .snapshots(),
        builder: (context, snap) {
          if (snap.hasData) {
            return Container(
              height: 600,
              width: 1485,
              decoration: BoxDecoration(
                color: cWhite,
                border: Border.all(
                  color: cBlack.withOpacity(0.4),
                ),
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Column(
                  children: [
                    Expanded(
                        child: SizedBox(
                      width: 1485,
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 10, top: 10),
                            child: Row(
                              children: [
                                ListViewTableHeaderWidget(
                                    width: 30, headerTitle: 'NO'),
                                ListViewTableHeaderWidget(
                                    width: 200,
                                    headerTitle: 'PRODUCT CODE / SKU'),
                                ListViewTableHeaderWidget(
                                    width: 300, headerTitle: 'PRODUCT NAME'),
                                ListViewTableHeaderWidget(
                                    width: 200, headerTitle: 'CATEGORY'),
                                ListViewTableHeaderWidget(
                                    width: 100, headerTitle: 'UNIT'),
                                ListViewTableHeaderWidget(
                                    width: 180,
                                    headerTitle: ' COMPANY NAME / BRAND'),
                                ListViewTableHeaderWidget(
                                    width: 50, headerTitle: 'QTY'),
                                ListViewTableHeaderWidget(
                                    width: 100, headerTitle: 'PACKAGE TYPE'),
                                ListViewTableHeaderWidget(
                                    width: 100, headerTitle: 'Out PRICE'),
                                ListViewTableHeaderWidget(
                                    width: 100, headerTitle: 'OUT PRICE'),
                                ListViewTableHeaderWidget(
                                    width: 100, headerTitle: 'RETURN'),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 10, left: 10, right: 0, bottom: 10),
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: cBlack.withOpacity(0.3))),
                                child: ListView.separated(
                                    // scrollDirection: Axis.horizontal,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      final data = snap.data!.docs[index];
                                      return Padding(
                                        padding: const EdgeInsets.only(
                                            top: 0, left: 0),
                                        child: SizedBox(
                                          height: 48,
                                          child: Row(
                                            children: [
                                              DataContainerWidget(
                                                index: index,
                                                width: 30,
                                                headerTitle: '${index + 1}',
                                              ),
                                              data['barcodeNumber'] == ''
                                                  ? BarcodeSetup(index: index)
                                                  : DataContainerWidget(
                                                      index: index,
                                                      width: 200,
                                                      headerTitle:
                                                          data['barcodeNumber'],
                                                    ),
                                              data['productname'] == ''
                                                  ? const ProductNameEditWidget()
                                                  : GestureDetector(
                                                      onTap: () {
                                                        tempProductController
                                                                .productNameCtr
                                                                .text =
                                                            data['productname'];
                                                        customShowDilogBox(
                                                            context: context,
                                                            title:
                                                                'Product Name',
                                                            children: [
                                                              TextFormFiledContainerWidget(
                                                                  controller:
                                                                      tempProductController
                                                                          .productNameCtr,
                                                                  hintText:
                                                                      'Product Name',
                                                                  title:
                                                                      'Product Name',
                                                                  width: 200)
                                                            ],
                                                            actiontext:
                                                                'UPDATE',
                                                            actiononTapfuction:
                                                                () async {
                                                              tempProductController.productNameEdit(
                                                                  tempProductController
                                                                      .productNameCtr
                                                                      .text,
                                                                  data['docId'],
                                                                  context);
                                                            },
                                                            doyouwantActionButton:
                                                                true);
                                                      },
                                                      child:
                                                          DataContainerWidget(
                                                        index: index,
                                                        width: 300,
                                                        headerTitle:
                                                            data['productname'],
                                                      ),
                                                    ),
                                              data['categoryName'] == '' ||
                                                      data['categoryID'] == ''
                                                  ? CategorySetUpWidget(
                                                      index: index,
                                                    )
                                                  : GestureDetector(
                                                      onTap: () {
                                                        customShowDilogBox(
                                                            context: context,
                                                            title: 'Category',
                                                            children: [
                                                              Container(
                                                                width: 200,
                                                                decoration: BoxDecoration(
                                                                    color: index %
                                                                                2 ==
                                                                            0
                                                                        ? Colors
                                                                            .grey
                                                                            .withOpacity(
                                                                                0.3)
                                                                        : Colors
                                                                            .blue
                                                                            .withOpacity(
                                                                                0.3),
                                                                    border: Border.all(
                                                                        color: cGrey
                                                                            .withOpacity(0.2))),
                                                                child: Center(
                                                                    child:
                                                                        DropdownSearch(
                                                                  items: const [
                                                                    'Vegtable',
                                                                    'fruits'
                                                                  ],
                                                                )),
                                                              )
                                                            ],
                                                            actiontext:
                                                                'UPDATE',
                                                            actiononTapfuction:
                                                                () async {},
                                                            doyouwantActionButton:
                                                                true);
                                                      },
                                                      child:
                                                          DataContainerWidget(
                                                        index: index,
                                                        width: 200,
                                                        headerTitle: data[
                                                            'categoryName'],
                                                      ),
                                                    ),
                                              data['quantityinStock'] == ''
                                                  ? const UnitNameEditWidget()
                                                  : GestureDetector(
                                                      onTap: () {
                                                        tempProductController
                                                                .unitCtr.text =
                                                            data[
                                                                'quantityinStock'];
                                                        customShowDilogBox(
                                                            context: context,
                                                            title: 'UNIT',
                                                            children: [
                                                              TextFormFiledContainerWidget(
                                                                  hintText:
                                                                      'UNIT',
                                                                  title: 'UNIT',
                                                                  width: 200)
                                                            ],
                                                            actiontext:
                                                                'UPDATE',
                                                            actiononTapfuction:
                                                                () async {
                                                              tempProductController
                                                                  .unitEdit(
                                                                      tempProductController
                                                                          .unitCtr
                                                                          .text,
                                                                      data[
                                                                          "docId"],
                                                                      context);
                                                            },
                                                            doyouwantActionButton:
                                                                true);
                                                      },
                                                      child:
                                                          DataContainerWidget(
                                                        index: index,
                                                        width: 100,
                                                        headerTitle: data[
                                                            'quantityinStock'],
                                                      ),
                                                    ),
                                              data['companyName'] == ''
                                                  ? const CompanyORBrandEditWidget()
                                                  : GestureDetector(
                                                      onTap: () {
                                                        customShowDilogBox(
                                                            context: context,
                                                            title: 'Brand Name',
                                                            children: [
                                                              TextFormFiledContainerWidget(
                                                                  hintText:
                                                                      'Brand Name',
                                                                  title:
                                                                      'Brand Name',
                                                                  width: 200)
                                                            ],
                                                            actiontext:
                                                                'UPDATE',
                                                            actiononTapfuction:
                                                                () async {},
                                                            doyouwantActionButton:
                                                                true);
                                                      },
                                                      child:
                                                          DataContainerWidget(
                                                        index: index,
                                                        width: 180,
                                                        headerTitle:
                                                            data['companyName'],
                                                      ),
                                                    ),
                                              data['quantityinStock'] == ''
                                                  ? const QTYEditWidget()
                                                  : GestureDetector(
                                                      onTap: () {
                                                        customShowDilogBox(
                                                            context: context,
                                                            title: 'Quantity',
                                                            children: [
                                                              TextFormFiledContainerWidget(
                                                                  hintText:
                                                                      'Quantity',
                                                                  title:
                                                                      'Quantity',
                                                                  width: 200)
                                                            ],
                                                            actiontext:
                                                                'UPDATE',
                                                            actiononTapfuction:
                                                                () async {},
                                                            doyouwantActionButton:
                                                                true);
                                                      },
                                                      child:
                                                          DataContainerWidget(
                                                        index: index,
                                                        width: 50,
                                                        headerTitle: '100',
                                                      ),
                                                    ),
                                              data['packageType'] == ''
                                                  ? PackageSetUpWidget(
                                                      index: index)
                                                  : GestureDetector(
                                                      onTap: () {
                                                        customShowDilogBox(
                                                            context: context,
                                                            title:
                                                                'PackageType',
                                                            children: [
                                                              Container(
                                                                width: 100,
                                                                decoration: BoxDecoration(
                                                                    color: index %
                                                                                2 ==
                                                                            0
                                                                        ? Colors
                                                                            .grey
                                                                            .withOpacity(
                                                                                0.3)
                                                                        : Colors
                                                                            .blue
                                                                            .withOpacity(
                                                                                0.3),
                                                                    border: Border.all(
                                                                        color: cGrey
                                                                            .withOpacity(0.2))),
                                                                child: Center(
                                                                    child:
                                                                        DropdownSearch(
                                                                  items: const [
                                                                    'Pieces',
                                                                    'Packet',
                                                                    'Cartoon'
                                                                  ],
                                                                )),
                                                              ),
                                                            ],
                                                            actiontext:
                                                                'UPDATE',
                                                            actiononTapfuction:
                                                                () async {},
                                                            doyouwantActionButton:
                                                                true);
                                                      },
                                                      child:
                                                          DataContainerWidget(
                                                        index: index,
                                                        width: 100,
                                                        headerTitle:
                                                            data['packageType'],
                                                      ),
                                                    ),
                                              data['inPrice'] == ''
                                                  ? const InPriceSetupWidget()
                                                  : GestureDetector(
                                                      onTap: () {
                                                        customShowDilogBox(
                                                            context: context,
                                                            title: 'In Price',
                                                            children: [
                                                              TextFormFiledContainerWidget(
                                                                  hintText:
                                                                      'In Price',
                                                                  title:
                                                                      'In Price',
                                                                  width: 200)
                                                            ],
                                                            actiontext:
                                                                'UPDATE',
                                                            actiononTapfuction:
                                                                () async {},
                                                            doyouwantActionButton:
                                                                true);
                                                      },
                                                      child:
                                                          DataContainerWidget(
                                                        index: index,
                                                        width: 100,
                                                        headerTitle:
                                                            data['outPrice'],
                                                      ),
                                                    ),
                                              data['outPrice'] == ''
                                                  ? const OutPriceSetupWidget()
                                                  : GestureDetector(
                                                      onTap: () {
                                                        customShowDilogBox(
                                                            context: context,
                                                            title: 'Out Price',
                                                            children: [
                                                              TextFormFiledContainerWidget(
                                                                  hintText:
                                                                      'Out Price',
                                                                  title:
                                                                      'Out Price',
                                                                  width: 200)
                                                            ],
                                                            actiontext:
                                                                'UPDATE',
                                                            actiononTapfuction:
                                                                () async {},
                                                            doyouwantActionButton:
                                                                true);
                                                      },
                                                      child:
                                                          DataContainerWidget(
                                                        index: index,
                                                        width: 100,
                                                        headerTitle:
                                                            data['inPrice'],
                                                      ),
                                                    ),
                                              GestureDetector(
                                                onTap: () {
                                                  customShowDilogBox(
                                                      context: context,
                                                      title: 'Return',
                                                      children: [
                                                        ReturnSetUpWidget(
                                                          index: index,
                                                        ),
                                                      ],
                                                      actiontext: 'Return it',
                                                      actiononTapfuction:
                                                          () async {},
                                                      doyouwantActionButton:
                                                          true);
                                                },
                                                child: Container(
                                                  width: 100,
                                                  decoration: BoxDecoration(
                                                    color: Colors.red
                                                        .withOpacity(0.4),
                                                    borderRadius:
                                                        const BorderRadius
                                                            .horizontal(),
                                                  ),
                                                  // height: 30,
                                                  child: Center(
                                                    child: GooglePoppinsWidgets(
                                                      textAlign:
                                                          TextAlign.center,
                                                      color: cBlack,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      text: "RETURN",
                                                      fontsize: 10,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                    separatorBuilder:
                                        (BuildContext context, int index) {
                                      return const SizedBox(
                                        height: 10,
                                      );
                                    },
                                    itemCount: snap.data!.docs.length),
                              ),
                            ),
                          )
                        ],
                      ),
                    ))
                  ],
                ),
              ),
            );
          } else {
            return const Center(
              child: Text('No Records Found'),
            );
          }
        });
  }
}

class ListViewTableHeaderWidget extends StatelessWidget {
  final String headerTitle;
  final double? width;

  const ListViewTableHeaderWidget({
    this.width,
    required this.headerTitle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: width,
      decoration: BoxDecoration(
          color: Colors.blue[100],
          border: Border.all(color: cBlack.withOpacity(0.5))),
      child: Center(
        child: Text(
          headerTitle,
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
        ),
      ),
    );
  }
}

class DataContainerWidget extends StatelessWidget {
  final int index;
  final String headerTitle;
  final double? width;
  final Color? color;
  final double? height;

  const DataContainerWidget({
    required this.index,
    this.color,
    this.width,
    this.height,
    required this.headerTitle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          color: index % 2 == 0
              ? Colors.grey.withOpacity(0.3)
              : Colors.blue.withOpacity(0.3),
          border: Border.all(color: cGrey.withOpacity(0.2))),
      child: Center(
        child: Text(
          headerTitle,
          style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 12.5),
        ),
      ),
    );
  }
}
