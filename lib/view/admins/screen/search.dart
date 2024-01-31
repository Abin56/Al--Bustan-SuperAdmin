import 'package:canteen_superadmin_website/controller/store_controller/all_product_controller.dart';
import 'package:canteen_superadmin_website/model/all_product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchScreen extends StatelessWidget {
  final AllProductController allProductCtr = Get.find<AllProductController>();
  final TextEditingController searchController = TextEditingController();

  SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: searchController,
              decoration: InputDecoration(
                labelText: 'Search by Product Name',
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () async {
                    String keyword = searchController.text.trim();
                    List<AllProductDetailModel> searchResults =
                        await allProductCtr.searchProductsByName(keyword);

                    if (searchResults.isNotEmpty) {
                      Expanded(
                        child: ListView.builder(
                          itemCount: searchResults.length,
                          itemBuilder: (context, index) {
                            AllProductDetailModel product =
                                searchResults[index];
                            return ListTile(
                              title: Text(product.productname),
                              subtitle: Text('Company: ${product.companyName}'),
                            );
                          },
                        ),
                      );
                    } else {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('No Results'),
                            content: Text(
                              'No products found matching the search criteria.',
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('OK'),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
