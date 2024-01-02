import 'package:canteen_superadmin_website/view/colors/colors.dart';
import 'package:canteen_superadmin_website/view/constant/constant.validate.dart';
import 'package:canteen_superadmin_website/view/fonts/google_poppins.dart';
import 'package:flutter/material.dart';

class StoreKeeperDatailsWidget extends StatelessWidget {
  const StoreKeeperDatailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final sizeW = MediaQuery.of(context).size.width;
    return Container(
      width: sizeW * 0.3,
      height: 150,
      child: Row(
        children: [
          Container(
            width: 100,
            height: sizeW * 150,
            color: cWhite,
          ),
          sWidtht40,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GooglePoppinsWidgets(text: "Name", fontsize: 15),
              GooglePoppinsWidgets(text: "Mobile", fontsize: 15),
              GooglePoppinsWidgets(text: "Email", fontsize: 15),
              GooglePoppinsWidgets(text: "Status", fontsize: 15),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GooglePoppinsWidgets(text: " : ", fontsize: 15),
              GooglePoppinsWidgets(text: " : ", fontsize: 15),
              GooglePoppinsWidgets(text: " : ", fontsize: 15),
              GooglePoppinsWidgets(text: " : ", fontsize: 15),
            ],
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GooglePoppinsWidgets(text: "Lepton", fontsize: 15),
                GooglePoppinsWidgets(text: "12344678", fontsize: 15),
                GooglePoppinsWidgets(text: "Email@gmail.com", fontsize: 15),
                GooglePoppinsWidgets(text: "Active", fontsize: 15),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
