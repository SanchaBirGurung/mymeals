import 'package:flutter/material.dart';
import 'package:meals/models/meals.dart';
import 'package:meals/widgets/meal_item.dart';

class CategoryMeal extends StatefulWidget {
  static const routeName = '/category_meal';
  final List<Meal> _availableMeal;
  CategoryMeal(this._availableMeal);

  @override
  _CategoryMealState createState() => _CategoryMealState();
}

class _CategoryMealState extends State<CategoryMeal> {
  bool isInitState = false;
  String? categoryTitle;
  late List<Meal> displayMeal;
  @override
  void didChangeDependencies() {
    if (!isInitState) {
      final routeArg =
          ModalRoute.of(context)!.settings.arguments as Map<String, String>;
      categoryTitle = routeArg['title'] as String;
      final categoryId = routeArg['id'] as String;
      displayMeal = widget._availableMeal.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      isInitState = true;
    }
    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      displayMeal.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle as String),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
            id: displayMeal[index].id,
            title: displayMeal[index].title,
            imageUrl: displayMeal[index].imageUrl,
            affordability: displayMeal[index].affordability,
            complexity: displayMeal[index].complexity,
            duration: displayMeal[index].duration,
          );
        },
        itemCount: displayMeal.length,
      ),
    );
  }
}
