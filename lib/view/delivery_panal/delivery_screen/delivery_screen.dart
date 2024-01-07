import 'package:canteen_superadmin_website/controller/delivery_controller/delivery_controller.dart';
import 'package:canteen_superadmin_website/controller/employee_controller/employee_controller.dart';
import 'package:canteen_superadmin_website/model/employe_createprofile_model.dart';
import 'package:canteen_superadmin_website/view/constant/constant.validate.dart';
import 'package:canteen_superadmin_website/view/delivery_panal/delivery_screen/widgets/delivery_container_widget.dart';
import 'package:canteen_superadmin_website/view/fonts/google_poppins.dart';
import 'package:canteen_superadmin_website/view/textstysle/textstyle.dart';
import 'package:canteen_superadmin_website/view/widgets/custom_showDilog/custom_showdilog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:canteen_superadmin_website/view/colors/colors.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class DeliveryScreen extends StatelessWidget {
  DeliveryScreen({super.key});

  final employeeController = Get.put(EmployeeController());
  final getDeliveryCtr = Get.put(DeliveryController());

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

              ElevatedButton(
                onPressed: () => customShowDilogBox(
                  context: context,
                  title: "title",
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('Close'),
                    ),
                  ],
                  doyouwantActionButton: true,
                ),
                style: ElevatedButton.styleFrom(
                  foregroundColor: AppColors.greenColor,
                  backgroundColor: AppColors.lightGreyColor,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 32.0, vertical: 16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24.0),
                  ),
                  elevation: 5.0,
                  shadowColor: Colors.grey.withOpacity(0.5),
                ),
                child: const Text(
                  'Click Me!',
                  style: TextStyle(fontSize: 18.0),
                ),
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
              color: AppColors.greenColor,
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
                        "Order Quantity",
                        style: AppTextStyles.textStyle1,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        "Order Time",
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
            child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('deliveryAssignList')
                    .snapshots(),
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
                    return ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        final data = snapshot.data!.docs[index];
                        return Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Center(
                                      child: Text(
                                        data['orderId'],
                                        overflow: TextOverflow.ellipsis,
                                        style: AppTextStyles.deliveryTextStyle1,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Center(
                                      child: Text(
                                        data['orderCount'].toString(),
                                        overflow: TextOverflow.ellipsis,
                                        style: AppTextStyles.deliveryTextStyle1,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Center(
                                      child: Text(
                                        dateConveter(
                                          DateTime.parse(data['time']),
                                        ),
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
                                          color: AppColors.greyColor,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.all(3),
                                          child: data['assignStatus'] == false
                                              ? SizedBox(
                                                  height: 60,
                                                  child: DropdownSearch<
                                                      EmployeeProfileCreateModel>(
                                                    autoValidateMode:
                                                        AutovalidateMode.always,
                                                    asyncItems: (value) {
                                                      employeeController
                                                          .employeeList
                                                          .clear();

                                                      return employeeController
                                                          .fetchEmployees();
                                                    },
                                                    itemAsString: (value) =>
                                                        value.name,
                                                    onChanged: (value) async {
                                                      // employeeController.employeeUID.value = true;
                                                      if (value != null) {
                                                        employeeController
                                                                .employeeUID
                                                                .value =
                                                            value.docid;
                                                        employeeController
                                                                .employeeName =
                                                            value.name;
                                                      }
                                                      final employeeID = Get.find<
                                                              EmployeeController>()
                                                          .employeeUID;
                                                      final emplopeeName = Get.find<
                                                              EmployeeController>()
                                                          .employeeName;
                                                      getDeliveryCtr
                                                          .createDeliveryOrderToEmployee(
                                                              employeeName:
                                                                  emplopeeName,
                                                              employeeId:
                                                                  employeeID
                                                                      .value,
                                                              deliverydata:
                                                                  data);
                                                    },
                                                    dropdownDecoratorProps:
                                                        DropDownDecoratorProps(
                                                      baseStyle:
                                                          GoogleFonts.poppins(
                                                        fontSize: 13,
                                                        color: Colors.black
                                                            .withOpacity(0.7),
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              : Text('Pending'),
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
                                  Expanded(
                                    flex: 1,
                                    child: Center(
                                      child: Text(
                                        data['price'].toString(),
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
                    );
                  }
                }),
          ),
        ],
      ),
    );
  }
}
