import 'package:canteen_superadmin_website/view/colors/colors.dart';
import 'package:canteen_superadmin_website/view/fonts/google_poppins.dart';
import 'package:canteen_superadmin_website/view/widgets/textform%20feild%20Widget/textformfeildWidget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

class TableListviewWidget extends StatelessWidget {
  const TableListviewWidget({super.key});

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
              width: 1300,
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
                      width: 1298,
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 20, top: 10),
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
                                    width: 100, headerTitle: 'PRICE'),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 10, left: 20, right: 0, bottom: 10),
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
                                                  ? Container(
                                                      height: 48,
                                                      decoration: BoxDecoration(
                                                          color: index % 2 == 0
                                                              ? Colors.grey
                                                                  .withOpacity(
                                                                      0.3)
                                                              : Colors.blue
                                                                  .withOpacity(
                                                                      0.3),
                                                          border: Border.all(
                                                              color: cGrey
                                                                  .withOpacity(
                                                                      0.2))),
                                                      width: 200,
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceAround,
                                                        children: [
                                                          Container(
                                                            width: 80,
                                                            decoration:
                                                                const BoxDecoration(
                                                              color:
                                                                  themeColorBlue,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .horizontal(),
                                                            ),
                                                            height: 25,
                                                            child: Center(
                                                              child:
                                                                  GooglePoppinsWidgets(
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                color: cWhite,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                text: "Type",
                                                                fontsize: 10,
                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                            width: 85,
                                                            decoration:
                                                                const BoxDecoration(
                                                              color:
                                                                  themeColorBlue,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .horizontal(),
                                                            ),
                                                            height: 25,
                                                            child: Center(
                                                              child:
                                                                  GooglePoppinsWidgets(
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                color: cWhite,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                text:
                                                                    "Auto Genrate",
                                                                fontsize: 10,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    )
                                                  : DataContainerWidget(
                                                      index: index,
                                                      width: 200,
                                                      headerTitle:
                                                          data['barcodeNumber'],
                                                    ),
                                              data['productname'] == ''
                                                  ? Container(
                                                      height: 48,
                                                      width: 200,
                                                      decoration: BoxDecoration(
                                                          color: index % 2 == 0
                                                              ? Colors.grey
                                                                  .withOpacity(
                                                                      0.3)
                                                              : Colors.blue
                                                                  .withOpacity(
                                                                      0.3),
                                                          border: Border.all(
                                                              color: cGrey
                                                                  .withOpacity(
                                                                      0.2))),
                                                      child: Center(
                                                        child: TextFormFiledContainerWidget(
                                                            hintText:
                                                                'Prodcut Name',
                                                            title:
                                                                "ProductName",
                                                            width: 200),
                                                      ),
                                                    )
                                                  : DataContainerWidget(
                                                      index: index,
                                                      width: 300,
                                                      headerTitle:
                                                          data['productname'],
                                                    ),
                                              Container(
                                                width: 200,
                                                decoration: BoxDecoration(
                                                    color: index % 2 == 0
                                                        ? Colors.grey
                                                            .withOpacity(0.3)
                                                        : Colors.blue
                                                            .withOpacity(0.3),
                                                    border: Border.all(
                                                        color: cGrey
                                                            .withOpacity(0.2))),
                                                child: Center(
                                                    child: DropdownSearch(
                                                  items: const [
                                                    'Vegtable',
                                                    'fruits'
                                                  ],
                                                )),
                                              ),
                                              DataContainerWidget(
                                                index: index,
                                                width: 100,
                                                headerTitle: '1x320g',
                                              ),
                                              DataContainerWidget(
                                                index: index,
                                                width: 180,
                                                headerTitle: 'Al Kabeer',
                                              ),
                                              DataContainerWidget(
                                                index: index,
                                                width: 50,
                                                headerTitle: '100',
                                              ),
                                              Container(
                                                width: 100,
                                                decoration: BoxDecoration(
                                                    color: index % 2 == 0
                                                        ? Colors.grey
                                                            .withOpacity(0.3)
                                                        : Colors.blue
                                                            .withOpacity(0.3),
                                                    border: Border.all(
                                                        color: cGrey
                                                            .withOpacity(0.2))),
                                                child: Center(
                                                    child: DropdownSearch(
                                                  items: const [
                                                    'Pieces',
                                                    'Packet',
                                                    'Cartoon'
                                                  ],
                                                )),
                                              ),
                                              DataContainerWidget(
                                                index: index,
                                                width: 100,
                                                headerTitle: '500/-',
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
