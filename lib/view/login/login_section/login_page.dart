import 'package:canteen_superadmin_website/controller/login_controller/login_controller.dart';

import 'package:canteen_superadmin_website/view/login/login_section/login_textformfeild.dart';
import 'package:canteen_superadmin_website/view/login/login_section/loginsubmitbutton.dart';
import 'package:canteen_superadmin_website/core/colors/colors.dart';
import 'package:canteen_superadmin_website/core/fonts/google_poppins.dart';
import 'package:canteen_superadmin_website/view/login/who_youAre.dart';
import 'package:canteen_superadmin_website/view/widgets/responsive/responsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginSection extends StatefulWidget {
    final UserLoginController userLoginController =
      Get.put(UserLoginController());
   LoginSection({super.key});

  @override
  State<LoginSection> createState() => _LoginSectionState();
}

class _LoginSectionState extends State<LoginSection> {
  bool value = false;
  @override
  Widget build(BuildContext context) {
    List<Widget> loginWidget = [
      GooglePoppinsWidgets(
        text: 'ALBUSTAN',
        fontsize: 24,
        fontWeight: FontWeight.bold,
        color: Colors.orange,
      ), //////////////////////////////////////////1
      GooglePoppinsWidgets(
        text: 'Create an account',
        fontsize: 20,
        fontWeight: FontWeight.bold,
      ), //////////////////////////////////////////////////2
      Row(
        children: [
          const Expanded(
              child: Padding(
            padding: EdgeInsets.only(left: 100),
            child: Divider(
              color: Colors.grey,
            ),
          )),
          GooglePoppinsWidgets(text: 'Signup', fontsize: 12, color: cGrey),
          const Expanded(
              child: Padding(
            padding: EdgeInsets.only(right: 100),
            child: Divider(
              color: Colors.grey,
            ),
          ))
        ],
      ), /////////////////////////////////////////////////////////////////////3
      LoginTextFormFiledContainerWidget(
        controller: Get.find<UserLoginController>().emailcontroller,
        hintText: 'Enter Email Address',
        title: 'Email Address',
      ), /////////////////////////////////////////////4
      LoginTextFormFiledContainerWidget(
        controller: Get.find<UserLoginController>().passwordcontroller,
        hintText: 'Password',
        title: 'Enter password',
      ), //////////////////////////////////////////////////5
      LoginButtonContainerWidget(
          width: 600,
          text: 'LOG IN',
          height: 50,
          fontSize: 18,
          onTap: () {
            whoAreYou(context);
          }),
      ///////////////////////////////////////////////////////////////6
      // Row(
      //   children: [
      //     const Expanded(
      //         child: Padding(
      //       padding: EdgeInsets.only(left: 100),
      //       child: Divider(
      //         color: Colors.grey,
      //       ),
      //     )),
      //     // GooglePoppinsWidgets(text: 'Continue with', fontsize: 12, color: cGrey),
      //     // const Expanded(
      //     //     child: Padding(
      //     //   padding: EdgeInsets.only(right: 100),
      //     //   child: Divider(
      //     //     color: Colors.grey,
      //     //   ),
      //     // ))
      //   ],
      // ), ///////////////////////////////////////////////////////7
      LoginContainerWidget(
        value: 'superadmin',
        imagepath: 'web_images/super_Admin.jpg',
        text: 'SUPER ADMIN',
      ), //////////////////////////////////////////////////////////////8
      LoginContainerWidget(
        value: 'storeadmin',
        imagepath: 'web_images/store_Admin.jpg',
        text: 'STORE ADMIN',
      ), //////////////////////////////////////////////////////////////////9
      LoginContainerWidget(
        value: 'deliveryadmin',
        imagepath: 'web_images/delivery_admin.jpg',
        text: 'DELIVERY ADMIN',
      ), /////////////////////////////////////////////////////////////////////////////10
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: GooglePoppinsWidgets(
              text: "Don'thave an account",
              fontsize: 14,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 10),
            child: GooglePoppinsWidgets(
              text: "Signup",
              fontsize: 14,
              color: Colors.orange,
            ),
          ),
        ],
      ), //////////////////////////////////////////////////////////////////////////////11
      LoginContainerWidget(
        value: 'wearhouseadmin',
        imagepath: 'web_images/warehouse_Admin.jpg',
        text: 'WEARHOUSE ADMIN',
      ), /////////////////////////////////////////////////////////////////////////////12
    ];
    return Scaffold(
      backgroundColor: cWhite,
      body: SingleChildScrollView(
        child: Container(
          child: ResponsiveWebSite.isMobile(context)
              ? Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: loginWidget[0],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: loginWidget[1],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: loginWidget[2],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: loginWidget[3],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: loginWidget[4],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: loginWidget[5],
                      ),
                    ],
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 40, top: 100),
                          child: SizedBox(
                            height: 1000,
                            child: Column(
                              children: [
                                loginWidget[0],
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: loginWidget[1],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: loginWidget[2],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: loginWidget[3],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: loginWidget[4],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: loginWidget[5],
                                ),
                                // Padding(
                                //   padding: const EdgeInsets.only(
                                //       top: 20, bottom: 20),
                                //   child: Row(
                                //     mainAxisAlignment: MainAxisAlignment.center,
                                //     children: [
                                //       Padding(
                                //         padding: const EdgeInsets.only(
                                //             top: 10, bottom: 0, right: 40),
                                //         child: GestureDetector(
                                //             onTap: () {
                                //               Get.to(
                                //                   const SuperAdminPanelScreen());
                                //             },
                                //             child: loginWidget[6]),
                                //       ),
                                //       Padding(
                                //         padding: const EdgeInsets.only(
                                //             top: 10, bottom: 0, right: 40),
                                //         child: GestureDetector(
                                //             onTap: () {
                                //               Get.to(
                                //                   const StoreAdminPanelScreen());
                                //               // Get.to(const AdminHomeScreen(
                                //               //     navvalue: 'storeadmin'));
                                //             },
                                //             child: loginWidget[7]),
                                //       ),
                                //       Padding(
                                //         padding: const EdgeInsets.only(
                                //             top: 10, bottom: 0, right: 40),
                                //         child: GestureDetector(
                                //             onTap: () {
                                //               Get.to(
                                //                   const DeliveryAdminPanelScreen());
                                //               // Get.to(const AdminHomeScreen(
                                //               //     navvalue: 'deliveryadmin'));
                                //             },
                                //             child: loginWidget[8]),
                                //       ),
                                //       Padding(
                                //         padding: const EdgeInsets.only(
                                //             top: 10, bottom: 0, right: 40),
                                //         child: GestureDetector(
                                //             onTap: () {
                                //               Get.to(
                                //                   const WareHouseAdminPanelScreen());
                                //               // Get.to(const AdminHomeScreen(
                                //               //     navvalue: 'deliveryadmin'));
                                //             },
                                //             child: loginWidget[10]),
                                //       ),
                                //     ],
                                //   ),
                                // ),
                                Container(
                                  child: loginWidget[9],
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}

class LoginContainerWidget extends StatelessWidget {
  final String value;
  final String imagepath;
  void Function()? onTap;
  LoginContainerWidget({
    required this.text,
    super.key,
    required this.imagepath,
    this.onTap,
    required this.value,
  });
  String text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          height: 125,
          width: 125,
          decoration: BoxDecoration(
            color: cWhite,
            shape: BoxShape.circle,
            border: Border.all(color: cGrey.withOpacity(0.5)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: cWhite,
                radius: 30,
                child: Image.asset(imagepath),
              ),
              // const CircleAvatar(
              //   radius: 100,
              //   backgroundImage: AssetImage('web_images/super_Admin (1).jpg'),
              // ),
              Center(
                  child: GooglePoppinsWidgets(
                text: text,
                fontsize: 11,
                fontWeight: FontWeight.bold,
              )),
            ],
          )),
    );
  }
}

// ignore_for_file: file_names, must_be_immutable


