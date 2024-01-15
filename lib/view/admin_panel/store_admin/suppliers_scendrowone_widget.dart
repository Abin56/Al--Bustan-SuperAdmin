import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:canteen_superadmin_website/model/suppliers_model.dart';
import 'package:canteen_superadmin_website/view/colors/colors.dart';
import 'package:canteen_superadmin_website/view/fonts/google_poppins.dart';

class SuppliersScendRowoneWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final IconData iconData1;
  final VoidCallback navigate;

  const SuppliersScendRowoneWidget({
    Key? key,
    required this.title,
    required this.icon,
    required this.iconData1,
    required this.navigate,
  }) : super(key: key);

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
          child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('SuppliersList')
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
                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5,
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 8.0,
                    childAspectRatio: 0.8,
                  ),
                  itemBuilder: (context, index) {
                    final SuppliersData = SuppliersModel.fromMap(
                        snapshot.data!.docs[index].data());
                    return Container(
                      decoration: BoxDecoration(
                        color: cWhite,
                        border: Border.all(color: cGrey),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  image: NetworkImage(SuppliersData.image),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            GooglePoppinsWidgets(
                              text: SuppliersData.suppliersName,
                              fontsize: 14,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: snapshot.data!.docs.length,
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
