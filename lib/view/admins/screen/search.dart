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
              onChanged: (String keyword) {
                if (keyword.isNotEmpty) {
                  allProductCtr.searchProductsByName(keyword);
                }
              },
              decoration: InputDecoration(
                labelText: 'Search by Product Name',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    String keyword = searchController.text.trim();
                    if (keyword.isNotEmpty) {
                      allProductCtr.searchProductsByName(keyword);
                    } else {
                      Get.snackbar('Error', 'Please enter a search term',
                          snackPosition: SnackPosition.BOTTOM);
                    }
                  },
                ),
              ),
            ),
            Expanded(
              child: Obx(
                () {
                  if (allProductCtr.loading.value) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  List<AllProductDetailModel> searchResults =
                      allProductCtr.searchResults;

                  if (allProductCtr.error.value.isNotEmpty) {
                    return Center(
                      child: Text(allProductCtr.error.value),
                    );
                  }

                  if (searchResults.isEmpty) {
                    return Center(
                      child: Text('No results found.'),
                    );
                  }

                  return ListView.builder(
                    itemCount: searchResults.length,
                    itemBuilder: (context, index) {
                      AllProductDetailModel product = searchResults[index];
                      return ListTile(
                        title: Text(product.productname),
                        subtitle: Text('Company: ${product.companyName}'),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
