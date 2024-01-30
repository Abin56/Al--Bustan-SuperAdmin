import 'package:canteen_superadmin_website/controller/login_controller/login_controller.dart';
import 'package:canteen_superadmin_website/core/colors/colors.dart';
import 'package:canteen_superadmin_website/core/fonts/google_poppins.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomeScreen extends StatelessWidget {
  final UserLoginController userLoginController =
      Get.put(UserLoginController());
  WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    userLoginController.nextpage();

    final sizeW = MediaQuery.of(context).size.width;
    return Scaffold(
      // appBar: AppBar(
      //   // actions: [
      //   //   InkWell(
      //   //     onTap: () {
      //   //       // Navigator.of(context).pushReplacement(MaterialPageRoute(
      //   //       //   // builder: (context) => const AdminHomeScreen(),
      //   //       // ));
      //   //     },
      //   //     child: Padding(
      //   //       padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
      //   //       child: Container(
      //   //         height: 40,
      //   //         decoration: BoxDecoration(
      //   //             borderRadius: BorderRadius.circular(10), color: cGreen),
      //   //         child: Padding(
      //   //           padding: const EdgeInsets.all(8.0),
      //   //           child: Center(
      //   //             child: Padding(
      //   //               padding: const EdgeInsets.symmetric(
      //   //                   vertical: 0, horizontal: 20),
      //   //               child: GooglePoppinsWidgets(
      //   //                   text: "Login", fontsize: 14, color: cWhite),
      //   //             ),
      //   //           ),
      //   //         ),
      //   //       ),
      //   //     ),
      //   //   ),
      //   // ],
      // ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: sizeW * 0.2,
              width: sizeW * 0.2,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          'https://firebasestorage.googleapis.com/v0/b/al-bustan-6c421.appspot.com/o/albustanblack.png?alt=media&token=6a0b9e7a-be9c-424a-a51e-102b91bf7807'))),
            ),
            GooglePoppinsWidgets(
              text: "WELCOME",
              fontsize: 70,
              color: cBlack,
              fontWeight: FontWeight.w500,
            )
          ],
        ),
      ),
    );
  }
}
