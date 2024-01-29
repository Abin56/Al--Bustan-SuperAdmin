import 'package:canteen_superadmin_website/core/colors/colors.dart';
import 'package:canteen_superadmin_website/core/fonts/google_heebo.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Color buttonColor = const Color.fromARGB(255, 247, 182, 20);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              height: 1100,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('web_images/home/slider-eclipse.png'),
                  fit: BoxFit.fill,
                ),
              ),
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 110, vertical: 10),
                    child: Row(
                      children: [
                        SizedBox(
                          height: 60,
                          width: 100,
                          child: Image.asset(
                            'web_images/AL - Bustan.png',
                          ),
                        ),
                        const Spacer(),
                        IconButton(
                          icon: const Icon(
                            Icons.person,
                            color: AppColors.whiteColor,
                          ),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.card_travel_rounded,
                            color: AppColors.whiteColor,
                          ),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.search_outlined,
                            color: AppColors.whiteColor,
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 70, left: 120, right: 110),
                    child: Divider(
                      color: Colors.white70,
                      height: 20,
                      thickness: 0.09,
                      indent: 0,
                      endIndent: 0,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 300, left: 120),
                    child: GoogleHeeboWidget(
                      text: "Express",
                      fontsize: 80,
                      color: cWhite,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 380, left: 120),
                    child: GoogleHeeboWidget(
                      text: "Canteen Delivery",
                      fontsize: 80,
                      color: const Color.fromARGB(255, 247, 182, 20),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 500, left: 100),
                    child: GoogleHeeboWidget(
                      text: """
      Curabitur imperdiet varius lacus, id placerat purus vulputate non. Fusce in 
      felis vel arcu maximus placerat eu ut arcu.Ut nunc ex, gravida vel porttitor 
      et, pretium ac sapien.
    """,
                      fontsize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 620, left: 120),
                    child: InkWell(
                      onTap: () {
                        print("object");
                      },
                      onHover: (isHovered) {
                        setState(() {
                          buttonColor = isHovered
                              ? Colors.white
                              : const Color.fromARGB(255, 247, 182, 20);
                        });
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        decoration: BoxDecoration(
                          color: buttonColor,
                          borderRadius: BorderRadius.circular(38),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 18),
                        child: const Text(
                          "Read More",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),

                  // Padding(
                  //   padding: const EdgeInsets.only(top: 620, left: 120),
                  //   child: GestureDetector(
                  //     onTap: () {
                  //       print("object");
                  //     },
                  //     child: Container(
                  //       padding: const EdgeInsets.symmetric(
                  //           vertical: 20, horizontal: 40),
                  //       decoration: BoxDecoration(
                  //         color: Color.fromARGB(255, 247, 182, 20),
                  //         borderRadius: BorderRadius.circular(40),
                  //       ),
                  //       child: GoogleHeeboWidget(
                  //         text: "Read More",
                  //         fontsize: 16,
                  //         color: Colors.black,
                  //         fontWeight: FontWeight.bold,
                  //       ),
                  //     ),
                  //   ),
                  // ),

                  Padding(
                    padding: const EdgeInsets.only(top: 170, left: 280),
                    child: SizedBox(
                      width: double.infinity,
                      height: 1000,
                      child: Image.asset(
                        'web_images/home/slider-glob.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 150, left: 600),
                    child: SizedBox(
                      width: double.infinity,
                      height: 840,
                      child: Image.asset('web_images/home/slider-courier.png'),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
