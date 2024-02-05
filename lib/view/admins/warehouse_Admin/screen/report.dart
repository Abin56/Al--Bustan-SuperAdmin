import 'package:canteen_superadmin_website/core/colors/colors.dart';
import 'package:canteen_superadmin_website/core/fonts/google_poppins.dart';
import 'package:canteen_superadmin_website/view/widgets/button_container_widget/custom_button.dart';
import 'package:flutter/material.dart';

class Reports extends StatelessWidget {
  const Reports({super.key});

  @override
  Widget build(BuildContext context) {
    final sizeW = MediaQuery.of(context).size.width;
    final sizeH = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: sizeH * 0.91,
        width: double.infinity,
        decoration: BoxDecoration(
          color: cWhite,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(blurRadius: 0.5),
          ],
        ),
        child: Column(
          children: [
            GooglePoppinsWidgets(text: "All Report", fontsize: 26),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(22),
                    child: ReportContainerWidget(
                      headingText: 'Daily Report',
                      button1Text: "Button 1",
                      button2Text: "Button 2",
                      button3Text: "Button 3",
                      buttonHeight: 40,
                      buttonWidth: 140,
                      button1OnPressed: () {},
                      button2OnPressed: () {},
                      button3OnPressed: () {},
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: ReportContainerWidget(
                      headingText: 'Monthly Report',
                      button1Text: "Button 1",
                      button2Text: "Button 2",
                      button3Text: "Button 3",
                      buttonHeight: 40,
                      buttonWidth: 140,
                      button1OnPressed: () {},
                      button2OnPressed: () {},
                      button3OnPressed: () {},
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(22),
                    child: ReportContainerWidget(
                      headingText: 'Delivery Report',
                      button1Text: "Button 1",
                      button2Text: "Button 2",
                      button3Text: "Button 3",
                      buttonHeight: 40,
                      buttonWidth: 140,
                      button1OnPressed: () {},
                      button2OnPressed: () {},
                      button3OnPressed: () {},
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(22),
                    child: ReportContainerWidget(
                      headingText: 'Purchase Report',
                      button1Text: "Button 1",
                      button2Text: "Button 2",
                      button3Text: "Button 3",
                      buttonHeight: 40,
                      buttonWidth: 140,
                      button1OnPressed: () {},
                      button2OnPressed: () {},
                      button3OnPressed: () {},
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: ReportContainerWidget(
                      headingText: 'Sales Report',
                      button1Text: "Button 1",
                      button2Text: "Button 2",
                      button3Text: "Button 3",
                      buttonHeight: 40,
                      buttonWidth: 140,
                      button1OnPressed: () {
                        // Define the action for Button 1
                      },
                      button2OnPressed: () {
                        // Define the action for Button 2
                      },
                      button3OnPressed: () {
                        // Define the action for Button 3
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(22),
                    child: ReportContainerWidget(
                      headingText: "Report Container",
                      button1Text: "Button 1",
                      button2Text: "Button 2",
                      button3Text: "Button 3",
                      buttonHeight: 40,
                      buttonWidth: 140,
                      button1OnPressed: () {},
                      button2OnPressed: () {},
                      button3OnPressed: () {},
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ReportContainerWidget extends StatelessWidget {
  final String headingText;
  final String button1Text;
  final String button2Text;
  final String button3Text;
  final double buttonHeight;
  final double buttonWidth;
  final VoidCallback button1OnPressed;
  final VoidCallback button2OnPressed;
  final VoidCallback button3OnPressed;
  const ReportContainerWidget({
    super.key,
    required this.headingText,
    required this.button1Text,
    required this.button2Text,
    required this.button3Text,
    required this.buttonHeight,
    required this.buttonWidth,
    required this.button1OnPressed,
    required this.button2OnPressed,
    required this.button3OnPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(blurRadius: 5, color: Colors.black26),
        ],
      ),
      padding: const EdgeInsets.all(22),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              headingText,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: button1OnPressed,
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.black,
                minimumSize: Size(buttonWidth, buttonHeight),
              ),
              child: Text(button1Text),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: button2OnPressed,
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.black,
                minimumSize: Size(buttonWidth, buttonHeight),
              ),
              child: Text(button2Text),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: button3OnPressed,
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.black,
                minimumSize: Size(buttonWidth, buttonHeight),
              ),
              child: Text(button3Text),
            ),
          ],
        ),
      ),
    );
  }
}
