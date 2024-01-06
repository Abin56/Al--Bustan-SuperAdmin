import 'package:canteen_superadmin_website/view/login/login_section/login_textformfeild.dart';
import 'package:canteen_superadmin_website/view/login/login_section/loginsubmitbutton.dart';
import 'package:canteen_superadmin_website/view/colors/colors.dart';
import 'package:canteen_superadmin_website/view/fonts/google_poppins.dart';
import 'package:canteen_superadmin_website/view/widgets/responsive/responsive.dart';
import 'package:flutter/material.dart';

class LoginSection extends StatefulWidget {
  const LoginSection({super.key});

  @override
  State<LoginSection> createState() => _LoginSectionState();
}

class _LoginSectionState extends State<LoginSection> {
  bool value = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: ResponsiveWebSite.isMobile(context)
              ? Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Column(
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
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        child: loginWidget[6],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Row(
                          children: [
                            Expanded(
                                child: Padding(
                              padding:
                                  const EdgeInsets.only(right: 10, left: 10),
                              child: loginWidget[7],
                            )),
                            Expanded(
                                child: Padding(
                              padding:
                                  const EdgeInsets.only(right: 10, left: 10),
                              child: loginWidget[8],
                            )),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 10, left: 10, right: 10),
                              child: loginWidget[9],
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: loginWidget[10],
                      ),
                    ],
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.only(top: 60),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                              flex: ResponsiveWebSite.isTablet(context) ? 2 : 4,
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20.0),
                                  child: Container(
                                    height: 550,
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                            'web_images/images/albustan2.jpg',
                                          ),
                                          fit: BoxFit.fill),
                                    ),
                                  ),
                                ),
                              )),
                          Expanded(
                              flex: 2,
                              child: Padding(
                                padding: const EdgeInsets.only(right: 40),
                                child: SizedBox(
                                  height: 550,
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
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 10, bottom: 10),
                                        child: loginWidget[6],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 20),
                                        child: Row(
                                          children: [
                                            Expanded(child: loginWidget[7]),
                                            Expanded(
                                                child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10),
                                              child: loginWidget[8],
                                            )),
                                            Expanded(
                                                child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10),
                                              child: loginWidget[9],
                                            )),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        child: loginWidget[10],
                                      ),
                                    ],
                                  ),
                                ),
                              ))
                        ],
                      )
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}

class loginContainerWidget extends StatelessWidget {
  loginContainerWidget({
    required this.text,
    super.key,
  });
  String text;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 40,
        width: 50,
        decoration: BoxDecoration(
          border: Border.all(color: cGrey.withOpacity(0.5)),
          borderRadius: const BorderRadius.all(Radius.circular(4)),
        ),
        child: Center(child: GooglePoppinsWidgets(text: text, fontsize: 12)));
  }
}

// ignore_for_file: file_names, must_be_immutable

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
    hintText: 'Enter Email Address',
    title: 'Email Address',
  ), /////////////////////////////////////////////4
  LoginTextFormFiledContainerWidget(
    hintText: 'Password',
    title: 'Enter password',
  ), //////////////////////////////////////////////////5
  LoginButtonContainerWidget(
      width: 600, text: 'Sign me in', height: 50, fontSize: 18, onTap: () {}),
  ///////////////////////////////////////////////////////////////6
  Row(
    children: [
      const Expanded(
          child: Padding(
        padding: EdgeInsets.only(left: 100),
        child: Divider(
          color: Colors.grey,
        ),
      )),
      GooglePoppinsWidgets(text: 'Continue with', fontsize: 12, color: cGrey),
      const Expanded(
          child: Padding(
        padding: EdgeInsets.only(right: 100),
        child: Divider(
          color: Colors.grey,
        ),
      ))
    ],
  ), ///////////////////////////////////////////////////////7
  loginContainerWidget(
    text: 'Admin',
  ), //////////////////////////////////////////////////////////////8
  loginContainerWidget(
    text: ' Store\nAdmin',
  ), //////////////////////////////////////////////////////////////////9
  loginContainerWidget(
    text: 'Delivery\n Admin',
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
];
