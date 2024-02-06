import 'package:canteen_superadmin_website/controller/excel_controller/excel_controller.dart';
import 'package:canteen_superadmin_website/controller/wearhouse_controller/wearhouse_controller.dart';
import 'package:canteen_superadmin_website/core/colors/colors.dart';
import 'package:canteen_superadmin_website/core/constant/const.dart';
import 'package:canteen_superadmin_website/core/constant/constant.validate.dart';
import 'package:canteen_superadmin_website/core/core.dart';
import 'package:canteen_superadmin_website/core/fonts/google_poppins.dart';
import 'package:canteen_superadmin_website/model/all_product_model.dart';
import 'package:canteen_superadmin_website/model/category_model.dart';
import 'package:canteen_superadmin_website/model/packagetype_model.dart';
import 'package:canteen_superadmin_website/model/quantity_model.dart';
import 'package:canteen_superadmin_website/model/subcategory_model.dart';
import 'package:canteen_superadmin_website/model/suppliers_model.dart';
import 'package:canteen_superadmin_website/view/admins/warehouse_Admin/screen/temporary_stock_list.dart';
import 'package:canteen_superadmin_website/view/widgets/button_container_widget/button_container_widget.dart';
import 'package:canteen_superadmin_website/view/widgets/responsive/responsive.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marquee/marquee.dart';

class StockUploadWidget extends StatelessWidget {
  StockUploadWidget({super.key});

  final excelCtr = Get.put(ExcelController());
  final warehouseCtr = Get.put(WearHouseController());
  final GlobalKey<FormState> fkey = GlobalKey<FormState>();
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Form(
        key: fkey,
        child: ResponsiveWebSite.isDesktop(context)
            ? StockUploadContainer(
                size: size,
                excelCtr: excelCtr,
                warehouseCtr: warehouseCtr,
                fkey: fkey)
            : SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: StockUploadContainer(
                    size: size,
                    excelCtr: excelCtr,
                    warehouseCtr: warehouseCtr,
                    fkey: fkey),
              ),
      ),
    );
  }
}

class StockUploadContainer extends StatelessWidget {
  const StockUploadContainer({
    super.key,
    required this.size,
    required this.excelCtr,
    required this.warehouseCtr,
    required this.fkey,
  });

  final Size size;
  final ExcelController excelCtr;
  final WearHouseController warehouseCtr;
  final GlobalKey<FormState> fkey;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all()),
      // width: 1180,
      width: ResponsiveWebSite.isDesktop(context) ? size.width : 1180,
      height: size.height - 110,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: StreamBuilder(
                stream: dataserver.collection('Stock').snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const SizedBox();
                  } else if (!snapshot.hasData) {
                    return const SizedBox();
                  } else {
                    return Row(
                      children: [
                        GooglePoppinsWidgets(
                          text: "ADD STOCK",
                          fontsize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 50),
                          child: ButtonContainerWidget(
                              text: snapshot.data!.docs.isNotEmpty
                                  ? "UPLOAD NEXT EXCEL"
                                  : 'UPLOAD EXCEL',
                              width: 120,
                              height: 40,
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                              onTap: () async {
                                await excelCtr.uploadExcelFunction2();
                              }),
                        ),
                        sWidtht10,
                        snapshot.data!.docs.isNotEmpty
                            ? Obx(
                                () => warehouseCtr.isLoading.value == false
                                    ? Padding(
                                        padding:
                                            const EdgeInsets.only(left: 50),
                                        child: ButtonContainerWidget(
                                            text: 'UPLOAD TO TEMPORARY LIST',
                                            width: 200,
                                            height: 40,
                                            fontSize: 11,
                                            fontWeight: FontWeight.bold,
                                            onTap: () async {
                                              if (fkey.currentState
                                                      ?.validate() ??
                                                  false) {
                                                showDialogWidget(
                                                    context: context,
                                                    title:
                                                        'Are you sure to add all stock to temporary list',
                                                    function: () {
                                                      warehouseCtr
                                                          .addToAllStock();
                                                    });
                                              }
                                            }),
                                      )
                                    : const CircularProgressIndicator(),
                              )
                            : const SizedBox(),
                        snapshot.data!.docs.isNotEmpty
                            ? Padding(
                                padding: const EdgeInsets.only(left: 50),
                                child: ButtonContainerWidget(
                                  text: 'DELETE ALL',
                                  width: 120,
                                  height: 40,
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                  onTap: () async {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          shape: LinearBorder.none,
                                          title: GooglePoppinsWidgets(
                                              text:
                                                  'Are you sure to delete all items ?',
                                              fontsize: 14),
                                          actions: [
                                            TextButton(
                                              child: GooglePoppinsWidgets(
                                                text: 'No',
                                                fontsize: 14,
                                              ),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                            ),
                                            TextButton(
                                              child: GooglePoppinsWidgets(
                                                text: 'Yes',
                                                fontsize: 14,
                                              ),
                                              onPressed: () {
                                                warehouseCtr.deleteAllStock();
                                                Navigator.of(context).pop();
                                              },
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                ),
                              )
                            : const SizedBox(),
                      ],
                    );
                  }
                }),
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
                stream: dataserver.collection("Stock").snapshots(),
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
                        return StockTileWidget(
                          productData: productData,
                          warehouseCtr: warehouseCtr,
                          index: index,
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
    );
  }
}

