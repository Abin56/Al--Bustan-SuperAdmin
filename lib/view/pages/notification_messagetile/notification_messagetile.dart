// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:canteen_superadmin_website/core/colors/colors.dart';
import 'package:canteen_superadmin_website/core/fonts/google_poppins.dart';

class NotificationMessageTile extends StatelessWidget {
  final IconData? icon;
  final String messageText;
  final String headerText;
  final Color whiteshadeColor;
  final Color containerColor;

  const NotificationMessageTile({
    Key? key,
    required this.messageText,
    required this.headerText,
    required this.whiteshadeColor,
    required this.containerColor,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: containerColor,
      height: 100,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 40,
            width: 200,
            color: whiteshadeColor,
            child: Center(
              child: GooglePoppinsWidgets(
                text: headerText,
                fontsize: 12,
                fontWeight: FontWeight.bold,
                color: cWhite,
              ),
            ),
          ),
          Row(
            children: [
              Icon(
                icon,
                color: whiteshadeColor,
                size: 50,
                weight: 0.9,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 05),
                  child: GooglePoppinsWidgets(
                      maxLines: 2,
                      color: cWhite,
                      text: messageText,
                      fontsize: 11),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
