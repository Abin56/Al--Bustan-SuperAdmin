import 'package:canteen_superadmin_website/core/colors/colors.dart';
import 'package:canteen_superadmin_website/core/fonts/google_poppins.dart';
import 'package:flutter/material.dart';

class Imageuploadwidget extends StatelessWidget {
  const Imageuploadwidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Icon(
          Icons.photo_album_sharp,
          color: Colors.orange,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.upload_sharp,
                color: Colors.orange,
              ),
              GooglePoppinsWidgets(
                text: 'Upload Image',
                fontsize: 14,
                color: Colors.orange,
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GooglePoppinsWidgets(
            text: 'Upload a cover image for your product',
            fontsize: 14,
            color: cBlack,
          ),
        )
      ],
    );
  }
}