class StockTileWidget extends StatelessWidget {
  StockTileWidget({
    super.key,
    required this.productData,
    required this.warehouseCtr,
    required this.index,
  });
  final int index;
  final AllProductDetailModel productData;
  final WearHouseController warehouseCtr;
  final WearHouseController wearhctr = WearHouseController();
  @override
  Widget build(BuildContext context) {
    wearhctr.stockNameCtr.text = productData.productname;
    return Row(
      children: [
        productData.isEdit == false
            ? PopupMenuButton(
                itemBuilder: (context) {
                  return [
                    PopupMenuItem(
                      onTap: () {
                        warehouseCtr.enableEdit(productData.docId);
                      },
                      child: GooglePoppinsWidgets(text: "Edit", fontsize: 14),
                    ),
                    PopupMenuItem(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              shape: LinearBorder.none,
                              title: GooglePoppinsWidgets(
                                  text: 'Are you sure to delete ?',
                                  fontsize: 14),
                              actions: [
                                TextButton(
                                  child: GooglePoppinsWidgets(
                                    text: 'No',
                                    fontsize: 14,
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                                TextButton(
                                  child: GooglePoppinsWidgets(
                                    text: 'Yes',
                                    fontsize: 14,
                                  ),
                                  onPressed: () {
                                    warehouseCtr.deleteStock(productData.docId);
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: GooglePoppinsWidgets(text: "Delete", fontsize: 14),
                    ),
                  ];
                },
              )
            : TextButton(
                onPressed: () {
                  if (wearhctr.stockNameCtr.text.isNotEmpty) {
                    dataserver
                        .collection('Stock')
                        .doc(productData.docId)
                        .update({'productname': wearhctr.stockNameCtr.text});
                    warehouseCtr.disenableEdit(productData.docId);
                  } else {
                    showToast(msg: "Enter Product name");
                  }
                },
                child: GooglePoppinsWidgets(text: 'Update', fontsize: 14)),
        StockDdetailsWidget(
          text: '${index + 1}',
          flex: 1,
        ),
        productData.isEdit == false
            ? StockDdetailsWidget(text: productData.productname, flex: 2)
            : SizedBox(
                width: 200,
                height: 50,
                child: TextField(
                  decoration: InputDecoration(
                      hintText: productData.productname,
                      border: const OutlineInputBorder()),
                  // controller: textControllers[index],
                  controller: wearhctr.stockNameCtr,
                ),
              ),
        productData.categoryID == ""
            ? Expanded(
                flex: 2,
                child: CategorySetUpWidget(index: index, data: productData))
            : Expanded(
                flex: 2,
                child: Row(
                  children: [
                    Expanded(
                      child: Center(
                        child: Text(
                          productData.categoryName,
                          style: const TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 12.5),
                        ),
                      ),
                    ),
                    productData.isEdit == true
                        ? IconButton(
                            onPressed: () {
                              warehouseCtr.productCategoryEdit(
                                  "", "", productData.docId);
                            },
                            icon: const Icon(
                              Icons.edit_note_rounded,
                              color: cBlue,
                            ),
                          )
                        : const SizedBox(),
                  ],
                ),
              ),
        productData.subcategoryID == ""
            ? Expanded(
                flex: 2,
                child: SubCategorySetUpWidget(index: index, data: productData))
            : Expanded(
                flex: 2,
                child: Row(
                  children: [
                    Expanded(
                      child: Center(
                        child: Text(
                          productData.subcategoryName,
                          style: const TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 12.5),
                        ),
                      ),
                    ),
                    productData.isEdit == true
                        ? IconButton(
                            onPressed: () {
                              warehouseCtr.productSubCategoryEdit(
                                  "", "", productData.docId);
                            },
                            icon: const Icon(
                              Icons.edit_note_rounded,
                              color: cBlue,
                            ),
                          )
                        : const SizedBox()
                  ],
                ),
              ),
        productData.unitcategoryID == ""
            ? Expanded(
                flex: 2,
                child: unitSetUpWidget(index: index, data: productData))
            : Expanded(
                flex: 2,
                child: Row(
                  children: [
                    Expanded(
                      child: Center(
                        child: Text(
                          productData.unitcategoryName,
                          style: const TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 12.5),
                        ),
                      ),
                    ),
                    productData.isEdit == true
                        ? IconButton(
                            onPressed: () {
                              warehouseCtr.productUnitCategoryEdit(
                                  "", "", productData.docId);
                            },
                            icon: const Icon(
                              Icons.edit_note_rounded,
                              color: cBlue,
                            ),
                          )
                        : const SizedBox()
                  ],
                ),
              ),
        productData.packageTypeID == ""
            ? Expanded(
                flex: 2,
                child: PackageSetUpWidget(index: index, data: productData))
            : Expanded(
                flex: 2,
                child: Row(
                  children: [
                    Expanded(
                      child: Center(
                        child: Text(
                          productData.packageType,
                          style: const TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 12.5),
                        ),
                      ),
                    ),
                    productData.isEdit == true
                        ? IconButton(
                            onPressed: () {
                              warehouseCtr.productPackageTypeEdit(
                                  "", "", productData.docId);
                            },
                            icon: const Icon(
                              Icons.edit_note_rounded,
                              color: cBlue,
                            ),
                          )
                        : const SizedBox()
                  ],
                ),
              ),
        productData.companyNameID == ""
            ? Expanded(
                flex: 2,
                child: CompanySetUpWidget(index: index, data: productData))
            : Expanded(
                flex: 2,
                child: Row(
                  children: [
                    Expanded(
                      child: Center(
                        child: MarqueeWidget(
                            text: productData.companyName,
                            flex: 2,
                            velocity: 100,
                            color: cWhite),
                        // child: Text(
                        //   productData.companyName,
                        //   style: const TextStyle(
                        //       fontWeight: FontWeight.w400, fontSize: 12.5),
                        // ),
                      ),
                    ),
                    productData.isEdit == true
                        ? IconButton(
                            onPressed: () {
                              warehouseCtr.productCompanyEdit(
                                  "", "", productData.docId);
                            },
                            icon: const Icon(
                              Icons.edit_note_rounded,
                              color: cBlue,
                            ),
                          )
                        : const SizedBox()
                  ],
                ),
              ),
      ],
    );
  }
}

class CategorySetUpWidget extends StatelessWidget {
  final int index;
  final AllProductDetailModel data;
  CategorySetUpWidget({Key? key, required this.index, required this.data})
      : super(key: key);

