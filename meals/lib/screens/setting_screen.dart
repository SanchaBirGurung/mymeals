import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals/models/filters.dart';

import 'package:meals/widgets/main_drawer.dart';

class SettingScreen extends StatefulWidget {
  final Function saveFilters;
  final Filters? fil;
  const SettingScreen({Key? key, required this.saveFilters, required this.fil})
      : super(key: key);
  static const routeName = '/setting_screen';

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool isGluconFree = false;
  bool isLactoseFree = false;
  bool isVegan = false;
  bool isVegeterian = false;

  initState() {
    super.initState();
    isGluconFree = widget.fil!.isGluconFree;
    isLactoseFree = widget.fil!.isLactoseFree;
    isVegan = widget.fil!.isVegan;
    isVegeterian = widget.fil!.isVegeterian;
  }

  Widget _buildSwitchListTile(bool currentValue, String title, String subtitle,
      void Function(bool) update) {
    return SwitchListTile(
      value: currentValue,
      title: Text(title),
      subtitle: Text(subtitle),
      onChanged: update,
    );
  }

  @override
  Widget build(BuildContext context) {
    Filters filter = Filters(
      isGluconFree: isGluconFree,
      isLactoseFree: isLactoseFree,
      isVegan: isVegan,
      isVegeterian: isVegeterian,
    );

    return Scaffold(
        appBar: AppBar(
          title: Text('setting'),
          actions: [
            IconButton(
              onPressed: () {
                widget.saveFilters(filter);
              },
              icon: Icon(Icons.save),
            ),
          ],
        ),
        drawer: Drawer(
          child: MainDrawer(),
        ),
        body: Column(children: [
          Container(
            padding: EdgeInsets.all(10),
            child: Text(
              'Select the filters',
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          Expanded(
            child: ListView(children: [
              _buildSwitchListTile(
                  isGluconFree, 'Glucon', 'Turn on for Glucon Free meal',
                  (val) {
                setState(() {
                  isGluconFree = val;
                });
              }),
              _buildSwitchListTile(isLactoseFree, 'Lactose-Free',
                  'Only include Lactose free meals', (val) {
                setState(() {
                  isLactoseFree = val;
                });
              }),
              _buildSwitchListTile(isVegan, 'Vegan', 'Only include Vegan Food',
                  (val) {
                setState(() {
                  isVegan = val;
                });
              }),
              _buildSwitchListTile(
                  isVegeterian, 'Vegeterian', 'Only include Vegeterian meals',
                  (val) {
                setState(() {
                  isVegeterian = val;
                });
              }),
            ]),
          )
        ]));
  }
}
