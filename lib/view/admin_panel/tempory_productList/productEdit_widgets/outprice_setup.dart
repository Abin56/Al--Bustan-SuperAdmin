import 'package:canteen_superadmin_website/view/colors/colors.dart';
import 'package:canteen_superadmin_website/view/fonts/google_poppins.dart';
import 'package:canteen_superadmin_website/view/widgets/custom_showDilog/custom_showdilog.dart';
import 'package:canteen_superadmin_website/view/widgets/textform%20feild%20Widget/textformfeildWidget.dart';
import 'package:flutter/material.dart';

class OutPriceSetupWidget extends StatelessWidget {
  const OutPriceSetupWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        customShowDilogBox(
            context: context,
            title: 'Out Price',
            children: [
              TextFormFiledContainerWidget(
                  hintText: 'Out Price', title: 'Out Price', width: 200)
            ],
            actiontext: 'UPDATE',
            actiononTapfuction: () async {},
            doyouwantActionButton: true);
      },
      child: SizedBox(
        height: 48,
        width: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: 80,
              decoration: const BoxDecoration(
                color: themeColorBlue,
                borderRadius: BorderRadius.horizontal(),
              ),
              height: 25,
              child: Center(
                child: GooglePoppinsWidgets(
                  textAlign: TextAlign.center,
                  color: cWhite,
                  fontWeight: FontWeight.bold,
                  text: "Set",
                  fontsize: 10,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
