import 'package:canteen_superadmin_website/view/colors/colors.dart';
import 'package:canteen_superadmin_website/view/fonts/google_poppins.dart';
import 'package:canteen_superadmin_website/view/widgets/back_container/back_container.dart';
import 'package:flutter/material.dart';

customShowDilogBox(
    {required BuildContext context,
    required String title,
    required List<Widget> children,
    String? actiontext,
    required bool doyouwantActionButton,
    void Function()? actiononTapfuction}) {
  return showDialog(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GooglePoppinsWidgets(
                  text: title, fontsize: 13, fontWeight: FontWeight.w600),
              const Padding(
                padding: EdgeInsets.only(top: 10),
                child: BackButtonContainerWidget(),
              ),
            ],
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: children,
            ),
          ),
          actions: doyouwantActionButton == true
              ? <Widget>[
                  GestureDetector(
                    onTap: actiononTapfuction,
                    child: Container(
                      height: 40,
                      width: 250,
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
                            text: actiontext ?? 'Ok',
                            color: cWhite,
                            fontsize: 12,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ]
              : null);
    },
  );
}

// uploadingProgressInc(BuildContext context) async {
//   return showDialog(
//     context: context,
//     barrierDismissible: false, // user must tap button!
//     builder: (BuildContext context) {
//       return AlertDialog(
//           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
//           title: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               GooglePoppinsWidgets(
//                   text: 'PLease wait....',
//                   fontsize: 13.sp,
//                   fontWeight: FontWeight.w600),
//             ],
//           ),
//           content: const SingleChildScrollView(
//             child: ListBody(
//               children: [
//                 ///// Circular in
//               ],
//             ),
//           ));
//     },
//   );
// }
