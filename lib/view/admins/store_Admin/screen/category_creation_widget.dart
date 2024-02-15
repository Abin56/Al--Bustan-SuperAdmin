import 'package:canteen_superadmin_website/view/admins/store_Admin/screen/category_widget.dart';
import 'package:canteen_superadmin_website/view/admins/store_Admin/screen/subcategory_widget.dart';
import 'package:canteen_superadmin_website/view/admins/store_Admin/screen/unit_widget.dart';
import 'package:flutter/material.dart';

class CategoryCreationWidget extends StatelessWidget {
  const CategoryCreationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height - 110,
      width: double.infinity,
      child: Row(
        children: [
          Expanded(child: CategoryWidget()),
          Expanded(child: SubCategoryWidget()),
          Expanded(child: UnitWidget())
        ],
      ),
    );
  }
}
