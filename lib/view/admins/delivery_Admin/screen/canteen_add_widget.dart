import 'package:canteen_superadmin_website/controller/canteen_controller/canteen_controller.dart';
import 'package:canteen_superadmin_website/view/widgets/button_container_widget/custom_button.dart';
import 'package:canteen_superadmin_website/core/constant/constant.validate.dart';
import 'package:canteen_superadmin_website/view/widgets/button_container_widget/button_container_widget.dart';
import 'package:canteen_superadmin_website/view/widgets/textform%20feild%20Widget/textformfeildWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CanteenProfile extends StatelessWidget {
  // final canteencontroller = Get.put(Profilecontroller());
  CanteenProfile({super.key});

final  GlobalKey<FormState> fkey = GlobalKey<FormState>();
  final canteenCtr = Get.put(CanteenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: fkey,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              Obx(
                () => canteenCtr.canteenImage.value != null
                    ? SizedBox(
                        height: double.infinity,
                        child: Image(
                            image: MemoryImage(canteenCtr.canteenImage.value!)))
                    : const SizedBox(
                        height: double.infinity,
                        child: Image(
                          image: NetworkImage(
                              "https://www.shutterstock.com/image-photo/middle-eastern-arabic-dishes-assorted-600nw-563091901.jpg"),
                        ),
                      ),
              ),
              Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "CANTEEN",
                      style:
                          TextStyle(fontWeight: FontWeight.w800, fontSize: 25),
                    ),
                    const Text("Create an account", style: TextStyle()),
                    TextFormFiledContainerWidget(
                        validator: checkFieldEmpty,
                        controller: canteenCtr.schoolNameCtr,
                        hintText: 'Enter your school name',
                        title: "School Name",
                        width: 300),
                    TextFormFiledContainerWidget(
                        validator: checkFieldEmpty,
                        controller: canteenCtr.canteenIdCtr,
                        hintText: 'Enter the Canteen Id',
                        title: "Canteen Id ",
                        width: 300),
                    TextFormFiledContainerWidget(
                        validator: checkFieldEmpty,
                        controller: canteenCtr.schoolAddressCtr,
                        hintText: 'Enter the school address',
                        title: "School Address",
                        width: 300),
                    TextFormFiledContainerWidget(
                        validator: checkFieldEmpty,
                        controller: canteenCtr.contactPersonCtr,
                        hintText: 'Enter the phone number',
                        title: "Contact Person",
                        width: 300),
                    TextFormFiledContainerWidget(
                        validator: checkFieldEmpty,
                        controller: canteenCtr.albustanPersonCtr,
                        hintText: 'Enter the phone number',
                        title: "Albustan Person",
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
                              controller: canteenCtr.workstartTimeCtr,
                              hintText: 'Starting time',
                              title: "Working Time",
                              width: 145),
                        ),
                        TextFormFiledContainerWidget(
                            validator: checkFieldEmpty,
                            controller: canteenCtr.workEndTimeCtr,
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
                    Obx(
                      () => CustomGradientButton(
                          text: canteenCtr.canteenImage.value == null
                              ? 'Choose Image'
                              : "Change Image",
                          height: 50,
                          width: 300,
                          onPressed: () async {
                            canteenCtr.canteenImage.value =
                                await canteenCtr.pickImage();
                          }),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: ButtonContainerWidget(
                          text: "Save",
                          width: 100,
                          height: 40,
                          fontSize: 18,
                          onTap: () {
                            if (fkey.currentState?.validate() ?? false) {
                              // If the form is valid, process the data.
                              // You can perform actions here, like submitting the data to a server.
                              // For now, just print the entered value.
                              canteenCtr.addCanteen();
                            }
                          }),
                    )
                  ]),
            ],
          ),
        ),
      ),
    );
  }
}
