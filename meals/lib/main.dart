import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/filters.dart';
import 'package:meals/models/meals.dart';
import 'package:meals/screens/category_meal_info.dart';
import 'package:meals/screens/category_meal_screen.dart';
import 'package:meals/screens/category_screen.dart';
import 'package:meals/screens/setting_screen.dart';
import 'package:meals/screens/tabs_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Filters _filters = Filters(
      isGluconFree: false,
      isLactoseFree: false,
      isVegan: false,
      isVegeterian: false);

  List<Meal> _availableMeal = DUMMY_MEALS;
  List<Meal> _favorateMeal = [];
  int _isFavorateIndex = 0;

  void _selectFavorate(mealId) {
    _isFavorateIndex = _favorateMeal.indexWhere((meal) => meal.id == mealId);
    if (_isFavorateIndex >= 0) {
      setState(() {
        _favorateMeal.removeAt(_isFavorateIndex);
      });
    }
    if (_isFavorateIndex == -1) {
      setState(() {
        _favorateMeal
            .add(DUMMY_MEALS.firstWhere((element) => element.id == mealId));
      });
    }
  }

  bool _isFavorate(String mealId) {
    return _favorateMeal.any((meal) => meal.id == mealId);
  }

  _setFilters(Filters fil) {
    setState(() {
      _filters = fil;
      _availableMeal = DUMMY_MEALS.where((meal) {
        if (fil.isGluconFree && !meal.isGlutenFree) {
          return false;
        }
        if (fil.isLactoseFree && !meal.isLactoseFree) {
          return false;
        }
        if (fil.isVegan && !meal.isVegan) {
          return false;
        }
        if (fil.isVegeterian && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.green,
          accentColor: Colors.pinkAccent,
          canvasColor: Color.fromRGBO(252, 250, 240, 1),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(
                color: Color.fromRGBO(40, 50, 60, 1),
              ),
              bodyText2: TextStyle(
                color: Color.fromRGBO(40, 50, 60, 1),
              ),
              headline1: TextStyle(
                  fontFamily: 'Roboto',
                  color: Color.fromRGBO(10, 10, 10, 1),
                  fontWeight: FontWeight.bold,
                  fontSize: 20))),
      // home: MyHomePage(title: 'Flutter Demo Home Page'),
      initialRoute: '/',
      routes: {
        '/': (context) => TabsScreen(_favorateMeal),
        CategoryMeal.routeName: (context) => CategoryMeal(_availableMeal),
        MealInfo.routeName: (context) => MealInfo(_selectFavorate, _isFavorate),
        SettingScreen.routeName: (context) =>
            SettingScreen(fil: _filters, saveFilters: _setFilters),
      },
      onGenerateRoute: (context) {
        MaterialPageRoute(builder: (context) => CategoryScreen());
      },
      onUnknownRoute: (context) {
        MaterialPageRoute(builder: (context) => CategoryScreen());
      },
    );
  }
}