  final wearhouseCtr = Get.put(WearHouseController());

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: index % 2 == 0
              ? Colors.grey.withOpacity(0.3)
              : Colors.blue.withOpacity(0.3),
          border: Border.all(color: cGrey.withOpacity(0.2))),
      child: Center(
          child: DropdownSearch<ProductCategoryModel>(
        validator: (item) {
          if (item == null) {
            return "Required field";
          } else {
            return null;
          }
        },
        // autoValidateMode: AutovalidateMode.onUserInteraction,
        asyncItems: (value) {
          wearhouseCtr.productCategoryList.clear();

          return wearhouseCtr.fetchProductCategoryModel();
        },
        itemAsString: (value) => value.categoryName,
        onChanged: (value) async {
          if (value != null) {
            wearhouseCtr.productCategoryName.value = value.categoryName;
            wearhouseCtr.productCategoryID.value = value.docid;
          }
          wearhouseCtr.productCategoryEdit(
              value!.categoryName, value.docid, data.docId);
        },
        dropdownDecoratorProps: DropDownDecoratorProps(
            baseStyle: GoogleFonts.poppins(
                fontSize: 13, color: Colors.black.withOpacity(0.7))),
      )),
    );
  }
}

class SubCategorySetUpWidget extends StatelessWidget {
  final int index;
  final AllProductDetailModel data;
  SubCategorySetUpWidget({Key? key, required this.index, required this.data})
      : super(key: key);

