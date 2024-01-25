import 'package:canteen_superadmin_website/core/colors/colors.dart';
import 'package:canteen_superadmin_website/core/fonts/google_heebo.dart';
import 'package:canteen_superadmin_website/view/home/login_button.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
        children: [
          Container(
            height: 1100,
            // width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('web_images/home/slider-eclipse.png'),
                  fit: BoxFit.fill),
            ),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 300, left: 50),
                  child: GoogleHeeboWidget(
                    text: "Express",
                    fontsize: 80,
                    color: cWhite,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 380, left: 50),
                  child: GoogleHeeboWidget(
                    text: "Canteen Delivery",
                    fontsize: 80,
                    color: const Color.fromARGB(255, 247, 182, 20),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 0, left: 50),
                  child: GestureDetector(
                    onTap: () {
                      print("object");
                    },
                    child: Container(
                      padding: const EdgeInsets.only(top: 100),
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 247, 182, 20),
                      ),
                      height: 100,
                      width: 150,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 170, left: 0),
                  child: SizedBox(
                      // color: Colors.red,
                      width: double.infinity,
                      height: 1000,
                      child: Image.asset('web_images/home/slider-glob.png')),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 100, left: 600),
                  child: SizedBox(
                      // color: Colors.red,
                      width: double.infinity,
                      height: 840,
                      child: Image.asset('web_images/home/slider-courier.png')),
                ),
              ],
            ),
          )
        ],
      )),
    );
  }
}
