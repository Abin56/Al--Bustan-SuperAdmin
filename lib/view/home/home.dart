import 'package:canteen_superadmin_website/core/colors/colors.dart';
import 'package:canteen_superadmin_website/core/fonts/google_heebo.dart';
import 'package:canteen_superadmin_website/view/widgets/responsive/responsive.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Color buttonColor = const Color.fromARGB(255, 247, 182, 20);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ResponsiveWebSite(
          mobile: buildMobileLayout(),
          tablet: buildTabletLayout(),
          desktop: buildDesktopLayout(),
        ),
      ),
    );
  }

  Widget buildMobileLayout() {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Implement your mobile layout here
          Container(
            height: ResponsiveWebSite.isDesktop(context) ? 1100 : 950,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('web_images/home/slider-eclipse.png'),
                fit: BoxFit.fill,
              ),
            ),
            child: Stack(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Row(
                    children: [
                      GoogleHeeboWidget(
                        text: "AL-BUSTAN",
                        fontsize: 16,
                        color: AppColors.whiteColor,
                        fontWeight: FontWeight.bold,
                      ),
                      const Spacer(),
                      IconButton(
                        icon: const Icon(
                          Icons.phone,
                          color: AppColors.whiteColor,
                          size: 20,
                        ),
                        onPressed: () {},
                      ),
                      GoogleHeeboWidget(
                        text: "0521-1969-00",
                        fontsize: 16,
                        color: const Color.fromARGB(255, 247, 182, 20),
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                ),

                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 50, horizontal: 10),
                  child: Divider(
                    color: Colors.white70,
                    height: 20,
                    thickness: 0.09,
                    indent: 0,
                    endIndent: 0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 140, left: 20),
                  child: SizedBox(
                    height: 60,
                    child: GoogleHeeboWidget(
                      text: "Express",
                      fontsize: 40,
                      color: cWhite,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 190, left: 20),
                  child: SizedBox(
                    height: 60,
                    child: GoogleHeeboWidget(
                      text: "Canteen Delivery",
                      fontsize: 40,
                      color: const Color.fromARGB(255, 247, 182, 20),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(
                    top: 260,
                  ),
                  child: GoogleHeeboWidget(
                    text: """
      Building professional relationships by 
      producing and supplying high quality products.
      To offer an exceptional quality product, 
      standard of service and hospitality.
      To be dedicated to our single goal of satisfying the customers.
                    """,
                    fontsize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  height: ResponsiveWebSite.isDesktop(context) ? 840 : 1200,
                  child: Image.asset(
                    'web_images/home/slider-glob.png',
                  ),
                ),
                // Login button
                Padding(
                  padding: const EdgeInsets.only(
                    top: 410,
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    height: 380,
                    child: Image.asset('web_images/home/slider-courier.png'),
                  ),
                ),

                InkWell(
                  onTap: () {
                    setState(() {
                      buttonColor = const Color.fromARGB(255, 247, 182, 20);
                    });
                  },
                  onHover: (isHovered) {
                    setState(() {
                      buttonColor = isHovered
                          ? Colors.white
                          : const Color.fromARGB(255, 247, 182, 20);
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 400, left: 20),
                    child: AnimatedButton(
                      buttonColor: buttonColor,
                      onPressed: () {
                        print("object");
                      },
                      height: 40,
                      width: 100,
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 770, left: 280),
                  child: SizedBox(
                    width: double.infinity,
                    height: 100,
                    child: Image.asset(
                      'web_images/home/slider-glob.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 800, left: 20),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.location_pin,
                        size: 20,
                        color: const Color.fromARGB(255, 247, 182, 20),
                      ),
                      GoogleHeeboWidget(
                        text: """

   Amman Street, Al Qusais Industrial Area 3, 
   Dubai Unit- ed Arab Emirates,PO Box 20584.
                           """,
                        fontsize:
                            ResponsiveWebSite.isDesktop(context) ? 16 : 10,
                        color: AppColors.whiteColor,
                        fontWeight: FontWeight.w300,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

// <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<,,
  Widget buildTabletLayout() {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Implement your tablet layout here
          Container(
            height: ResponsiveWebSite.isDesktop(context) ? 1100 : 950,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('web_images/home/slider-eclipse.png'),
                fit: BoxFit.fill,
              ),
            ),
            child: Stack(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 110, vertical: 10),
                  child: Row(
                    children: [
                      SizedBox(
                        height: 60,
                        width: 100,
                        child: Image.asset(
                          'web_images/AL - Bustan.png',
                        ),
                      ),
                      GoogleHeeboWidget(
                        text: "AL-BUSTAN",
                        fontsize: 16,
                        color: AppColors.whiteColor,
                        fontWeight: FontWeight.bold,
                      ),
                      const Spacer(),
                      IconButton(
                        icon: const Icon(
                          Icons.phone,
                          color: AppColors.whiteColor,
                          size: 20,
                        ),
                        onPressed: () {},
                      ),
                      GoogleHeeboWidget(
                        text: "0521-1969-00",
                        fontsize: 16,
                        color: const Color.fromARGB(255, 247, 182, 20),
                        fontWeight: FontWeight.bold,
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
                  padding: const EdgeInsets.only(top: 180, left: 120),
                  child: SizedBox(
                    height: ResponsiveWebSite.isDesktop(context) ? 100 : 80,
                    child: GoogleHeeboWidget(
                      text: "Express",
                      fontsize: ResponsiveWebSite.isDesktop(context) ? 80 : 60,
                      color: cWhite,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 250, left: 120),
                  child: SizedBox(
                    height: ResponsiveWebSite.isDesktop(context) ? 100 : 80,
                    child: GoogleHeeboWidget(
                      text: "Canteen Delivery",
                      fontsize: ResponsiveWebSite.isDesktop(context) ? 80 : 60,
                      color: const Color.fromARGB(255, 247, 182, 20),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 340, left: 36),
                  child: GoogleHeeboWidget(
                    text: """
                    Building professional relationships by producing and supplying high quality products.
                    To offer an exceptional quality product, standard of service and hospitality.
                    To be dedicated to our single goal of satisfying the customers.
                    """,
                    fontsize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w300,
                  ),
                ),

                // Login button
                Padding(
                  padding: const EdgeInsets.only(top: 410, left: 120),
                  child: SizedBox(
                    width: double.infinity,
                    height: 380,
                    child: Image.asset('web_images/home/slider-courier.png'),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 500, left: 120),
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
                      height: 60,
                      width: 160,
                      decoration: BoxDecoration(
                        color: buttonColor,
                        borderRadius: BorderRadius.circular(38),
                      ),
                      child: const Center(
                        child: Text(
                          "Login",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  height: ResponsiveWebSite.isDesktop(context) ? 840 : 1200,
                  child: Image.asset(
                    'web_images/home/slider-glob.png',
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 770, left: 280),
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
                  padding: const EdgeInsets.only(top: 800, left: 10),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.location_pin,
                        size: 20,
                        color: const Color.fromARGB(255, 247, 182, 20),
                      ),
                      GoogleHeeboWidget(
                        text:
                            " Amman Street, Al Qusais Industrial Area 3, Dubai Unit- ed Arab Emirates,PO Box 20584.",
                        fontsize:
                            ResponsiveWebSite.isDesktop(context) ? 16 : 10,
                        color: AppColors.whiteColor,
                        fontWeight: FontWeight.w300,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildDesktopLayout() {
    List<Widget> listofwidget = [
      //<< top >>
      SizedBox(
        height: 60,
        width: 100,
        child: Image.asset(
          'web_images/AL - Bustan.png',
        ),
      ),
      GoogleHeeboWidget(
        text: "AL-BUSTAN",
        fontsize: 16,
        color: AppColors.whiteColor,
        fontWeight: FontWeight.bold,
      ),
      IconButton(
        icon: const Icon(
          Icons.phone,
          color: AppColors.whiteColor,
          size: 20,
        ),
        onPressed: () {},
      ),
      GoogleHeeboWidget(
        text: "0521-1969-00",
        fontsize: 16,
        color: const Color.fromARGB(255, 247, 182, 20),
        fontWeight: FontWeight.bold,
      ),
      //<<  >>
      Padding(
        padding: const EdgeInsets.only(top: 300, left: 120),
        child: SizedBox(
          height: ResponsiveWebSite.isDesktop(context) ? 100 : 80,
          child: GoogleHeeboWidget(
            text: "Express",
            fontsize: ResponsiveWebSite.isDesktop(context) ? 80 : 60,
            color: cWhite,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 380, left: 120),
        child: SizedBox(
          height: ResponsiveWebSite.isDesktop(context) ? 100 : 80,
          child: GoogleHeeboWidget(
            text: "Canteen Delivery",
            fontsize: ResponsiveWebSite.isDesktop(context) ? 80 : 60,
            color: const Color.fromARGB(255, 247, 182, 20),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      GoogleHeeboWidget(
        text: """
                    Building professional relationships by producing and supplying high quality products.
                    To offer an exceptional quality product, standard of service and hospitality.
                    To be dedicated to our single goal of satisfying the customers.
                    """,
        fontsize: 16,
        color: Colors.white,
        fontWeight: FontWeight.w300,
      ),
      InkWell(
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
          height: 60,
          width: 160,
          decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.circular(38),
          ),
          child: const Center(
            child: Text(
              "Login",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
      Row(
        children: [
          const Icon(
            Icons.location_pin,
            size: 20,
            color: const Color.fromARGB(255, 247, 182, 20),
          ),
          GoogleHeeboWidget(
            text:
                " Amman Street, Al Qusais Industrial Area 3, Dubai Unit- ed Arab Emirates,PO Box 20584.",
            fontsize: ResponsiveWebSite.isDesktop(context) ? 16 : 10,
            color: AppColors.whiteColor,
            fontWeight: FontWeight.w300,
          ),
        ],
      ),
      SizedBox(
        width: double.infinity,
        height: 1000,
        child: Image.asset(
          'web_images/home/slider-glob.png',
          fit: BoxFit.cover,
        ),
      ),
      SizedBox(
        width: double.infinity,
        height: ResponsiveWebSite.isDesktop(context) ? 840 : 1200,
        child: Image.asset('web_images/home/slider-courier.png'),
      ),
    ];

    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: ResponsiveWebSite.isDesktop(context) ? 1100 : 950,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('web_images/home/slider-eclipse.png'),
                fit: BoxFit.fill,
              ),
            ),
            child: Stack(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 110, vertical: 10),
                  child: Row(
                    children: [
                      listofwidget[0],
                      listofwidget[1],
                      const Spacer(),
                      listofwidget[2],
                      listofwidget[3],
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
                listofwidget[4],
                listofwidget[5],

                Padding(
                  padding: const EdgeInsets.only(top: 500, left: 60),
                  child: listofwidget[6],
                ),

                // Login button
                Padding(
                  padding: const EdgeInsets.only(top: 620, left: 120),
                  child: listofwidget[7],
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 860, left: 120),
                  child: listofwidget[8],
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 170, left: 280),
                  child: listofwidget[9],
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 130, left: 600),
                  child: listofwidget[10],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class AnimatedButton extends StatefulWidget {
  const AnimatedButton({
    Key? key,
    required this.buttonColor,
    required this.onPressed,
    required this.height,
    required this.width,
  }) : super(key: key);

  final Color buttonColor;
  final VoidCallback onPressed;
  final double height;
  final double width;

  @override
  AnimatedButtonState createState() => AnimatedButtonState();
}

class AnimatedButtonState extends State<AnimatedButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPressed,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: widget.height,
        width: widget.width,
        decoration: BoxDecoration(
          color: widget.buttonColor,
          borderRadius: BorderRadius.circular(38),
        ),
        child: const Center(
          child: Text(
            "Login",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
