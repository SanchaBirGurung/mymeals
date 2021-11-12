import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../data/dummy_data.dart';

class MealInfo extends StatelessWidget {
  final selectFavorate;
  final isFavorate;
  // final VoidCallback deleteHand;
  MealInfo(this.selectFavorate, this.isFavorate);
  static const routeName = '/Meal_info';

  Widget buildtitles(BuildContext context, String text) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.headline1,
        softWrap: true,
      ),
    );
  }

  Widget buildList(context, Widget child) {
    return Container(
      height: 200,
      width: MediaQuery.of(context).size.width * 0.8,
      //decoration: BoxDecoration(border: Border.all(width: 1)),
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.all(5),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final routeArg =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final id = routeArg['id'] as String;
    final selectMealInfo = DUMMY_MEALS.firstWhere((meal) => meal.id == id);
    //final id = routeArg as String;
    return Scaffold(
      appBar: AppBar(
        title: Text(selectMealInfo.title),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
            child: Image.network(
              selectMealInfo.imageUrl,
              height: MediaQuery.of(context).size.height * 0.4,
              width: double.infinity,
              fit: BoxFit.contain,
            ),
          ),
          buildtitles(context, 'Ingredient'),
          buildList(
            context,
            ListView.builder(
                itemCount: selectMealInfo.ingredients.length,
                itemBuilder: (context, index) {
                  return Card(
                    //color: Theme.of(context).accentColor,
                    elevation: 10,
                    child: Text(selectMealInfo.ingredients[index]),
                  );
                }),
          ),
          buildtitles(context, 'steps'),
          buildList(
            context,
            ListView.builder(
                itemCount: selectMealInfo.steps.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Text('# ${index + 1}'),
                      ),
                      title: Text(
                        selectMealInfo.steps[index],
                        style: Theme.of(context).textTheme.headline1,
                      ),
                    ),
                  );
                }),
          )
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => selectFavorate(selectMealInfo.id),
        child: Icon(
            isFavorate(selectMealInfo.id) ? Icons.star : Icons.star_border),
      ),
    );
  }
}
