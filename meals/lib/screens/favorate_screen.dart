import 'package:flutter/cupertino.dart';
import 'package:meals/models/meals.dart';
import 'package:meals/widgets/meal_item.dart';

class FavorateScreen extends StatelessWidget {
  final List<Meal> availableMeal;
  FavorateScreen(this.availableMeal);

  @override
  Widget build(BuildContext context) {
    if (availableMeal.isEmpty) {
      return Center(
        child: Container(
          child: Text("There is no favorates"),
        ),
      );
    } else {
      return ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
            id: availableMeal[index].id,
            title: availableMeal[index].title,
            imageUrl: availableMeal[index].imageUrl,
            affordability: availableMeal[index].affordability,
            complexity: availableMeal[index].complexity,
            duration: availableMeal[index].duration,
          );
        },
        itemCount: availableMeal.length,
      );
    }
  }
}
