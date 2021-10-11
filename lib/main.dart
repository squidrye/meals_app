import 'package:flutter/material.dart';
import 'package:meals_app/Widget/WidgetSecondScreen/SecondScreen.dart';
import 'package:meals_app/Widget/WidgetsFirstScreen/dummy_data.dart';
import 'package:meals_app/models/meals.dart';
import './Widget/WidgetsFirstScreen/foodCategoriesScreen.dart';
import './Widget/WidgetThirdScreen/mealDetails.dart';
import './Widget/tabsScreen.dart';
import './Widget/filtersScreen.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
 
  List<Meal> availableMeals=DUMMY_MEALS;
  List<Meal> favouriteMeals=[];
  Map<String,bool> filterValuesMain={
    'gluten':false,
    'vegetarian':false,
    'lactose':false,
    'vegan':false,
  };
  bool isMealFavourite(String id){
    return favouriteMeals.any((iterable){
      return id==iterable.id;
    });
  }
  void _toggleMeals(String mealId){
    final existingMealIndex=favouriteMeals.indexWhere((iterable){
      print(mealId);
      print("and");
      print(iterable.id);
      return mealId==iterable.id;
      });
      print("bahar wala");
    print(existingMealIndex);
    if(existingMealIndex>=0){
      setState(() {
        favouriteMeals.remove(favouriteMeals[existingMealIndex]);
      });
    }else {
      setState(() {
        favouriteMeals.add(DUMMY_MEALS.firstWhere((iterable) =>iterable.id==mealId));
      });
    }
  }
  void _setFilters(Map<String,bool> filteredValues){
    setState(() {
      filterValuesMain=filteredValues;
      availableMeals=DUMMY_MEALS.where((iterable){
        if(filterValuesMain['gluten']! && iterable.isGlutenFree==false){
          return false;
        }
        if(filterValuesMain['lactose']! && iterable.isLactoseFree==false){
          return false;
        }
        if(filterValuesMain['vegetarian']! && iterable.isVegetarian==false){
          return false;
        }
        if(filterValuesMain['vegan']! && iterable.isVegan==false){
          return false;
        }
        return true; 
      }).toList();
    });
  }
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Meal App',
        theme: ThemeData(
            primarySwatch: Colors.teal,
            accentColor: Colors.limeAccent,
            canvasColor: Color.fromRGBO(205, 201, 228, 0.8),
            fontFamily: "Raleway-Bold",
            textTheme: TextTheme(
              bodyText2: TextStyle(fontSize: 16),
            )),
        // home: CategoriesScreen(),
        routes: {
          '/': (context) {
            return TabScreen(favouriteMeals);
          },
          SecondScreen.routeName: (context) {
            return SecondScreen(availableMeals);
          },
          MealDetails.routeName:(context){
            return MealDetails(_toggleMeals,isMealFavourite);
          },
          FilterScreen.routeName:(context){
            return FilterScreen(_setFilters,filterValuesMain);
          }
        },
        onUnknownRoute:(RouteSettings settings){
          return MaterialPageRoute(builder:(BuildContext context){
            return CategoriesScreen();
          });
        }
        );
  }
}


