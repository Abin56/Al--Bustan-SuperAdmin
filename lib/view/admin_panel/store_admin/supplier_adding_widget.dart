import 'package:canteen_superadmin_website/controller/profile_controller/profile_controller.dart';
import 'package:canteen_superadmin_website/view/constant/constant.validate.dart';
import 'package:canteen_superadmin_website/view/fonts/google_poppins.dart';
import 'package:canteen_superadmin_website/view/widgets/button_container_widget/button_container_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SuppliersProfile extends StatelessWidget {
  final suppliercontroller = Get.put(Profilecontroller());
  SuppliersProfile({super.key});

  GlobalKey<FormState> fkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          const SizedBox(
              height: double.infinity,
              child: Image(
                image: NetworkImage(
                    "https://www.shutterstock.com/image-photo/middle-eastern-arabic-dishes-assorted-600nw-563091901.jpg"),
              )),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
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
                      controller: suppliercontroller.schoolnamecontroller,
                      hintText: 'Enter your suppliers name',
                      title: "Suppliers Name",
                      width: 300),
                  TextFormFiledContainerWidget(
                      validator: checkFieldEmpty,
                      controller: suppliercontroller.schoolnamecontroller,
                      hintText: 'Enter the Canteen Id',
                      title: "Supplier Id ",
                      width: 300),
                  TextFormFiledContainerWidget(
                      validator: checkFieldEmpty,
                      controller: suppliercontroller.addresscontroller,
                      hintText: 'Enter your  address',
                      title: " Address",
                      width: 300),
                  TextFormFiledContainerWidget(
                      validator: checkFieldEmpty,
                      controller: suppliercontroller.personcontactcontroller,
                      hintText: 'Enter the phone number',
                      title: "Contact Person",
                      width: 300),
                  TextFormFiledContainerWidget(
                      validator: checkFieldEmpty,
                      controller: suppliercontroller.albustancontactcontroller,
                      hintText: 'Enter the Product List',
                      title: "Products",
                      width: 300),
                  Row(
                    children: [
                      // TextFormField( ),
                      Padding(
                        padding: const EdgeInsets.only(
                          right: 10,
                        ),
                        child: TextFormFiledContainerWidget(
                            validator: checkFieldEmpty,
                            controller:
                                suppliercontroller.workingtimecontroller,
                            hintText: 'Starting time',
                            title: "Working Time",
                            width: 145),
                      ),
                      TextFormFiledContainerWidget(
                          validator: checkFieldEmpty,
                          controller: suppliercontroller.workingtimecontroller,
                          hintText: 'Ending time',
                          title: "",
                          width: 145),
                    ],
                  ),
                  // TextFormFiledContainerWidget(
                  //     validator: checkFieldEmpty,
                  //     controller: canteencontroller.schoolnamecontroller,
                  //     hintText: 'Image',
                  //     title: "Upload Image",
                  //     width: 300),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Upload Image"),
                  ),
                  Container(
                    height: 100,
                    width: 200,
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.black)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: ButtonContainerWidget(
                        text: "Save",
                        width: 100,
                        height: 40,
                        fontSize: 18,
                        onTap: () {
                          //print("Arun");
                          //canteencontroller.singUp();

                          // if (fkey.currentState!.validate()) {}
                        }),
                  )
                ]),
          ),
        ],
      ),
    );
  }
}

class TextFormFiledContainerWidget extends StatelessWidget {
  TextEditingController? controller = TextEditingController();
  final String title;
  final String hintText;
  final double width;

  Function(String)? onChanged;
  Iterable<String>? autofillHints;
  FocusNode? focusNode;
  String? Function(String?)? validator;
  Function()? onTap;
  TextInputType? keyboardType;
  bool? enabled;
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
    super.key,
  });

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
                    )),
                focusedErrorBorder: const OutlineInputBorder(
                  // borderRadius: BorderRadius.all(Radius.circular(4)),
                  borderSide: BorderSide(
                    width: 1,
                    style: BorderStyle.none,
                    color: Colors.red,
                  ),
                ),
                contentPadding: const EdgeInsets.all(8.0),
                enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(width: 0.4)),
                hintStyle: const TextStyle(fontSize: 13),
                hintText: hintText,
                focusedBorder: const OutlineInputBorder(
                  //<-- SEE HERE
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
