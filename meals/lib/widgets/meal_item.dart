import 'package:flutter/material.dart';
import 'package:meals/models/meals.dart';
import 'package:meals/screens/category_meal_info.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final Complexity complexity;
  final Affordability affordability;
  final int duration;

  const MealItem({
    Key? key,
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.affordability,
    required this.complexity,
    required this.duration,
  }) : super(key: key);

  void seletedMeal(BuildContext context) {
    Navigator.of(context)
        .pushNamed(MealInfo.routeName, arguments: {'id': id}).then((mealid) {});
  }

  String get complexityText {
    switch (complexity) {
      case Complexity.Simple:
        return "Simple";

      case Complexity.Challenging:
        return "Challenging";

      case Complexity.Hard:
        return "Hard";

      default:
        return "unknown";
    }
  }

  String get affordibilityText {
    switch (affordability) {
      case Affordability.Affordable:
        return "Affordable";

      case Affordability.Pricey:
        return "Pricey";

      case Affordability.Luxurious:
        return "Luxirious";

      default:
        return "unknown";
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => seletedMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 4,
        margin: EdgeInsets.all(15),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(imageUrl,
                      height: 200, width: double.infinity, fit: BoxFit.cover),
                ),
                Positioned(
                  bottom: 10,
                  //right: 0,
                  child: Container(
                    width: 370,
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Text(
                      title,
                      style: TextStyle(
                          color: Colors.white,
                          backgroundColor: Colors.black54,
                          fontSize: 26),
                      overflow: TextOverflow.fade,
                      softWrap: true,
                    ),
                  ),
                )
              ],
            ),
            Container(
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(Icons.schedule),
                      SizedBox(width: 3),
                      Text('$duration min'),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.work),
                      SizedBox(width: 3),
                      Text(complexityText),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.money),
                      SizedBox(width: 3),
                      Text(affordibilityText),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
