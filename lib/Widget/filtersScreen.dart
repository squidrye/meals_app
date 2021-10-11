import 'package:flutter/material.dart';
import 'package:meals_app/Widget/mainDrawer.dart';

class FilterScreen extends StatefulWidget {
  static const String routeName = "/FilterScreen";
  Function setFilters;
  Map<String,bool> currentFilters;
  FilterScreen(this.setFilters,this.currentFilters);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var _glutenFree = false;
  var _lactoseFree = false;
  var _isVegan = false;
  var _isVegetarian = false;
  @override
  void initState() {
      _glutenFree=widget.currentFilters['gluten']!;  
      _lactoseFree=widget.currentFilters['lactose']!;
      _isVegan=widget.currentFilters['vegan']!;
      _isVegetarian=widget.currentFilters['vegetarian']!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Filters"),
          actions: [
            IconButton(
                icon: Icon(Icons.save),
                onPressed: () {
                  final selectedFilters = {
                    'gluten': _glutenFree,
                    'vegetarian': _lactoseFree,
                    'lactose': _isVegan,
                    'vegan': _isVegetarian,
                  };
                  widget.setFilters(selectedFilters);
                })
          ],
        ),
        drawer: MainDrawer(),
        body: Column(
          children: [
            Container(
                padding: EdgeInsets.all(20),
                child: Text("Adjust your filters")),
            Expanded(
              child: ListView(
                children: [
                  SwitchListTile(
                    title: Text("Gluten Free"),
                    value: _glutenFree,
                    subtitle: Text("Shows only gluten free meals"),
                    onChanged: (newValue) {
                      setState(() {
                        _glutenFree = newValue;
                      });
                    },
                  ),
                  SwitchListTile(
                    title: Text("Lactose Free"),
                    value: _lactoseFree,
                    subtitle: Text("Shows only lactose free meals"),
                    onChanged: (newValue) {
                      setState(() {
                        _lactoseFree = newValue;
                      });
                    },
                  ),
                  SwitchListTile(
                    title: Text("Vegan"),
                    value: _isVegan,
                    subtitle: Text("Shows only Vegan meals"),
                    onChanged: (newValue) {
                      setState(() {
                        _isVegan = newValue;
                      });
                    },
                  ),
                  SwitchListTile(
                    title: Text("Vegetarian"),
                    value: _isVegetarian,
                    subtitle: Text("Shows only Vegetarian meals"),
                    onChanged: (newValue) {
                      setState(() {
                        _isVegetarian = newValue;
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
