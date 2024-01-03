import 'package:canteen_superadmin_website/controller/store_controller.dart';
import 'package:canteen_superadmin_website/model/product_model.dart';
import 'package:canteen_superadmin_website/view/colors/colors.dart';
import 'package:canteen_superadmin_website/view/constant/constant.validate.dart';
import 'package:canteen_superadmin_website/view/fonts/google_poppins.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ProductTempWidget extends StatelessWidget {
  ProductTempWidget({super.key});
  final getCtr = Get.put(StoreController());

  @override
  Widget build(BuildContext context) {
    final sizeW = MediaQuery.of(context).size.width;
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
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                children: [
                  GooglePoppinsWidgets(
                    text: 'Temporary Product List',
                    fontsize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                  MaterialButton(
                    onPressed: () {
                      // getCtr.addTempProductToDB(getCtr.tempProductList);
                    },
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: cGreen),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: GooglePoppinsWidgets(
                              text: "Add Category",
                              fontsize: 14,
                              color: cWhite),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Expanded(
                child: StreamBuilder(
                  stream: getCtr.getProductTempData(),
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
                      return Column(
                        children: [
                          Expanded(
                            child: ListView.separated(
                                itemBuilder: (context, index) {
                                  getCtr.tempProductList = snapshot.data!.docs;
                                  final productdata =
                                      ProductAddingModel.fromMap(
                                          snapshot.data!.docs[index]);
                                  return ProductTempListTile(
                                    product: productdata,
                                    index: index,
                                  );
                                },
                                separatorBuilder: (context, index) {
                                  return sHeight10;
                                },
                                itemCount: snapshot.data!.docs.length),
                          ),
                        ],
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProductTempListTile extends StatelessWidget {
  const ProductTempListTile(
      {super.key, required this.product, required this.index});
  final ProductAddingModel product;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: cLateGrey,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GooglePoppinsWidgets(text: '${index + 1}', fontsize: 15),
            GooglePoppinsWidgets(text: product.barcodeNumber, fontsize: 15),
            GooglePoppinsWidgets(text: product.productname, fontsize: 15),
            GooglePoppinsWidgets(text: product.companyName, fontsize: 15),
            GooglePoppinsWidgets(
                text: product.quantityinStock.toString(), fontsize: 15)
          ],
        ),
      ),
    );
  }
}

class ExcelHeadWidget extends StatelessWidget {
  const ExcelHeadWidget({super.key, required this.product});
  final ProductAddingModel product;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GooglePoppinsWidgets(text: 'SL.NO', fontsize: 15),
        GooglePoppinsWidgets(text: product.barcodeNumber, fontsize: 15),
        GooglePoppinsWidgets(text: product.productname, fontsize: 15),
        GooglePoppinsWidgets(text: product.companyName, fontsize: 15),
        GooglePoppinsWidgets(
            text: product.quantityinStock.toString(), fontsize: 15)
      ],
    );
  }
}
