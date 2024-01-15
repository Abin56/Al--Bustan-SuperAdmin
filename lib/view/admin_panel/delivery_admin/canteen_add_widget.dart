import 'package:canteen_superadmin_website/controller/profile_controller/profile_controller.dart';
import 'package:canteen_superadmin_website/view/constant/constant.validate.dart';
import 'package:canteen_superadmin_website/view/widgets/button_container_widget/button_container_widget.dart';
import 'package:canteen_superadmin_website/view/widgets/textform%20feild%20Widget/textformfeildWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CanteenProfile extends StatelessWidget {
  final canteencontroller = Get.put(Profilecontroller());
  CanteenProfile({super.key});

  GlobalKey<FormState> fkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: fkey,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              const SizedBox(
                  height: double.infinity,
                  child: Image(
                    image: NetworkImage(
                        "https://www.shutterstock.com/image-photo/middle-eastern-arabic-dishes-assorted-600nw-563091901.jpg"),
                  )),
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
                        controller: canteencontroller.schoolnamecontroller,
                        hintText: 'Enter your school name',
                        title: "School Name",
                        width: 300),
                    TextFormFiledContainerWidget(
                        validator: checkFieldEmpty,
                        controller: canteencontroller.schoolnamecontroller,
                        hintText: 'Enter the Canteen Id',
                        title: "Canteen Id ",
                        width: 300),
                    TextFormFiledContainerWidget(
                        validator: checkFieldEmpty,
                        controller: canteencontroller.addresscontroller,
                        hintText: 'Enter the school address',
                        title: "School Address",
                        width: 300),
                    TextFormFiledContainerWidget(
                        validator: checkFieldEmpty,
                        controller: canteencontroller.personcontactcontroller,
                        hintText: 'Enter the phone number',
                        title: "Contact Person",
                        width: 300),
                    TextFormFiledContainerWidget(
                        validator: checkFieldEmpty,
                        controller: canteencontroller.albustancontactcontroller,
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
                              controller:
                                  canteencontroller.workingtimecontroller,
                              hintText: 'Starting time',
                              title: "Working Time",
                              width: 145),
                        ),
                        TextFormFiledContainerWidget(
                            validator: checkFieldEmpty,
                            controller: canteencontroller.workingtimecontroller,
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
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black)),
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
            ],
          ),
        ),
      ),
    );
  }
}
