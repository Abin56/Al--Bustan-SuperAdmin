import 'package:canteen_superadmin_website/core/colors/colors.dart';
import 'package:canteen_superadmin_website/core/fonts/google_poppins.dart';
import 'package:canteen_superadmin_website/view/widgets/responsive/responsive.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10, left: 10),
          child: GooglePoppinsWidgets(
            text: 'Product Add',
            fontsize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        ResponsiveWebSite.isMobile(context)
            ? SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      SizedBox(
                          width: double.infinity,
                          height: 350,
                          child: product_details[0]),
                      ContainerWidget(
                          widget: Column(
                        children: [
                          product_details[1],
                          product_details[2],
                        ],
                      ))
                    ],
                  ),
                ),
              )
            : Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: SizedBox(
                              height: 500, child: product_details[0]))),
                  Expanded(
                      flex: 3,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: ContainerWidget(
                          widget: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                      child: Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: product_details[1],
                                  )),
                                  Expanded(
                                      child: Padding(
                                    padding: const EdgeInsets.only(top: 20),
                                    child: product_details[2],
                                  )),
                                ],
                              )
                            ],
                          ),
                        ),
                      )),
                ],
              )
      ],
    ));
  }
}

class ContainerWidget extends StatelessWidget {
  const ContainerWidget({
    required this.widget,
    super.key,
  });
  final Widget widget;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: cGrey.withOpacity(0.5)),
          borderRadius: BorderRadius.circular(10)),
      height: ResponsiveWebSite.isMobile(context) ? 650 : 500,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: cGrey.withOpacity(0.5)),
              borderRadius: BorderRadius.circular(10)),
          child: widget,
        ),
      ),
    );
  }
}

class ProductContainerWidget extends StatelessWidget {
  const ProductContainerWidget({
    required this.text,
    super.key,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            border: Border.all(color: cGrey.withOpacity(0.5)),
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            Expanded(
                child: GooglePoppinsWidgets(
              text: text,
              fontsize: 16,
              textAlign: TextAlign.center,
            )),
            const Expanded(
                child: Icon(
              Icons.edit,
              color: Colors.orange,
            ))
          ],
        ),
      ),
    );
  }
}

List<Widget> product_details = [
  Container(
    decoration: BoxDecoration(
        border: Border.all(color: cGrey.withOpacity(0.5)),
        borderRadius: BorderRadius.circular(10)),
    height: 30,
    child: Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: cGrey.withOpacity(0.5)),
                borderRadius: BorderRadius.circular(10)),
            child: const Padding(
              padding:
                  EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
              child: Imageuploadwidget(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 30),
            child: GooglePoppinsWidgets(
              fontsize: 16,
              text: 'Add Additional Images',
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: cGrey.withOpacity(0.5)),
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Icon(
                      Icons.photo_album_sharp,
                      color: Colors.orange,
                    ),
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
                        Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          child: GooglePoppinsWidgets(
                            text: 'Upload Image',
                            fontsize: 14,
                            color: Colors.orange,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    ),
  ), ///////////////////////////////////1
  const Padding(
    padding: EdgeInsets.only(right: 10, left: 10),
    child: SizedBox(
      height: 350,
      child: Column(
        children: [
          ProductContainerWidget(
            text: 'Product Name',
          ),
          ProductContainerWidget(
            text: 'Price',
          ),
          ProductContainerWidget(
            text: 'Expiry Date',
          ),
          ProductContainerWidget(
            text: 'Quantity in stock',
          ),
          ProductContainerWidget(
            text: 'Select Category',
          ),
        ],
      ),
    ),
  ), //////////////////////////////////////////////////////////////2
  Padding(
    padding: const EdgeInsets.only(left: 10, right: 10),
    child: Container(
        height: 350,
        decoration: BoxDecoration(
            border: Border.all(color: cGrey.withOpacity(0.5)),
            borderRadius: BorderRadius.circular(10)),
        child: TextFormField(
          decoration: const InputDecoration(
              border: InputBorder.none, hintText: 'Description'),
        )),
  ),
];

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
