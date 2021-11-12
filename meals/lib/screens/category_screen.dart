import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:meals/widgets/category_item.dart';
import '../data/dummy_data.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        children: DUMMY_CATEGORIES.map((category) {
          return CategoryItem(
            title: category.title,
            color: category.color,
            id: category.id,
          );
        }).toList());
  }
}
