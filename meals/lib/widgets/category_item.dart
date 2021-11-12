import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals/screens/category_meal_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;
  const CategoryItem(
      {Key? key, required this.title, required this.color, required this.id})
      : super(key: key);

  void selectNextPage(BuildContext context) {
    Navigator.pushNamed(context, CategoryMeal.routeName,
        arguments: {'id': id, 'title': title});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: GestureDetector(
        onTap: () => selectNextPage(context),
        //borderRadius: BorderRadius.circular(15),
        //splashColor: Theme.of(context).accentColor,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(width: 2, color: Colors.white),
            gradient: LinearGradient(
                colors: [color.withOpacity(0.6), color],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
          ),
          child: Center(
            child: Text(
              title,
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
        ),
      ),
    );
  }
}
