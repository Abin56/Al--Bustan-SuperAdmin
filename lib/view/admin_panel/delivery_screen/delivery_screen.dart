import 'package:canteen_superadmin_website/view/admin_panel/delivery_screen/widgets/custom_button.dart';
import 'package:canteen_superadmin_website/view/admin_panel/delivery_screen/widgets/delivery_container_widget.dart';
import 'package:canteen_superadmin_website/view/textstysle/textstyle.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:canteen_superadmin_website/view/colors/colors.dart';

class DeliveryScreen extends StatelessWidget {
  final List<Map<String, String>> products;
  const DeliveryScreen({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    // final String? selectedValue;
    Size size = MediaQuery.of(context).size;

    return DeliveryContainer(
      height: size.height,
      width: size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //  <<<<<<< CustomButton >>>>>>>>>
              CustomButton(
                text: "text",
                onPressed: () => showPopup(context),
              ),
              //  <<<<<<< DropdownSearch >>>>>>>>>
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 40,
                    width: 250,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color.fromARGB(255, 217, 226, 241),
                          Color.fromARGB(255, 217, 226, 241)
                        ],
                      ),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: const Color.fromARGB(255, 255, 244, 244)
                              .withOpacity(0.3),
                          offset: const Offset(2.0, 2.0),
                          blurRadius: 8.0,
                          spreadRadius: 2.0,
                        ),
                      ],
                    ),
                    child: DropdownSearch<String>(
                      popupProps: PopupProps.menu(
                        showSelectedItems: true,
                        disabledItemFn: (String s) => s.startsWith('I'),
                      ),
                      items: const ["Brazil", "Italia", "Tunisia", 'Canada'],
                      dropdownDecoratorProps: const DropDownDecoratorProps(
                        dropdownSearchDecoration: InputDecoration(
                          labelText: "Select Menu",
                          counterStyle: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                          labelStyle: TextStyle(color: Colors.black),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                          ),
                          hintText: "Select a country",
                          hintStyle: TextStyle(color: Colors.white70),
                          suffixIcon:
                              Icon(Icons.arrow_drop_down, color: Colors.black),
                        ),
                      ),
                      onChanged: (value) {
                        print(value);
                      },
                      selectedItem: "Brazil",
                    ),
                  )),
            ],
          ),
          //  <<<<<<< list(table) >>>>>>>>>
          Container(
            decoration: const BoxDecoration(
              color: AppColors.redColor,
            ),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: Center(
                      child: Text(
                        "Order ID",
                        style: AppTextStyles.textStyle1,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        "Order Name",
                        style: AppTextStyles.textStyle1,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        "Customer Name",
                        style: AppTextStyles.textStyle1,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        "Location",
                        style: AppTextStyles.textStyle1,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        "Order Status",
                        style: AppTextStyles.textStyle1,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        "Delivered Time",
                        style: AppTextStyles.textStyle1,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        "Price",
                        style: AppTextStyles.textStyle1,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          Expanded(
            child: ListView.builder(
              // itemCount: products.length,
              itemCount: 5,
              itemBuilder: (context, index) {
                // final product = products[index];
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Center(
                              child: Text(
                                (index + 1).toString(),
                                overflow: TextOverflow.ellipsis,
                                style: AppTextStyles.deliveryTextStyle1,
                              ),
                            ),
                          ),
                          const Expanded(
                            flex: 1,
                            child: Center(
                              child: Text(
                                "name",
                                // product['name'] ?? '',
                                overflow: TextOverflow.ellipsis,
                                style: AppTextStyles.deliveryTextStyle1,
                              ),
                            ),
                          ),
                          const Expanded(
                            flex: 1,
                            child: Center(
                              child: Text(
                                "apple",
                                // product['productName'] ?? '',
                                overflow: TextOverflow.ellipsis,
                                style: AppTextStyles.deliveryTextStyle1,
                              ),
                            ),
                          ),
                          const Expanded(
                            flex: 1,
                            child: Center(
                              child: Text(
                                "123 Main St, City",
                                // product['deliveredtime'] ?? '',

                                overflow: TextOverflow.ellipsis,
                                style: AppTextStyles.deliveryTextStyle1,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Center(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: AppColors.redColor,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.all(3),
                                  child: Text(
                                    "Pending",
                                    overflow: TextOverflow.ellipsis,
                                    style:
                                        AppTextStyles.pendingDeliveryTextStyle1,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const Expanded(
                            flex: 1,
                            child: Center(
                              child: Text(
                                // product['deliveredtime'] ?? '',
                                "11.30",
                                overflow: TextOverflow.ellipsis,
                                style: AppTextStyles.deliveryTextStyle1,
                              ),
                            ),
                          ),
                          const Expanded(
                            flex: 1,
                            child: Center(
                              child: Text(
                                // product['price'] ?? '22',
                                "120",
                                overflow: TextOverflow.ellipsis,
                                style: AppTextStyles.deliveryTextStyle1,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: Colors.grey.shade200,
                      height: 3,
                    )
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void showPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('aaaaaaaaaaa'),
          content: const Text('kj cxb;kj  '),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }
}
