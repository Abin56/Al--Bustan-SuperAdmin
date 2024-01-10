import 'package:canteen_superadmin_website/controller/store_controller.dart';
import 'package:canteen_superadmin_website/model/quantity_model.dart';
import 'package:canteen_superadmin_website/view/colors/colors.dart';
import 'package:canteen_superadmin_website/view/constant/constant.validate.dart';
import 'package:canteen_superadmin_website/view/fonts/google_poppins.dart';
import 'package:canteen_superadmin_website/view/widgets/custom_showDilog/custom_showdilog.dart';
import 'package:canteen_superadmin_website/view/widgets/textform%20feild%20Widget/textformfeildWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuantityWidget extends StatelessWidget {
  QuantityWidget({super.key});
  final getStroreCtr = Get.put(StoreController());

  @override
  Widget build(BuildContext context) {
    // final sizeW = MediaQuery.of(context).size.width;
    final sizeH = MediaQuery.of(context).size.height;

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
                    text: "Quantity",
                    fontsize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      customShowDilogBox(
                          context: context,
                          title: 'Add Quantity',
                          children: [
                            TextFormFiledContainerWidget(
                                controller: getStroreCtr.quantityCtr,
                                hintText: "Quantity",
                                title: "Quantity",
                                width: 200)
                          ],
                          actiononTapfuction: () {
                            getStroreCtr
                                .addQuantity(getStroreCtr.quantityCtr.text);
                          },
                          doyouwantActionButton: true);
                    },
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: cGreen),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 0, horizontal: 20),
                            child: GooglePoppinsWidgets(
                                text: "Add Quantity",
                                fontsize: 14,
                                color: cWhite),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: StreamBuilder(
                  stream: getStroreCtr.fireStore
                      .collection('UnitCategory')
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
                    }
                    return ListView.separated(
                        itemBuilder: (context, index) {
                          final data = ProductQuantityModel.fromMap(
                              snapshot.data!.docs[index].data());
                          return QuantityTile(
                            data: data,
                          );
                        },
                        separatorBuilder: (context, index) {
                          return sHeight10;
                        },
                        itemCount: snapshot.data!.docs.length);
                  }),
            ))
          ],
        ),
      ),
    );
  }
}

class QuantityTile extends StatelessWidget {
  QuantityTile({super.key, required this.data});
  final getStroreCtr = Get.put(StoreController());
  final ProductQuantityModel data;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: cLateGrey,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          children: [
            GooglePoppinsWidgets(text: data.quantityTypeName, fontsize: 16),
            const Spacer(),
            IconButton(
                onPressed: () {
                  getStroreCtr.quantityCtr.text = data.quantityTypeName;
                  customShowDilogBox(
                      context: context,
                      title: 'Edit Category',
                      children: [
                        TextFormFiledContainerWidget(
                            controller: getStroreCtr.quantityCtr,
                            hintText: "Quantity",
                            title: "Quantity",
                            width: 200)
                      ],
                      actiononTapfuction: () {
                        getStroreCtr.editQuantity(
                            getStroreCtr.quantityCtr.text, data.docid);
                      },
                      doyouwantActionButton: true);
                },
                icon: iconWidget(icon: Icons.edit, color: cBlack, size: 16))
          ],
        ),
      ),
    );
  }
}
