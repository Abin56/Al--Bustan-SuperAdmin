import 'package:canteen_superadmin_website/model/canteen_model.dart';
import 'package:canteen_superadmin_website/core/colors/colors.dart';
import 'package:canteen_superadmin_website/core/constant/constant.validate.dart';
import 'package:canteen_superadmin_website/core/fonts/google_poppins.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ScendRowWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final IconData iconData1;
  final IconData iconData2;

  const ScendRowWidget({
    super.key,
    required this.title,
    required this.icon,
    required this.iconData1,
    required this.iconData2,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 14),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Spacer(),
              IconButton(
                onPressed: () {},
                icon: Icon(icon),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 140,
              width: 140,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 242, 242, 245),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: AppColors.lightGreyColor,
                  width: 1.0,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      iconData1,
                      color: AppColors.greenColor,
                      size: 40,
                    ),
                    const Text(
                      "Total Orders",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Text(
                      "89",
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            sWidtht5,
            Container(
              height: 140,
              width: 140,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 242, 242, 245),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: AppColors.lightGreyColor,
                  width: 1.0,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      iconData2,
                      color: AppColors.greenColor,
                      size: 40,
                    ),
                    const Text(
                      "To be Deliver",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Text(
                      "09",
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}

class ScendRowoneWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final IconData iconData1;
  final VoidCallback navigate;

  const ScendRowoneWidget({
    super.key,
    required this.title,
    required this.icon,
    required this.iconData1,
    required this.navigate,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 14),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Spacer(),
              IconButton(
                onPressed: navigate,
                icon: const Icon(Icons.add),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(icon),
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 242, 242, 245),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: AppColors.lightGreyColor,
                // color: cGreen,
                width: 1.0,
              ),
            ),
            child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('CanteenList')
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.data!.docs.isEmpty) {
                  return Center(
                    child: GooglePoppinsWidgets(text: "No data", fontsize: 15),
                  );
                } else if (!snapshot.hasData) {
                  return Center(
                    child: GooglePoppinsWidgets(text: "No data", fontsize: 15),
                  );
                } else {
                  return ListView.separated(
                      itemBuilder: (context, index) {
                        final canteenData = CanteenModel.fromMap(
                            snapshot.data!.docs[index].data());
                        return Container(
                          decoration: BoxDecoration(
                            color: cWhite,
                            border: Border.all(color: cGrey),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: Row(
                              children: [
                                Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(canteenData.image),
                                    ),
                                  ),
                                ),
                                sWidtht10,
                                GooglePoppinsWidgets(
                                    text: canteenData.schoolName, fontsize: 14),
                              ],
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return sHeight10;
                      },
                      itemCount: snapshot.data!.docs.length);
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}
