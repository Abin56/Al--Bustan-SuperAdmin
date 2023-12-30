import 'package:canteen_superadmin_website/view/colors/colors.dart';
import 'package:canteen_superadmin_website/view/constant/constant.validate.dart';
import 'package:canteen_superadmin_website/view/fonts/google_poppins.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InventoryWidget extends StatelessWidget {
  const InventoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final sizeW = MediaQuery.of(context).size.width;
    final sizeH = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        height: sizeH * 0.85,
        width: 1100,
        decoration: BoxDecoration(
            color: cWhite, borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: SizedBox(
                    width: 1050,
                    child: Row(
                      children: [
                        const ImageWidget(
                            image: 'assets/drawer_images/inventory.png'),
                        sWidtht10,
                        GooglePoppinsWidgets(
                          text: 'Invetory Management',
                          fontsize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                        const Spacer(),
                        SizedBox(
                          height: 40,
                          width: sizeW * 0.1,
                          child: const CupertinoSearchTextField(),
                        ),
                        sWidtht10,
                        Container(
                          height: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: cGreen),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: GooglePoppinsWidgets(
                                  text: "+ Add Item",
                                  fontsize: 14,
                                  color: cWhite),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                    child: SizedBox(
                  width: 1050,
                  child: Column(
                    children: [
                      const Row(
                        children: [
                          ListViewTableHeaderWidget(
                              width: 150, headerTitle: 'Item Code'),
                          ListViewTableHeaderWidget(
                              width: 150, headerTitle: 'Photo'),
                          ListViewTableHeaderWidget(
                              width: 150, headerTitle: 'Item Name'),
                          ListViewTableHeaderWidget(
                              width: 150, headerTitle: 'Item Group'),
                          ListViewTableHeaderWidget(
                              width: 150, headerTitle: "Last Purchase"),
                          ListViewTableHeaderWidget(
                              width: 150, headerTitle: "On Hand"),
                          ListViewTableHeaderWidget(
                              width: 150, headerTitle: "Action"),
                        ],
                      ),
                      Expanded(
                        child: Container(
                          decoration: const BoxDecoration(),
                          child: ListView.separated(
                              // scrollDirection: Axis.horizontal,
                              itemBuilder: (BuildContext context, int index) {
                                return InventoryTileWidget(
                                    index: index,
                                    itemCode: "uashu",
                                    image: 'adsad',
                                    itemName: "Carrot",
                                    itemGroup: 'Veg',
                                    purchasDate: '12/12/2023',
                                    stock: '50');
                              },
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return const Divider();
                              },
                              itemCount: 10),
                        ),
                      )
                    ],
                  ),
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class InventoryTileWidget extends StatelessWidget {
  const InventoryTileWidget({
    required this.index,
    required this.itemCode,
    required this.image,
    required this.itemName,
    required this.itemGroup,
    required this.purchasDate,
    required this.stock,
    super.key,
  });

  final int index;
  final String itemCode;
  final String image;
  final String itemName;
  final String itemGroup;
  final String purchasDate;
  final String stock;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: Row(
        children: [
          DataContainerWidget(
            index: index,
            width: 150,
            headerTitle: itemCode,
          ),
          DataContainerWidget(
            index: index,
            width: 150,
            headerTitle: image,
          ),
          DataContainerWidget(
            index: index,
            width: 150,
            headerTitle: itemName,
          ),
          DataContainerWidget(
            index: index,
            width: 150,
            headerTitle: itemGroup,
          ),
          DataContainerWidget(
            index: index,
            width: 150,
            headerTitle: purchasDate,
          ),
          DataContainerWidget(
            index: index,
            width: 150,
            headerTitle: stock,
          ),
          iconWidget(icon: Icons.edit, color: cBlack, size: 15)
        ],
      ),
    );
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
          color: cLateGrey,
          border: Border.symmetric(
            horizontal: BorderSide(color: cBlack.withOpacity(0.5)),
          )),
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
      decoration: const BoxDecoration(
        color: cWhite,
      ),
      child: Center(
        child: Text(
          headerTitle,
          style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 12.5),
        ),
      ),
    );
  }
}

class ImageWidget extends StatelessWidget {
  const ImageWidget({
    required this.image,
    super.key,
  });

  final String image;
  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 30, width: 30, child: Image.asset(image));
  }
}
