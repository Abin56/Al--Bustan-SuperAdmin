import 'package:canteen_superadmin_website/core/colors/colors.dart';
import 'package:canteen_superadmin_website/core/fonts/google_poppins.dart';
import 'package:flutter/material.dart';

class BackButtonContainerWidget extends StatelessWidget {
  const BackButtonContainerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        height: 30,
        width: 80,
        decoration: BoxDecoration(
          // color: AppColors.greenColor,
          gradient: const LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            stops: [
              0.1,
              0.4,
              0.6,
              0.9,
            ],
            colors: [
              Color(0xFF35B2A2),
              Color(0xFF11967F),
              Color(0xFF06876A),
              Color(0xFF036952),
            ],
          ),
          border: Border.all(
            width: 1,
          ),
        ),
        child: Center(
          child: GooglePoppinsWidgets(
              text: 'BACK',
              color: cWhite,
              fontsize: 12,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

warningShowDilogueBox(
    {required BuildContext context,
    required String title,
    required String discripition,
    required void Function()? onPressed}) {
  return showDialog(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[Text(discripition)],
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: onPressed,
            child: const Text('ok'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('cancel'),
          ),
        ],
      );
    },
  );
}
