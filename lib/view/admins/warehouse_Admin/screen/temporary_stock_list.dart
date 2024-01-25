import 'package:canteen_superadmin_website/controller/excel_controller/excel_controller.dart';
import 'package:canteen_superadmin_website/core/colors/colors.dart';
import 'package:canteen_superadmin_website/core/constant/constant.validate.dart';
import 'package:canteen_superadmin_website/core/core.dart';
import 'package:canteen_superadmin_website/core/fonts/google_poppins.dart';
import 'package:canteen_superadmin_website/model/all_product_model.dart';
import 'package:canteen_superadmin_website/view/admins/delivery_Admin/screen/delivery_prodects.dart';
import 'package:canteen_superadmin_website/view/widgets/button_container_widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TemporaryStockWidget extends StatelessWidget {
  TemporaryStockWidget({super.key});

  final excelCtr = Get.put(ExcelController());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        decoration: BoxDecoration(border: Border.all()),
        width: double.infinity,
        height: size.height - 110,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GooglePoppinsWidgets(
                    text: "Temporary Stock List",
                    fontsize: 25,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
            ),
            Container(
              height: 50,
              decoration: BoxDecoration(
                color: cLateGrey,
                border: Border.all(),
              ),
              child: const Row(
                children: [
                  HeadWidget(
                    headName: 'SL. NO.',
                    flex: 1,
                  ),
                  HeadWidget(
                    headName: 'Item Name',
                    flex: 2,
                  ),
                  HeadWidget(
                    headName: 'Main Category',
                    flex: 2,
                  ),
                  HeadWidget(
                    headName: 'Sub Category',
                    flex: 2,
                  ),
                  HeadWidget(
                    headName: 'Unit',
                    flex: 2,
                  ),
                  HeadWidget(
                    headName: 'Packaging',
                    flex: 2,
                  ),
                  HeadWidget(
                    headName: 'Company',
                    flex: 2,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: StreamBuilder(
                  stream:
                      dataserver.collection("TemporaryStockList").snapshots(),
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
                          final productData = AllProductDetailModel.fromMap(
                              snapshot.data!.docs[index].data());
                          return Row(
                            children: [
                              StockDdetailsWidget(
                                text: '${index + 1}',
                                flex: 1,
                              ),
                              StockDdetailsWidget(
                                  text: productData.productname, flex: 2),
                              StockDdetailsWidget(
                                  text: productData.categoryName, flex: 2),
                              StockDdetailsWidget(
                                  text: productData.subcategoryName, flex: 2),
                              StockDdetailsWidget(
                                  text: productData.unitcategoryName, flex: 2),
                              StockDdetailsWidget(
                                  text: productData.packageType, flex: 2),
                              StockDdetailsWidget(
                                  text: productData.companyName, flex: 2),
                            ],
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const Divider();
                        },
                        itemCount: snapshot.data!.docs.length,
                      );
                    }
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class StockDdetailsWidget extends StatelessWidget {
  const StockDdetailsWidget({
    super.key,
    required this.text,
    required this.flex,
  });
  final String text;
  final int flex;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Center(
        child: Text(
          text,
          style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 12.5),
        ),
      ),
    );
  }
}

class HeadWidget extends StatelessWidget {
  const HeadWidget({super.key, required this.headName, required this.flex});
  final String headName;
  final int flex;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Center(
        child: GooglePoppinsWidgets(
          text: headName,
          fontsize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
