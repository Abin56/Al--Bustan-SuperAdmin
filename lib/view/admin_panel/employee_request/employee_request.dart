import 'dart:developer';

import 'package:canteen_superadmin_website/model/employe_createprofile_model.dart';
import 'package:canteen_superadmin_website/core/colors/colors.dart';
import 'package:canteen_superadmin_website/core/fonts/google_poppins.dart';
import 'package:canteen_superadmin_website/core/fonts/text_widget.dart';
import 'package:canteen_superadmin_website/view/widgets/custom_showDilog/custom_showdilog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

employeeRequestList(BuildContext context) async {
  return customShowDilogBox(
      context: context,
      title: 'Employee Requests',
      children: [
        SizedBox(
          height: 400,
          width: 600,
          child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("EmployeeProfile")
                  .snapshots(),
              builder: (context, snaps) {
                if (snaps.hasData) {
                  return ListView.separated(
                      itemBuilder: (context, index) {
                        final data = EmployeeProfileCreateModel.fromMap(
                            snaps.data!.docs[index].data());
                        return Container(
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: cBlack.withOpacity(0.4))),
                          // color: Colors.amber,
                          height: 100,
                          width: 400,
                          child: Row(
                            children: [
                              SizedBox(
                                  width: 100,
                                  child: Image.network(data.imageURl)),
                              SizedBox(
                                width: 300,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Row(
                                      children: [
                                        TextFontWidget(
                                          text: 'Employe Name  ',
                                          fontsize: 12,
                                        ),
                                        const Spacer(),
                                        TextFontWidget(
                                          text: data.name,
                                          fontsize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        TextFontWidget(
                                          text: 'Email  ',
                                          fontsize: 12,
                                        ),
                                        const Spacer(),
                                        GooglePoppinsWidgets(
                                            text: data.email, fontsize: 12),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        TextFontWidget(
                                          text: 'Phone No',
                                          fontsize: 12,
                                        ),
                                        const Spacer(),
                                        GooglePoppinsWidgets(
                                            text: data.phoneNo, fontsize: 12),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        TextFontWidget(
                                          text: 'Status',
                                          fontsize: 12,
                                        ),
                                        const Spacer(),
                                        data.activate == true
                                            ? Container(
                                                decoration: BoxDecoration(
                                                  color: const Color.fromARGB(
                                                          255, 8, 131, 12)
                                                      .withOpacity(0.7),
                                                  borderRadius:
                                                      const BorderRadius
                                                          .horizontal(),
                                                ),
                                                width: 80,
                                                height: 30,
                                                child: Center(
                                                  child: GooglePoppinsWidgets(
                                                    textAlign: TextAlign.center,
                                                    color: cWhite,
                                                    fontWeight: FontWeight.bold,
                                                    text: "Active",
                                                    fontsize: 10,
                                                  ),
                                                ),
                                              )
                                            : Container(
                                                decoration: BoxDecoration(
                                                  color: const Color.fromARGB(
                                                          255, 202, 23, 10)
                                                      .withOpacity(0.8),
                                                  borderRadius:
                                                      const BorderRadius
                                                          .horizontal(),
                                                ),
                                                width: 80,
                                                height: 30,
                                                child: Center(
                                                  child: GooglePoppinsWidgets(
                                                    textAlign: TextAlign.center,
                                                    color: cWhite,
                                                    fontWeight: FontWeight.bold,
                                                    text: "DeActive",
                                                    fontsize: 10,
                                                  ),
                                                ),
                                              )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const Spacer(),
                              Center(
                                  child: data.activate == true
                                      ? GestureDetector(
                                          onTap: () async {
                                               print("object");
                                               log('docid ${data.docid}');
                                            await FirebaseFirestore.instance
                                                .collection('EmployeeProfile')
                                                .doc(data.docid)
                                                .update({'activate': false});
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: const Color.fromARGB(
                                                      255, 202, 23, 10)
                                                  .withOpacity(0.8),
                                              borderRadius: const BorderRadius
                                                  .horizontal(),
                                            ),
                                            width: 80,
                                            height: 30,
                                            child: Center(
                                              child: GooglePoppinsWidgets(
                                                textAlign: TextAlign.center,
                                                color: cWhite,
                                                fontWeight: FontWeight.bold,
                                                text: "DeActive",
                                                fontsize: 10,
                                              ),
                                            ),
                                          ),
                                        )
                                      : GestureDetector(
                                          onTap: () async {
                                                          print("object");
                                               log('docid ${data.docid}');
                                            await FirebaseFirestore.instance
                                                .collection('EmployeeProfile')
                                                .doc(data.docid)
                                                .update({'activate': true});
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: const Color.fromARGB(255, 4, 202, 30)
                                                  .withOpacity(0.8),
                                              borderRadius: const BorderRadius
                                                  .horizontal(),
                                            ),
                                            width: 80,
                                            height: 30,
                                            child: Center(
                                              child: GooglePoppinsWidgets(
                                                textAlign: TextAlign.center,
                                                color: cWhite,
                                                fontWeight: FontWeight.bold,
                                                text: "Active",
                                                fontsize: 10,
                                              ),
                                            ),
                                          ),
                                        ))
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          height: 10,
                        );
                      },
                      itemCount: snaps.data!.docs.length);
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
        )
      ],
      doyouwantActionButton: true);
}
