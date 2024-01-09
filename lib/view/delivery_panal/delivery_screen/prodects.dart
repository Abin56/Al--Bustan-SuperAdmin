import 'package:canteen_superadmin_website/controller/delivery_controller/delivery_controller.dart';
import 'package:canteen_superadmin_website/model/all_product_model.dart';
import 'package:canteen_superadmin_website/model/cart_model.dart';
import 'package:canteen_superadmin_website/view/colors/colors.dart';
import 'package:canteen_superadmin_website/view/constant/constant.validate.dart';
import 'package:canteen_superadmin_website/view/fonts/google_poppins.dart';
import 'package:canteen_superadmin_website/view/widgets/custom_showDilog/custom_showdilog.dart';
import 'package:canteen_superadmin_website/view/widgets/dashboard_container_widget/widgets/container_widget.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductScreen extends StatelessWidget {
  ProductScreen({super.key});

  final getDeliveryCtr = Get.put(DeliveryController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: CustomContainer(
        height: size.height - 66,
        width: size.width,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 50,
                width: double.infinity,
                child: Row(
                  children: [
                    const Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search...',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    IconButton(
                      icon: const Icon(Icons.search),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              const DeliveryHeadWidget(),
              Expanded(
                child: StreamBuilder(
                    stream: getDeliveryCtr.firestore
                        .collection("AllProduct")
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
                      child: FloatingActionButton.extended(
                        onPressed: () {
                          // <<<<  showDialog  >>>>>>>
                          customShowDilogBox(
                            context: context,
                            title: "Cart",
                            children: [CartWiget()],
                            actiononTapfuction: () async {
                              final newlist =
                                  await getDeliveryCtr.getCartList();
                              getDeliveryCtr.cartToDeliveryOrder();
                            },
                            doyouwantActionButton: true,
                          );
                        },
                        backgroundColor: Colors.green,
                        label: const Text(
                          'Go To Cart',
                          // selectionColor: AppColors.blackColor,
                        ),
                        icon: const Icon(
                          Icons.add,
                          color: AppColors.whiteColor,
                        ),
                      ),
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
    return const SizedBox(
      height: 80,
      width: double.infinity,
      child: Row(
        children: [
          SingleHeadWidget(
            headName: "Product ID",
          ),
          SingleHeadWidget(
            headName: "Product Name",
          ),
          SingleHeadWidget(
            headName: "Quantity",
          ),
          SingleHeadWidget(
            headName: "In price",
          ),
          SingleHeadWidget(
            headName: "Out Price",
          ),
          SingleHeadWidget(
            headName: "Action",
          )
        ],
      ),
    );
  }
}

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
        fontWeight: FontWeight.bold,
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
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        key: key,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: SizedBox(
                  width: size.width * 0.005,
                  height: size.height * 0.1,
                  // decoration: BoxDecoration(),
                  child: Image.network(
                    'https://images.unsplash.com/photo-1540189549336-e6e99c3679fe?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8NXx8fGVufDB8fHx8fA%3D%3D',
                    fit: BoxFit.cover,
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
  DeliveryController getSingleDeliveyCtr = DeliveryController();
  int amount = 0;
  @override
  Widget build(BuildContext context) {
    final SizeW = MediaQuery.of(context).size.width;
    final SizeH = MediaQuery.of(context).size.height;

    return Container(
      width: SizeW * 0.4,
      height: SizeH * 0.3,
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

                          return Container(
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    height: 60,
                                    decoration: const BoxDecoration(
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                'https://images.unsplash.com/photo-1540189549336-e6e99c3679fe?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8NXx8fGVufDB8fHx8fA%3D%3D'),
                                            fit: BoxFit.cover)),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Center(
                                      child: GooglePoppinsWidgets(
                                          text: data.productname,
                                          fontsize: 16)),
                                ),
                                Expanded(
                                    flex: 2,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            getSingleDeliveyCtr
                                                .lessQuantity(data);
                                          },
                                          child: Container(
                                            height: SizeW * 0.02,
                                            width: SizeW * 0.02,
                                            decoration: BoxDecoration(
                                                color: cWhite,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                boxShadow: const [
                                                  BoxShadow(blurRadius: 0.5),
                                                ]),
                                            child: Center(
                                              child: GooglePoppinsWidgets(
                                                  text: "-", fontsize: 16),
                                            ),
                                          ),
                                        ),
                                        sWidtht10,
                                        SizedBox(
                                            height: SizeW * 0.03,
                                            width: SizeW * 0.04,
                                            child: TextField(
                                              onChanged: (value) {
                                                getSingleDeliveyCtr
                                                    .onChangeFuction(
                                                        data, value);
                                              },
                                              keyboardType:
                                                  TextInputType.number,
                                              controller: controllers[index],
                                              decoration: const InputDecoration(
                                                  border: OutlineInputBorder()),
                                            )),
                                        sWidtht10,
                                        GestureDetector(
                                          onTap: () {
                                            getSingleDeliveyCtr
                                                .addQuantity(data);
                                          },
                                          child: Container(
                                            height: SizeW * 0.02,
                                            width: SizeW * 0.02,
                                            decoration: BoxDecoration(
                                                color: cWhite,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                boxShadow: const [
                                                  BoxShadow(blurRadius: 0.5),
                                                ]),
                                            child: iconWidget(
                                                icon: Icons.add,
                                                color: cBlack,
                                                size: 16),
                                          ),
                                        ),
                                      ],
                                    )),
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
                                )
                              ],
                            ),
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

class CartHeadWidget extends StatelessWidget {
  const CartHeadWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Center(
              child: GooglePoppinsWidgets(
                text: "Image",
                fontsize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: GooglePoppinsWidgets(
                text: "Name",
                fontsize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Center(
              child: GooglePoppinsWidgets(
                text: "Qty",
                fontsize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: GooglePoppinsWidgets(
                text: "Available Qty",
                fontsize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: GooglePoppinsWidgets(
                text: "Amount",
                fontsize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
