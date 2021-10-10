import 'package:flutter/material.dart';
import 'package:meals_app/Widget/WidgetSecondScreen/SecondScreen.dart';
import './Widget/WidgetsFirstScreen/foodCategoriesScreen.dart';
import './Widget/WidgetThirdScreen/mealDetails.dart';
import './Widget/tabsScreen.dart';
import './Widget/filtersScreen.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
            return TabScreen();
          },
          SecondScreen.routeName: (context) {
            return SecondScreen();
          },
          MealDetails.routeName:(context){
            return MealDetails();
          },
          FilterScreen.routeName:(context){
            return FilterScreen();
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


