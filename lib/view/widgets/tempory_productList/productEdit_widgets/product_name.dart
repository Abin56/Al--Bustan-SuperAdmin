

import 'package:canteen_superadmin_website/view/colors/colors.dart';
import 'package:canteen_superadmin_website/view/fonts/google_poppins.dart';
import 'package:canteen_superadmin_website/view/widgets/tempory_productList/textformFiled_widget/textFormFiled_.dart';
import 'package:flutter/material.dart';

class ProductNameEditWidget extends StatelessWidget {
  const ProductNameEditWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 48,
        width: 300,
        child: Row(
          mainAxisAlignment:
              MainAxisAlignment
                  .spaceAround,
          children: [
            SizedBox(
              height: 30,
              width: 200,
              child: TextFormFiledWidget(
                  hintText:
                      "Product Name",
                  title:
                      'Product Nam',
                  width: 200),
            ),
            Container(
              width: 80,
              decoration:
                  const BoxDecoration(
                color:
                    themeColorBlue,
                borderRadius:
                    BorderRadius
                        .horizontal(),
              ),
              height: 25,
              child: Center(
                child:
                    GooglePoppinsWidgets(
                  textAlign:
                      TextAlign
                          .center,
                  color: cWhite,
                  fontWeight:
                      FontWeight
                          .bold,
                  text: "Set",
                  fontsize: 10,
                ),
              ),
            ),
          ],
        ),
      );
  }
}