  final wearhouseCtr = Get.put(WearHouseController());

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: index % 2 == 0
              ? Colors.grey.withOpacity(0.3)
              : Colors.blue.withOpacity(0.3),
          border: Border.all(color: cGrey.withOpacity(0.2))),
      child: Center(
          child: DropdownSearch<ProductSubcategoryModel>(
        validator: (item) {
          if (item == null) {
            return "Required field";
          } else {
            return null;
          }
        },
        // autoValidateMode: AutovalidateMode.always,
        asyncItems: (value) {
          wearhouseCtr.productSubCategoryList.clear();

          return wearhouseCtr.fetchProductSubCategoryModel();
        },
        itemAsString: (value) => value.subcategoryName,
        onChanged: (value) async {
          // if (value != null) {
          //   wearhouseCtr.productCategoryName.value = value.categoryName;
          //   wearhouseCtr.productCategoryID.value = value.docid;
          // }
          wearhouseCtr.productSubCategoryEdit(
              value!.subcategoryName, value.docid, data.docId);
        },
        dropdownDecoratorProps: DropDownDecoratorProps(
            baseStyle: GoogleFonts.poppins(
                fontSize: 13, color: Colors.black.withOpacity(0.7))),
      )),
    );
  }
}

class unitSetUpWidget extends StatelessWidget {
  final int index;
  final AllProductDetailModel data;
  unitSetUpWidget({Key? key, required this.index, required this.data})
      : super(key: key);

  final wearhouseCtr = Get.put(WearHouseController());

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: index % 2 == 0
              ? Colors.grey.withOpacity(0.3)
              : Colors.blue.withOpacity(0.3),
          border: Border.all(color: cGrey.withOpacity(0.2))),
      child: Center(
          child: DropdownSearch<UnitCategoryModel>(
        validator: (item) {
          if (item == null) {
            return "Required field";
          } else {
            return null;
          }
        },
        // autoValidateMode: AutovalidateMode.always,
        asyncItems: (value) {
          wearhouseCtr.unitCategoryList.clear();

          return wearhouseCtr.fetchUnitCategoryModel();
        },
        itemAsString: (value) => value.unitCategoryName,
        onChanged: (value) async {
          // if (value != null) {
          //   wearhouseCtr.productCategoryName.value = value.categoryName;
          //   wearhouseCtr.productCategoryID.value = value.docid;
          // }
          wearhouseCtr.productUnitCategoryEdit(
              value!.unitCategoryName, value.docid, data.docId);
        },
        dropdownDecoratorProps: DropDownDecoratorProps(
            baseStyle: GoogleFonts.poppins(
                fontSize: 13, color: Colors.black.withOpacity(0.7))),
      )),
    );
  }
}

class PackageSetUpWidget extends StatelessWidget {
  final int index;
  final AllProductDetailModel data;
  PackageSetUpWidget({Key? key, required this.index, required this.data})
      : super(key: key);

  final wearhouseCtr = Get.put(WearHouseController());

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: index % 2 == 0
              ? Colors.grey.withOpacity(0.3)
              : Colors.blue.withOpacity(0.3),
          border: Border.all(color: cGrey.withOpacity(0.2))),
      child: Center(
          child: DropdownSearch<PackageTypeModel>(
        validator: (item) {
          if (item == null) {
            return "Required field";
          } else {
            return null;
          }
        },
        // autoValidateMode: AutovalidateMode.always,
        asyncItems: (value) {
          wearhouseCtr.packageTypeList.clear();

          return wearhouseCtr.fetchPackageTypeModel();
        },
        itemAsString: (value) => value.typevalue,
        onChanged: (value) async {
          // if (value != null) {
          //   wearhouseCtr.productCategoryName.value = value.categoryName;
          //   wearhouseCtr.productCategoryID.value = value.docid;
          // }
          wearhouseCtr.productPackageTypeEdit(
              value!.typevalue, value.docid, data.docId);
        },
        dropdownDecoratorProps: DropDownDecoratorProps(
            baseStyle: GoogleFonts.poppins(
                fontSize: 13, color: Colors.black.withOpacity(0.7))),
      )),
    );
  }
}

