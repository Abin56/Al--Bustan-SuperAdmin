import 'package:canteen_superadmin_website/view/widgets/table_listview/table_listview.dart';
import 'package:flutter/material.dart';

class ExcelProductListContainer extends StatelessWidget {
  const ExcelProductListContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: TableListviewWidget(),
      ),
    );
  }
}
