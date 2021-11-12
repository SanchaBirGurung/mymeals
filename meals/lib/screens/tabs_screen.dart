import 'package:flutter/material.dart';
import 'package:meals/models/meals.dart';
import 'package:meals/screens/category_screen.dart';
import 'package:meals/screens/favorate_screen.dart';
import 'package:meals/widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> availableMeal;
  //const TabsScreen({Key? key}) : super(key: key);
  TabsScreen(this.availableMeal);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> pages = [];
  initState() {
    pages = [
      {'page': CategoryScreen(), 'title': 'Category'},
      {'page': FavorateScreen(widget.availableMeal), 'title': 'My Favorate'},
    ];
    super.initState();
  }

  int _selectPageIndex = 0;
  _selectPage(int index) {
    setState(() {
      _selectPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pages[_selectPageIndex]['title'] as String),
      ),
      drawer: Drawer(
        child: MainDrawer(),
      ),
      body: pages[_selectPageIndex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectPageIndex,
          onTap: _selectPage,
          backgroundColor: Theme.of(context).canvasColor,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.category), label: 'Category'),
            BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorates'),
          ]),
    );
  }
}