class CompanySetUpWidget extends StatelessWidget {
  final int index;
  final AllProductDetailModel data;
  CompanySetUpWidget({Key? key, required this.index, required this.data})
      : super(key: key);

  final wearhouseCtr = Get.put(WearHouseController());

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: index % 2 == 0
              ? Colors.grey.withOpacity(0.3)
              : Colors.blue.withOpacity(0.3),
          border: Border.all(color: cGrey.withOpacity(0.2))),
      child: Center(
          child: DropdownSearch<SuppliersModel>(
        validator: (item) {
          if (item == null) {
            return "Required field";
          } else {
            return null;
          }
        },
        // autoValidateMode: AutovalidateMode.always,

        asyncItems: (value) {
          wearhouseCtr.supplierList.clear();

          return wearhouseCtr.fetchSupplireModel();
        },

        itemAsString: (value) => value.suppliersName,
        onChanged: (value) async {
          // if (value != null) {
          //   wearhouseCtr.productCategoryName.value = value.categoryName;
          //   wearhouseCtr.productCategoryID.value = value.docid;
          // }
          wearhouseCtr.productCompanyEdit(
              value!.suppliersName, value.docId, data.docId);
        },
        popupProps: const PopupProps.menu(
            searchFieldProps: TextFieldProps(
                decoration: InputDecoration(
                    hintText: 'Search..', border: OutlineInputBorder())),
            showSearchBox: true,
            searchDelay: Duration(milliseconds: 10)),
        dropdownDecoratorProps: DropDownDecoratorProps(
            baseStyle: GoogleFonts.poppins(
                fontSize: 13, color: Colors.black.withOpacity(0.7))),
      )),
    );
  }
}

showDialogWidget(
    {required BuildContext context,
    required String title,
    required Function function}) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        shape: LinearBorder.none,
        title: GooglePoppinsWidgets(text: title, fontsize: 14),
        actions: [
          TextButton(
            child: GooglePoppinsWidgets(
              text: 'No',
              fontsize: 14,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: GooglePoppinsWidgets(
              text: 'Yes',
              fontsize: 14,
            ),
            onPressed: () {
              function();
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

class MarqueeWidget extends StatefulWidget {
  final int flex;
  final String text;
  final Color color;
  final double velocity;
  const MarqueeWidget({
    required this.text,
    required this.flex,
    required this.color,
    super.key,
    required this.velocity,
  });

  @override
  State<MarqueeWidget> createState() => MarqueeWidgetAppState();
}

class MarqueeWidgetAppState extends State<MarqueeWidget> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: widget.flex,
      child: Container(
          height: 45,
          decoration: BoxDecoration(
              border: const Border(
                  right: BorderSide(color: cWhite, width: 5),
                  bottom: BorderSide(color: cWhite)),
              color: widget.color),
          child: InkWell(
            onTap: () {
              // Handle tap event if needed
            },
            onHover: (isHovered) {
              setState(() {
                this.isHovered = isHovered;
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 200, // Specify the width of your container
                height: 50, // Specify the height of your container
                // color: Colors.grey[300], // Container color
                child: Center(
                  child: isHovered
                      ? Marquee(
                          text: widget.text,
                          style: const TextStyle(fontSize: 16),
                          scrollAxis: Axis.horizontal,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          blankSpace: 20.0,
                          velocity: widget.velocity,
                          pauseAfterRound: const Duration(seconds: 1),
                          startPadding: 10.0,
                          accelerationDuration: const Duration(seconds: 1),
                          accelerationCurve: Curves.linear,
                          decelerationDuration:
                              const Duration(milliseconds: 500),
                          decelerationCurve: Curves.easeOut,
                        )
                      : Center(
                          child: Text(
                          widget.text,
                          style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              overflow: TextOverflow.ellipsis),
                        )),
                ),
              ),
            ),
          )
          //  Center(child:
          // GooglePoppinsWidgets(text: text, fontsize: 13,fontWeight: FontWeight.w500,)),
          ),
    );
  }
}
