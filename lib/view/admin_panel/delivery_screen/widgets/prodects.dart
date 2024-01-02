import 'package:canteen_superadmin_website/view/widgets/dashboard_container_widget/widgets/container_widget.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return CustomContainer(
      height: size.height,
      width: size.width,
      child: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          // final product = products[index];
          return Center(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: size.width * 0.1,
                      height: size.height * 0.2,
                      // decoration: BoxDecoration(),
                      child: Image.network(
                        'data:image/jpeg;base64,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',
                        fit: BoxFit.fill,
                      ),
                    ),
                    const Text(
                      'Product Name',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      '5/10',
                      style: TextStyle(fontSize: 16),
                    ),
                    const Text(
                      'Price: \$100',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
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
    );
  }
}
