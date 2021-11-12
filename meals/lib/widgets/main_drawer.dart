import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals/screens/setting_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget buildListile(String text, IconData icon, VoidCallback tapHadler) {
      return ListTile(
        leading: Icon(icon),
        title: Text(
          text,
          style: TextStyle(
              color: Colors.black,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.bold,
              fontSize: 20),
        ),
        onTap: tapHadler,
      );
    }

    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              //borderRadius: BorderRadius.circular(15),
              color: Colors.lightGreen),
          padding: EdgeInsets.all(10),
          //color: Theme.of(context).accentColor,
          height: 100,
          width: double.infinity,
          alignment: Alignment.bottomLeft,
          child: Text(
            'Cooking up?',
            style: TextStyle(
              color: Colors.pinkAccent,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.bold,
              fontSize: 40,
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        buildListile(
          'Meals',
          Icons.dining,
          () {
            Navigator.of(context).pushReplacementNamed('/');
          },
        ),
        buildListile(
          'Settings',
          Icons.settings,
          () {
            Navigator.of(context).pushReplacementNamed(SettingScreen.routeName);
          },
        )
      ],
    );
  }
}
