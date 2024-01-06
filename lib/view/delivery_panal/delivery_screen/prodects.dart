import 'package:canteen_superadmin_website/controller/delivery_controller/cart_controller.dart';
import 'package:canteen_superadmin_website/model/delivery_model.dart';
import 'package:canteen_superadmin_website/view/colors/colors.dart';
import 'package:canteen_superadmin_website/view/widgets/custom_showDilog/custom_showdilog.dart';
import 'package:canteen_superadmin_website/view/widgets/dashboard_container_widget/widgets/container_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return CustomContainer(
      height: size.height - 66,
      width: size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: SizedBox(
              height: size.height * 0.045,
              width: size.width * 0.78,
              child: Row(
                children: [
                  const Expanded(
                    child: TextField(
                      // controller: ,
                      decoration: InputDecoration(
                        hintText: 'Search...',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () {
                      // print('Searching for: ${_searchController.text}');
                    },
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: DeliveryModel.product.length,
              itemBuilder: (BuildContext context, index) {
                final cartController = Get.put(CartController());
                final product = DeliveryModel.product[index];
                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    key: key,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: size.width * 0.06,
                            height: size.height * 0.1,
                            // decoration: BoxDecoration(),
                            child: Image.network(
                              product.imageUrl,
                              fit: BoxFit.fill,
                            ),
                          ),
                          SizedBox(
                            width: size.width * 0.1,
                          ),
                          Text(
                            product.productname,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            width: size.width * 0.1,
                          ),
                          const Text(
                            'Quantity : 32',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            width: size.width * 0.1,
                          ),
                          Text(
                            '\$${product.productprice.toString()}',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            width: size.width * 0.1,
                          ),
                          IconButton(
                            onPressed: () {
                              cartController.addProductToCart(
                                  DeliveryModel.product[index]);
                            },
                            icon: const Icon(
                              Icons.shopping_bag,
                              color: AppColors.greyColor,
                              size: 28,
                            ),
                          )
                        ],
                      ),
                      Divider(
                        color: Colors.grey.shade200,
                        height: 3,
                      )
                    ],
                  ),
                );
              },
            ),
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
                        children: [
                          SizedBox(
                            width: size.width * 0.3,
                            child: CartShowDilog(size: size),
                          ),
                        ],
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
    );
  }
}

class CartShowDilog extends StatelessWidget {
  final CollectionReference data =
      FirebaseFirestore.instance.collection("userCart");
  final CartController c = Get.put(CartController());
  CartShowDilog({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('userCart').snapshots(),
      builder: (context, snapshot) {
        return ListView.builder(
          shrinkWrap: true,
          itemCount: snapshot.data!.docs.length,
          itemBuilder: (context, index) {
            final product = DeliveryModel.product[index];
            final data = snapshot.data!.docs[index];
            return Container(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Image.network(
                    data['productimage'],
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.productname,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            const SizedBox(width: 5),
                            Text(data['productname']),
                            SizedBox(
                              width: size.width * 0.03,
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: IconButton(
                                    icon: const Icon(Icons.remove),
                                    onPressed: () {
                                      c.decrement();
                                    },
                                  ),
                                ),
                                Obx(
                                  () => Text(
                                    "${c.cart.toString()}",
                                    style: TextStyle(
                                      fontSize: 30,
                                    ),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: AppColors.blackColor,
                                    ),
                                  ),
                                  height: 50,
                                  width: 90,
                                  child: TextField(
                                    style: const TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.black,
                                    ),
                                    decoration: InputDecoration(
                                      hintText: "01",
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        borderSide: BorderSide.none,
                                      ),
                                    ),
                                    cursorHeight:
                                        30, // Customized cursor height
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: IconButton(
                                    icon: const Icon(Icons.add),
                                    onPressed: () {
                                      c.increment();
                                    },
                                  ),
                                ),
                                SizedBox(
                                  width: size.width * 0.06,
                                ),
                                Text(
                                  data['productprice'],
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
