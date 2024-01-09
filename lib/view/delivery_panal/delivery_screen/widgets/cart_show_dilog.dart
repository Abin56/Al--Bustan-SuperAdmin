import 'package:canteen_superadmin_website/controller/delivery_controller/cart_controller.dart';
import 'package:canteen_superadmin_website/model/delivery_model.dart';
import 'package:canteen_superadmin_website/view/colors/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return const Center(child: Text('No data available'));
        }

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
                                      c.decrement(product);
                                    },
                                  ),
                                ),
                                Obx(
                                  () => Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: AppColors.blackColor,
                                      ),
                                    ),
                                    height: 50,
                                    width: 90,
                                    child: TextField(
                                      controller: TextEditingController(
                                          text: c.products[product].toString()),
                                      style: const TextStyle(
                                        fontSize: 16.0,
                                        color: Colors.black,
                                      ),
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        hintText: "Enter count",
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          borderSide: BorderSide.none,
                                        ),
                                      ),
                                      onChanged: (value) {
                                        if (value.isNotEmpty) {
                                          c.products[product] =
                                              int.parse(value);
                                        }
                                      },
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: IconButton(
                                    icon: const Icon(Icons.add),
                                    onPressed: () {
                                      c.increment(product);
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
