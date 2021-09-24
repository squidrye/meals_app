import 'package:flutter/material.dart';
import 'package:meals_app/Widget/WidgetSecondScreen/SecondScreen.dart';
import './Widget/WidgetsFirstScreen/foodCategoriesScreen.dart';

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
            return CategoriesScreen();
          },
          SecondScreen.routeName: (context) {
            return SecondScreen();
          }
        });
  }
}

// class MyHomePage extends StatefulWidget {
//   _MyHomePageState createState() {
//     return _MyHomePageState();
//   }
// }

// class _MyHomePageState extends State<MyHomePage> {
//   Widget build(BuildContext buildContext) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Meal App"),
//       ),
//       body:CategoriesScreen(),
//     );
//   }
// }
