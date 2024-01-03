import 'package:canteen_superadmin_website/view/colors/colors.dart';
import 'package:canteen_superadmin_website/view/widgets/custom_showDilog/custom_showdilog.dart';
import 'package:canteen_superadmin_website/view/widgets/dashboard_container_widget/widgets/container_widget.dart';
import 'package:flutter/material.dart';

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
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
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
                            product.name,
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
                            '\$${product.singlePrice.toStringAsFixed(2)}',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            width: size.width * 0.1,
                          ),
                          IconButton(
                            onPressed: () {},
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
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: products.length,
                              itemBuilder: (context, index) {
                                final product = products[index];
                                return Container(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Image.network(
                                        product.imageUrl,
                                        width: 60,
                                        height: 60,
                                        fit: BoxFit.cover,
                                      ),
                                      const SizedBox(width: 10),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              product.name,
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                const SizedBox(width: 5),
                                                Text(
                                                  '\$${product.singlePrice}',
                                                ),
                                                SizedBox(
                                                  width: size.width * 0.03,
                                                ),
                                                Row(
                                                  children: [
                                                    IconButton(
                                                      icon: const Icon(
                                                          Icons.remove),
                                                      onPressed: () {
                                                        // Handle decrease count
                                                      },
                                                    ),
                                                    const Text(
                                                        '0'), // Replace with your count variable
                                                    IconButton(
                                                      icon:
                                                          const Icon(Icons.add),
                                                      onPressed: () {
                                                        // Handle increase count
                                                      },
                                                    ),
                                                    SizedBox(
                                                      width: size.width * 0.04,
                                                    ),
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                          color: AppColors
                                                              .blackColor,
                                                        ),
                                                      ),
                                                      height: 50,
                                                      width: 90,
                                                      child: TextField(
                                                        style: const TextStyle(
                                                          fontSize: 16.0,
                                                          color: Colors.black,
                                                        ),
                                                        decoration:
                                                            InputDecoration(
                                                          hintText: "01",
                                                          border:
                                                              OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.0),
                                                            borderSide:
                                                                BorderSide.none,
                                                          ),
                                                        ),
                                                        cursorHeight:
                                                            30, // Customized cursor height
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const SizedBox(height: 5),
                                          Text(
                                            '\$${product.totalPrice.toStringAsFixed(2)}',
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
                                );
                              },
                            ),
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

class Product {
  final String name;
  final String imageUrl;
  final double singlePrice;
  final double totalPrice;

  Product(
      {required this.name,
      required this.imageUrl,
      required this.singlePrice,
      required this.totalPrice});
}

List products = [
  Product(
      name: 'Product A',
      imageUrl:
          'https://images.unsplash.com/photo-1540189549336-e6e99c3679fe?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8NXx8fGVufDB8fHx8fA%3D%3D',
      singlePrice: 45,
      totalPrice: 100.0),
  Product(
      name: 'Product B',
      imageUrl:
          'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8Mnx8fGVufDB8fHx8fA%3D%3D',
      singlePrice: 38,
      totalPrice: 50.0),
];
