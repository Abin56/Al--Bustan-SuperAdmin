import 'package:canteen_superadmin_website/controller/delivery_controller/delivery_controller.dart';
import 'package:canteen_superadmin_website/model/all_product_model.dart';
import 'package:canteen_superadmin_website/model/canteen_model.dart';
import 'package:canteen_superadmin_website/model/cart_model.dart';
import 'package:canteen_superadmin_website/core/colors/colors.dart';
import 'package:canteen_superadmin_website/core/constant/constant.validate.dart';
import 'package:canteen_superadmin_website/core/fonts/google_poppins.dart';
import 'package:canteen_superadmin_website/view/admins/warehouse_Admin/screen/stock_upload_widget.dart';
import 'package:canteen_superadmin_website/view/textstysle/textstyle.dart';
import 'package:canteen_superadmin_website/view/widgets/custom_showDilog/custom_showdilog.dart';
import 'package:dropdown_search/dropdown_search.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductScreen extends StatelessWidget {
  ProductScreen({super.key});

  final getDeliveryCtr = Get.put(DeliveryController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
          ),
        ),
        height: size.height * 0.88,
        width: size.width,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(width: 1),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.3),
                                  spreadRadius: 1,
                                  blurRadius: 5,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: TextField(
                                    decoration: InputDecoration(
                                      hintText: '   Search...',
                                      hintStyle: TextStyle(
                                          color: Colors.grey.withOpacity(0.6)),
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.search,
                                      color: Colors.grey),
                                  onPressed: () {},
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
              SizedBox(
                height: size.height * 0.02,
              ),
              const DeliveryHeadWidget(),
              Expanded(
                child: StreamBuilder(
                    stream: getDeliveryCtr.firestore
                        .collection("AvailableProducts")
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.data!.docs.isEmpty) {
                        return Center(
                          child: GooglePoppinsWidgets(
                              text: "No data", fontsize: 15),
                        );
                      } else if (!snapshot.hasData) {
                        return Center(
                          child: GooglePoppinsWidgets(
                              text: "No data", fontsize: 15),
                        );
                      } else {
                        return ListView.separated(
                          itemCount: snapshot.data!.docs.length,
                          separatorBuilder: (context, index) {
                            return const Divider();
                          },
                          itemBuilder: (BuildContext context, index) {
                            final data = AllProductDetailModel.fromMap(
                                snapshot.data!.docs[index].data());
                            return DeliveryProductTile(
                              data: data,
                            );
                          },
                        );
                      }
                    }),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10, bottom: 10),
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [
                              Color(0xFF35B2A2),
                              Color(0xFF11967F),
                              Color(0xFF06876A),
                              Color(0xFF036952),
                            ],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ),
                          borderRadius: BorderRadius.circular(
                              8.0), // Adjust the radius as needed
                        ),
                        child: FloatingActionButton.extended(
                          onPressed: () {
                            // <<<<  showDialog  >>>>>>>
                            customShowDilogBox(
                              context: context,
                              title: "Cart",
                              children: [CartWiget()],
                              actiononTapfuction: () async {
                                // final newlist =
                                await getDeliveryCtr.getCartList();
                                getDeliveryCtr.cartToDeliveryOrder();
                              },
                              doyouwantActionButton: true,
                            );
                          },
                          backgroundColor: Colors.transparent,
                          label: const Text(
                            'Go To Cart',
                            style: TextStyle(
                              color: AppColors.whiteColor,
                            ),
                          ),
                          icon: const Icon(
                            Icons.add,
                            color: AppColors.whiteColor,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                      // child: FloatingActionButton.extended(
                      //   onPressed: () {
                      //     // <<<<  showDialog  >>>>>>>
                      //     customShowDilogBox(
                      //       context: context,
                      //       title: "Cart",
                      //       children: [CartWiget()],
                      //       actiononTapfuction: () async {
                      //         final newlist =
                      //             await getDeliveryCtr.getCartList();
                      //         getDeliveryCtr.cartToDeliveryOrder();
                      //       },
                      //       doyouwantActionButton: true,
                      //     );
                      //   },
                      //   backgroundColor: Colors.green,
                      //   label: const Text(
                      //     'Go To Cart',
                      //     // selectionColor: AppColors.blackColor,
                      //   ),
                      //   icon: const Icon(
                      //     Icons.add,
                      //     color: AppColors.whiteColor,
                      //   ),
                      // ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DeliveryHeadWidget extends StatelessWidget {
  const DeliveryHeadWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Your added Container with gradient decoration
        Container(
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              stops: [0.1, 0.4, 0.6, 0.9],
              colors: [
                Color(0xFF35B2A2),
                Color(0xFF11967F),
                Color(0xFF06876A),
                Color(0xFF036952),
              ],
            ),
            border: Border.all(width: 1),
          ),
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: Center(
                    child: Text(
                      "Image",
                      style: AppTextStyles.textStyle1,
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      "Product Name",
                      style: AppTextStyles.textStyle1,
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      "Company",
                      style: AppTextStyles.textStyle1,
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      "Quantity",
                      style: AppTextStyles.textStyle1,
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      "In price",
                      style: AppTextStyles.textStyle1,
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      "Out Price",
                      style: AppTextStyles.textStyle1,
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      "Action",
                      style: AppTextStyles.textStyle1,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// class DeliveryHeadWidget extends StatelessWidget {
//   const DeliveryHeadWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const SizedBox(
//       height: 80,
//       width: double.infinity,
//       child: Row(
//         children: [
//           SingleHeadWidget(
//             headName: "Product ID",
//           ),
//           SingleHeadWidget(
//             headName: "Product Name",
//           ),
//           SingleHeadWidget(
//             headName: "Quantity",
//           ),
//           SingleHeadWidget(
//             headName: "In price",
//           ),
//           SingleHeadWidget(
//             headName: "Out Price",
//           ),
//           SingleHeadWidget(
//             headName: "Action",
//           )
//         ],
//       ),
//     );
//   }
// }

class SingleHeadWidget extends StatelessWidget {
  const SingleHeadWidget({super.key, required this.headName});
  final String headName;
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Center(
      child: GooglePoppinsWidgets(
        text: headName,
        fontsize: 20,
        fontWeight: FontWeight.w500,
      ),
    ));
  }
}

class DeliveryProductTile extends StatelessWidget {
  DeliveryProductTile({super.key, required this.data});
  final getDeliveryCtr = Get.put(DeliveryController());
  final AllProductDetailModel data;
  @override
  Widget build(BuildContext context) {
//  final   Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        key: key,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Expanded(
                child: CircleAvatar(
                  radius: 24.0,
                  backgroundColor: Colors
                      .transparent, // Set the background color to transparent
                  backgroundImage: NetworkImage(
                    'https://images.unsplash.com/photo-1540189549336-e6e99c3679fe?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8NXx8fGVufDB8fHx8fA%3D%3D',
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    data.productname,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    data.companyName,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    data.quantityinStock.toString(),
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    data.inPrice.toString(),
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    data.outPrice.toString(),
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: IconButton(
                  onPressed: () {
                    getDeliveryCtr.addToCart(data);
                  },
                  icon: const Icon(
                    Icons.shopping_bag,
                    color: AppColors.greyColor,
                    size: 28,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class CartWiget extends StatelessWidget {
  CartWiget({super.key});
  final getDeliveryCtr = Get.put(DeliveryController());
  final DeliveryController getSingleDeliveyCtr = DeliveryController();
  final int amount = 0;
  @override
  Widget build(BuildContext context) {
    final SizeW = MediaQuery.of(context).size.width;
    final SizeH = MediaQuery.of(context).size.height;

    return SizedBox(
      width: SizeW * 0.44,
      height: SizeH * 0.4,
      child: StreamBuilder(
          stream:
              getDeliveryCtr.firestore.collection('DeliveryCart').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.data!.docs.isEmpty) {
              return Center(
                child: GooglePoppinsWidgets(text: "No data", fontsize: 15),
              );
            } else if (!snapshot.hasData) {
              return Center(
                child: GooglePoppinsWidgets(text: "No data", fontsize: 15),
              );
            } else {
              return Column(
                children: [
                  GooglePoppinsWidgets(text: "Select Canteen", fontsize: 16),
                  CartHeadWidget(),
                  Expanded(
                    child: ListView.separated(
                        itemBuilder: (context, index) {
                          List<TextEditingController> controllers =
                              List.generate(
                            snapshot.data!.docs.length,
                            (index) => TextEditingController(),
                          );
                          final data = CartModel.fromMap(
                              snapshot.data!.docs[index].data());
                          controllers[index].text = data.quantity.toString();
                          Size size = MediaQuery.of(context).size;

                          return Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: SizedBox(
                                  width: size.width * 0.01,
                                  height: size.height * 0.1,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.grey[300]!,
                                          width: 2.0,
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.3),
                                            spreadRadius: 2,
                                            blurRadius: 5,
                                            offset: const Offset(0, 3),
                                          ),
                                        ],
                                      ),
                                      child: Image.network(
                                        'https://images.unsplash.com/photo-1540189549336-e6e99c3679fe?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8NXx8fGVufDB8fHx8fA%3D%3D',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Center(
                                  child: GooglePoppinsWidgets(
                                    text: data.productname,
                                    fontsize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    // GestureDetector(
                                    //   onTap: () {
                                    //     getSingleDeliveyCtr.lessQuantity(data);
                                    //   },
                                    // child: Container(
                                    //   height: SizeW * 0.02,
                                    //   width: SizeW * 0.02,
                                    //   decoration: BoxDecoration(
                                    //     color: cWhite,
                                    //     borderRadius:

                                    //         BorderRadius.circular(10),
                                    //     boxShadow: const [
                                    //       BoxShadow(blurRadius: 0.5),
                                    //     ],
                                    //   ),
                                    //   child: Center(
                                    //     child: GooglePoppinsWidgets(
                                    //       text: "-",
                                    //       fontsize: 16,
                                    //     ),
                                    //   ),
                                    // ),
                                    Container(
                                      height: SizeW *
                                          0.02, // Adjusted height for better visibility
                                      width: SizeW *
                                          0.02, // Adjusted width for better visibility
                                      decoration: BoxDecoration(
                                        gradient: const LinearGradient(
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                          colors: [
                                            Color(0xFF35B2A2),
                                            Color(0xFF11967F),
                                            Color(0xFF06876A),
                                            Color(0xFF036952),
                                          ],
                                        ),
                                        borderRadius: BorderRadius.circular(12),
                                        boxShadow: const [
                                          BoxShadow(
                                            color: Colors.grey,
                                            blurRadius: 2,
                                            spreadRadius: 0.1,
                                          ),
                                        ],
                                      ),
                                      child: Material(
                                        color: Colors.transparent,
                                        child: InkWell(
                                          onTap: () {
                                            getSingleDeliveyCtr
                                                .lessQuantity(data);
                                          },
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          child: const Center(
                                            child: Icon(
                                              Icons.remove,
                                              color: Colors.white,
                                              size: 20,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    // ),
                                    sWidtht10,
                                    SizedBox(
                                      height: SizeW * 0.03,
                                      width: SizeW * 0.05,
                                      child: TextField(
                                        textAlign: TextAlign.center,
                                        onChanged: (value) {
                                          getSingleDeliveyCtr.onChangeFuction(
                                              data, value);
                                        },
                                        keyboardType: TextInputType.number,
                                        controller: controllers[index],
                                        decoration: const InputDecoration(
                                            border: OutlineInputBorder()),
                                      ),
                                    ),
                                    sWidtht10,

                                    Container(
                                      height: SizeW * 0.02,
                                      width: SizeW * 0.02,
                                      decoration: BoxDecoration(
                                        gradient: const LinearGradient(
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                          colors: [
                                            Color(0xFF35B2A2),
                                            Color(0xFF11967F),
                                            Color(0xFF06876A),
                                            Color(0xFF036952),
                                          ],
                                        ),
                                        borderRadius: BorderRadius.circular(12),
                                        boxShadow: const [
                                          BoxShadow(
                                            color: Colors.grey,
                                            blurRadius: 2,
                                            spreadRadius: 0.1,
                                          ),
                                        ],
                                      ),
                                      child: Material(
                                        color: Colors.transparent,
                                        child: InkWell(
                                          onTap: () {
                                            getSingleDeliveyCtr
                                                .addQuantity(data);
                                          },
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          child: Center(
                                            child: iconWidget(
                                              icon: Icons.add,
                                              color: Colors.white,
                                              size: 20,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Center(
                                  child: GooglePoppinsWidgets(
                                      text: data.availablequantityinStock
                                          .toString(),
                                      fontsize: 16),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Center(
                                  child: GooglePoppinsWidgets(
                                      text: data.totalAmount.toString(),
                                      fontsize: 16),
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  showDialogWidget(
                                      context: context,
                                      title:
                                          "Are you Sure to Remove item from cart",
                                      function: () {
                                        getDeliveryCtr
                                            .deleteCartItem(data.docId);
                                      });
                                },
                                icon: iconWidget(
                                    icon: Icons.delete_rounded,
                                    color: cred,
                                    size: 25),
                              )
                            ],
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const Divider();
                        },
                        itemCount: snapshot.data!.docs.length),
                  ),
                ],
              );
            }
          }),
    );
  }
}

// class CartTile extends StatelessWidget {
//   CartTile({super.key, required this.data});
//   final CartModel data;
//   DeliveryController getDeliveyCtr = DeliveryController();

//   @override
//   Widget build(BuildContext context) {
//     final SizeW = MediaQuery.of(context).size.width;
//     getDeliveyCtr.quantityCtr.text = data.quantity.toString();
//     return
//   }
// }

class CompanySetUpWidget1 extends StatelessWidget {
  CompanySetUpWidget1({
    Key? key,
  }) : super(key: key);

  final deliveryCtr = Get.put(DeliveryController());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.blue.withOpacity(0.3),
          border: Border.all(color: cGrey.withOpacity(0.2))),
      child: Center(
        child: Form(
          key: _formKey,
          child: DropdownSearch<CanteenModel>(
            validator: (item) {
              if (item == null) {
                return "Required field";
              } else {
                return null;
              }
            },
            asyncItems: (value) {
              deliveryCtr.canteenList.clear();
              return deliveryCtr.fetchcanteenModel();
            },
            itemAsString: (value) => value.schoolName,
            onChanged: (value) async {
              if (value != null) {
                deliveryCtr.canteenName.value = value.schoolName;
                deliveryCtr.canteenID.value = value.docId;
              }
            },
            onSaved: (value) {
              // Do something with the selected value when the form is saved.
              // You can update the data or perform any necessary actions.
              print("Form saved: $value");
            },
            dropdownDecoratorProps: DropDownDecoratorProps(
              baseStyle: GoogleFonts.poppins(
                fontSize: 13,
                color: Colors.black.withOpacity(0.7),
              ),
            ),
            popupProps: const PopupProps.menu(
                showSearchBox: true, searchDelay: Duration(microseconds: 10)),
          ),
        ),
      ),
    );
  }
}

class CartHeadWidget extends StatelessWidget {
  const CartHeadWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              Color(0xFF35B2A2),
              Color(0xFF11967F),
              Color(0xFF06876A),
              Color(0xFF036952),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          // borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildColumnHeader("Image", 14, Colors.white),
              _buildColumnHeader("Name", 14, Colors.white),
              _buildColumnHeader("Qty", 14, Colors.white),
              _buildColumnHeader("Available Qty", 14, Colors.white),
              _buildColumnHeader("Amount", 14, Colors.white),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildColumnHeader(String text, double fontSize, Color textColor) {
    return Expanded(
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.w500,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
