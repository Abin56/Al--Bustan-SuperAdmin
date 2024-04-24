import 'package:canteen_superadmin_website/controller/suppliers_controller/suppliers_controller.dart';
import 'package:canteen_superadmin_website/model/suppliers_model.dart';
import 'package:canteen_superadmin_website/view/widgets/button_container_widget/custom_button.dart';
import 'package:canteen_superadmin_website/core/colors/colors.dart';
import 'package:canteen_superadmin_website/core/constant/constant.validate.dart';
import 'package:canteen_superadmin_website/core/fonts/google_poppins.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SuppliersProfile extends StatelessWidget {
  final suppliercontroller = Get.put(SuppliersControllers());
  final SuppliersModel? existingSupplier;

  SuppliersProfile({super.key, this.existingSupplier});

  GlobalKey<FormState> fkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    if (existingSupplier != null) {
      suppliercontroller.productnamecontroller.text =
          existingSupplier!.suppliersName;
      suppliercontroller.productquantitycontroller.text =
          existingSupplier!.suppliersId;
      suppliercontroller.suppliersaddresscontroller.text =
          existingSupplier!.suppliersAddress;
      suppliercontroller.contactPersoncontroller.text =
          existingSupplier!.contactPerson;
      suppliercontroller.suppliersProductscontroller.text =
          existingSupplier!.suppliersProducts;
      suppliercontroller.manufacturectsdatecontroller.text =
          existingSupplier!.workstartTime;
      suppliercontroller.expirydatecontroller.text =
          existingSupplier!.workEndTime;
    }

    return Scaffold(
      body: Row(
        children: [
          const SizedBox(
            height: double.infinity,
            child: Image(
              image: NetworkImage(
                  "https://cdn3d.iconscout.com/3d/premium/thumb/courier-boy-8094292-6478869.png?f=webp"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Form(
              key: fkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "SUPPLIERS",
                    style: TextStyle(fontWeight: FontWeight.w800, fontSize: 25),
                  ),
                  const Text("Create an account", style: TextStyle()),
                  TextFormFiledContainerWidget(
                    validator: checkFieldEmpty,
                    controller: suppliercontroller.productnamecontroller,
                    hintText: 'Enter your suppliers name',
                    title: "Suppliers Name",
                    width: 300,
                  ),
                  TextFormFiledContainerWidget(
                    validator: checkFieldEmpty,
                    controller: suppliercontroller.productquantitycontroller,
                    hintText: 'Enter the Canteen Id',
                    title: "Supplier Id ",
                    width: 300,
                  ),
                  TextFormFiledContainerWidget(
                    validator: checkFieldEmpty,
                    controller: suppliercontroller.suppliersaddresscontroller,
                    hintText: 'Enter your address',
                    title: " Address",
                    width: 300,
                  ),
                  TextFormFiledContainerWidget(
                    validator: checkFieldPhoneNumberIsValid,
                    controller: suppliercontroller.contactPersoncontroller,
                    hintText: 'Enter the phone number',
                    title: "Contact Person",
                    width: 300,
                  ),
                  TextFormFiledContainerWidget(
                    validator: checkFieldEmpty,
                    controller: suppliercontroller.suppliersProductscontroller,
                    hintText: 'Enter the Product List',
                    title: "Products",
                    width: 300,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          right: 10,
                        ),
                        child: TextFormFiledContainerWidget(
                          validator: checkFieldEmpty,
                          controller:
                              suppliercontroller.manufacturectsdatecontroller,
                          hintText: 'Starting time',
                          title: "Working Time",
                          width: 145,
                        ),
                      ),
                      TextFormFiledContainerWidget(
                        validator: checkFieldEmpty,
                        controller: suppliercontroller.expirydatecontroller,
                        hintText: 'Ending time',
                        title: "",
                        width: 145,
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Upload Image"),
                  ),
                  GestureDetector(
                    onTap: () async {
                      SuppliersControllers suppliersController = Get.find();
                      Uint8List? pickedImage =
                          await suppliersController.pickCameraImage();
                      if (pickedImage != null) {
                        suppliersController.suppliersImage.value = pickedImage;
                      }
                    },
                    child: Obx(
                      () {
                        Uint8List? imageData =
                            suppliercontroller.suppliersImage.value;
                        return Container(
                          height: 150,
                          width: 250,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: AppColors.lightGreyColor,
                          ),
                          child: imageData != null
                              ? Image.memory(
                                  imageData,
                                  height: 150,
                                  width: 250,
                                  fit: BoxFit.cover,
                                )
                              : const Center(
                                  child: Text(
                                    "Tap to select an image",
                                    style: TextStyle(
                                      color: AppColors.greyColor,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: CustomGradientButton(
                      text: "Ok",
                      height: 40,
                      width: 100,
                      onPressed: () async {
                        SuppliersControllers suppliersController = Get.find();

                        if (fkey.currentState!.validate()) {
                          if (existingSupplier == null) {
                            suppliersController.addSuppliers();
                          } else {
                            suppliersController.editSuppliers(
                              existingSupplier!.docId,
                            );
                          }
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TextFormFiledContainerWidget extends StatelessWidget {
  final TextEditingController? controller;
  final String title;
  final String hintText;
  final double width;
  final Function(String)? onChanged;
  final Iterable<String>? autofillHints;
  final FocusNode? focusNode;
  final String? Function(String?)? validator;
  final Function()? onTap;
  final TextInputType? keyboardType;
  final bool? enabled;

  TextFormFiledContainerWidget({
    required this.hintText,
    required this.title,
    required this.width,
    this.keyboardType,
    this.controller,
    this.autofillHints,
    this.onChanged,
    this.validator,
    this.onTap,
    this.focusNode,
    this.enabled,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GooglePoppinsWidgets(text: title, fontsize: 12),
          SizedBox(
            height: 45,
            width: width,
            child: TextFormField(
              enabled: enabled,
              focusNode: focusNode,
              style: GoogleFonts.poppins(fontSize: 12),
              onChanged: onChanged,
              autofillHints: autofillHints,
              onTap: onTap,
              validator: validator,
              keyboardType: keyboardType,
              controller: controller,
              decoration: InputDecoration(
                errorBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  borderSide: BorderSide(
                    width: 1,
                    style: BorderStyle.none,
                    color: Colors.red,
                  ),
                ),
                focusedErrorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1,
                    style: BorderStyle.none,
                    color: Colors.red,
                  ),
                ),
                contentPadding: const EdgeInsets.all(8.0),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(width: 0.4),
                ),
                hintStyle: const TextStyle(fontSize: 13),
                hintText: hintText,
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Colors.green),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

// class SuppliersListStream extends StatelessWidget {
//   const SuppliersListStream({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<QuerySnapshot>(
//       stream:
//           FirebaseFirestore.instance.collection('SuppliersList').snapshots(),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const CircularProgressIndicator();
//         }

//         if (snapshot.hasError) {
//           return Text('Error: ${snapshot.error}');
//         }

//         List<DocumentSnapshot> documents = snapshot.data!.docs;

//         return ListView.builder(
//           itemCount: documents.length,
//           itemBuilder: (context, index) {
//             var supplierData = documents[index].data() as Map<String, dynamic>;

//             return ListTile(
//               title: Text("Supplier Name: ${supplierData['suppliersName']}"),
//               subtitle: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text("Supplier ID: ${supplierData['suppliersId']}"),
//                   Text("Address: ${supplierData['suppliersAddress']}"),
//                   Text("Contact Person: ${supplierData['contactPerson']}"),
//                   Text("Products: ${supplierData['suppliersProducts']}"),
//                   Text("Work Start Time: ${supplierData['workstartTime']}"),
//                   Text("Work End Time: ${supplierData['workEndTime']}"),
//                 ],
//               ),
//             );
//           },
//         );
//       },
//     );
//   }
// }


