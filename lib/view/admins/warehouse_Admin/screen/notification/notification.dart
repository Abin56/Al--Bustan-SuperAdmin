import 'package:canteen_superadmin_website/controller/pushnotification_controller/pushnotification_controller.dart';
import 'package:canteen_superadmin_website/view/admins/store_Admin/screen/supplier_adding_widget.dart';
import 'package:canteen_superadmin_website/view/widgets/custom_showDilog/custom_showdilog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WareAdminNotification extends StatelessWidget {
  PushnotificationController pushnotificationController =
      Get.put(PushnotificationController());
  WareAdminNotification({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController notificationtitlecontroller = TextEditingController();
    TextEditingController notificationcontentcontroller =
        TextEditingController();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            height: size.height * 0.95,
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(),
            ),
            child: Padding(
              padding: EdgeInsets.only(left: size.width * 0.1),
              child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Row(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 5, right: 10),
                                child: InkWell(
                                  onTap: () {
                                    customShowDilogBox(
                                      context: context,
                                      title: "Message",
                                      children: [
                                        TextFormFiledContainerWidget(
                                            controller:
                                                notificationtitlecontroller,
                                            hintText: "Title",
                                            title: 'Title',
                                            width: 200),
                                        TextFormFiledContainerWidget(
                                            controller:
                                                notificationcontentcontroller,
                                            hintText: "Content",
                                            title: 'Content',
                                            width: 300)
                                      ],
                                      doyouwantActionButton: true,
                                      actiononTapfuction: () async {
                                        await pushnotificationController
                                            .fetchalluserDeviceToken()
                                            .then((value) async {
                                          await pushnotificationController
                                              .fetchAllEmployeesUid()
                                              .then((value) async =>
                                                  await pushnotificationController
                                                      .fetchAllEmployeeDeviceID()
                                                      .then((value) async =>
                                                          await pushnotificationController
                                                              .sendMessageForEmployee()));
                                        });

                                        // await PushnotificationController.sendMessageForAllUsers("","");
                                      },
                                    );
                                  },
                                  child: Container(
                                    height: 200,
                                    width: 200,
                                    decoration: BoxDecoration(
                                        boxShadow: const [
                                          BoxShadow(
                                            color: Colors.grey,
                                            offset: Offset(
                                              5.0,
                                              5.0,
                                            ),
                                            blurRadius: 10.0,
                                            spreadRadius: 2.0,
                                          ), //BoxShadow
                                          BoxShadow(
                                            color: Colors.white,
                                            offset: Offset(0.0, 0.0),
                                            blurRadius: 0.0,
                                            spreadRadius: 0.0,
                                          ), //BoxShadow
                                        ],
                                        // color: const Color.fromARGB(
                                        //     255, 137, 213, 249),
                                        border: Border.all(color: Colors.white),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(20))),
                                    child: Column(children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 20),
                                        child: Container(
                                            height: 100,
                                            width: 100,
                                            decoration: const BoxDecoration(
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                        "web_images/division (1).png")))),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(top: 20),
                                        child: Text(
                                          "All Employees",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      )
                                    ]),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 10, left: 20),
                                child: InkWell(
                                  onTap: () {
                                    customShowDilogBox(
                                        context: context,
                                        title: "Message",
                                        children: [
                                          TextFormFiledContainerWidget(
                                              controller:
                                                  notificationtitlecontroller,
                                              hintText: "Title",
                                              title: 'Title',
                                              width: 200),
                                          TextFormFiledContainerWidget(
                                              controller:
                                                  notificationcontentcontroller,
                                              hintText: "Content",
                                              title: 'Content',
                                              width: 300)
                                        ],
                                        doyouwantActionButton: true,
                                        actiononTapfuction: () async {
                                          await pushnotificationController
                                              .fetchalluserDeviceToken()
                                              .then((value) async {
                                            await pushnotificationController
                                                .fetchAllDEliveryAdmin()
                                                .then((value) async =>
                                                    await pushnotificationController
                                                            .FetchAllDeliveryAdminDeviceID()
                                                        .then((value) async =>
                                                            await pushnotificationController
                                                                .sendMessageForDeliverAdmin()));
                                          });
                                        }

                                        // getWarehouseCtr.editQuantity(productData.docId,
                                        //     int.parse(getWarehouseCtr.quantityCtr.text));
                                        // },
                                        );
                                  },
                                  child: Container(
                                    height: 200,
                                    width: 200,
                                    decoration: BoxDecoration(
                                        boxShadow: const [
                                          BoxShadow(
                                            color: Colors.grey,
                                            offset: Offset(
                                              5.0,
                                              5.0,
                                            ),
                                            blurRadius: 10.0,
                                            spreadRadius: 2.0,
                                          ), //BoxShadow
                                          BoxShadow(
                                            color: Colors.white,
                                            offset: Offset(0.0, 0.0),
                                            blurRadius: 0.0,
                                            spreadRadius: 0.0,
                                          ), //BoxShadow
                                        ],
                                        border: Border.all(color: Colors.white),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(20))),
                                    child: Column(children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 20),
                                        child: Container(
                                            height: 100,
                                            width: 100,
                                            decoration: const BoxDecoration(
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                        "web_images/home-delivery.png")))),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(top: 20),
                                        child: Text(
                                          "Delivery Admin",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      )
                                    ]),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 140),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () {
                                customShowDilogBox(
                                  context: context,
                                  title: "Message",
                                  children: [
                                    TextFormFiledContainerWidget(
                                        controller: notificationtitlecontroller,
                                        hintText: "Title",
                                        title: 'Title',
                                        width: 200),
                                    TextFormFiledContainerWidget(
                                        controller:
                                            notificationcontentcontroller,
                                        hintText: "Content",
                                        title: 'Content',
                                        width: 300)
                                  ],
                                  doyouwantActionButton: true,
                                  actiononTapfuction: () async {
                                    await pushnotificationController
                                        .fetchalluserDeviceToken()
                                        .then((value) async =>
                                            await PushnotificationController
                                                .sendMessageForAllUsers());

                                    ///  await pushnotificationController.sendMessageForDeliverAdmin();
                                    // getWarehouseCtr.editQuantity(productData.docId,
                                    //     int.parse(getWarehouseCtr.quantityCtr.text));
                                  },
                                );
                              },
                              child: Container(
                                height: 200,
                                width: 200,
                                decoration: BoxDecoration(
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Colors.grey,
                                        offset: Offset(
                                          5.0,
                                          5.0,
                                        ),
                                        blurRadius: 10.0,
                                        spreadRadius: 2.0,
                                      ), //BoxShadow
                                      BoxShadow(
                                        color: Colors.white,
                                        offset: Offset(0.0, 0.0),
                                        blurRadius: 0.0,
                                        spreadRadius: 0.0,
                                      ), //BoxShadow
                                    ],
                                    border: Border.all(color: Colors.white),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(20))),
                                child: Column(children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 20),
                                    child: Container(
                                        height: 100,
                                        width: 100,
                                        decoration: const BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    "web_images/management.png")))),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(top: 20),
                                    child: Text(
                                      "All Admins",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  )
                                ]),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Row(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 10, right: 10),
                              child: InkWell(
                                onTap: () {
                                  customShowDilogBox(
                                    context: context,
                                    title: "Message",
                                    children: [
                                      TextFormFiledContainerWidget(
                                          controller:
                                              notificationtitlecontroller,
                                          hintText: "Title",
                                          title: 'Title',
                                          width: 200),
                                      TextFormFiledContainerWidget(
                                          controller:
                                              notificationcontentcontroller,
                                          hintText: "Content",
                                          title: 'Content',
                                          width: 300)
                                    ],
                                    doyouwantActionButton: true,
                                    actiononTapfuction: () async {
                                      pushnotificationController
                                          .fetchalluserDeviceToken()
                                          .then((value) async => pushnotificationController
                                              .fetchAllWarehouseAdmin()
                                              .then((value) => pushnotificationController
                                                  .fetchAllWarehouseAdminDeviceID()
                                                  .then((value) async =>
                                                      await pushnotificationController
                                                          .sendMessageForWareHouseAdmin())));

                                      // getWarehouseCtr.editQuantity(productData.docId,
                                      //     int.parse(getWarehouseCtr.quantityCtr.text));
                                    },
                                  );
                                },
                                child: Container(
                                  height: 200,
                                  width: 200,
                                  decoration: BoxDecoration(
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Colors.grey,
                                          offset: Offset(
                                            5.0,
                                            5.0,
                                          ),
                                          blurRadius: 10.0,
                                          spreadRadius: 2.0,
                                        ), //BoxShadow
                                        BoxShadow(
                                          color: Colors.white,
                                          offset: Offset(0.0, 0.0),
                                          blurRadius: 0.0,
                                          spreadRadius: 0.0,
                                        ), //BoxShadow
                                      ],
                                      border: Border.all(color: Colors.white),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(20))),
                                  child: Column(children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                      child: Container(
                                          height: 100,
                                          width: 100,
                                          decoration: const BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      "web_images/manager.png")))),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(top: 20),
                                      child: Text(
                                        "Warehouse Admin",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    )
                                  ]),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20, top: 10),
                              child: InkWell(
                                onTap: () {
                                  customShowDilogBox(
                                    context: context,
                                    title: "Message",
                                    children: [
                                      TextFormFiledContainerWidget(
                                          controller:
                                              notificationtitlecontroller,
                                          hintText: "Title",
                                          title: 'Title',
                                          width: 200),
                                      TextFormFiledContainerWidget(
                                          controller:
                                              notificationcontentcontroller,
                                          hintText: "Content",
                                          title: 'Content',
                                          width: 300)
                                    ],
                                    doyouwantActionButton: true,
                                    actiononTapfuction: () async {
                                      await pushnotificationController
                                          .fetchalluserDeviceToken()
                                          .then((value) async {
                                        await pushnotificationController
                                            .fetchAllStoreAdmin()
                                            .then((value) async =>
                                                await pushnotificationController
                                                    .fetchAllStoreAdminDEviceId()
                                                    .then((value) async =>
                                                        await pushnotificationController
                                                            .sendMessageForStoreAdmin()));
                                      });

                                      // await PushnotificationController.sendMessageForAllUsers("","");
                                    },
                                  );
                                },
                                child: Container(
                                  height: 200,
                                  width: 200,
                                  decoration: BoxDecoration(
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Colors.grey,
                                          offset: Offset(
                                            5.0,
                                            5.0,
                                          ),
                                          blurRadius: 10.0,
                                          spreadRadius: 2.0,
                                        ), //BoxShadow
                                        BoxShadow(
                                          color: Colors.white,
                                          offset: Offset(0.0, 0.0),
                                          blurRadius: 0.0,
                                          spreadRadius: 0.0,
                                        ), //BoxShadow
                                      ],
                                      border: Border.all(color: Colors.white),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(20))),
                                  child: Column(children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                      child: Container(
                                          height: 100,
                                          width: 100,
                                          decoration: const BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      "web_images/inventory.png")))),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(top: 20),
                                      child: Text(
                                        "Store Admin",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    )
                                  ]),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
