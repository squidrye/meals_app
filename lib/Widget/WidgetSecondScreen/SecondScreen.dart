import 'package:flutter/material.dart';
import 'package:meals_app/Widget/WidgetSecondScreen/singleMealRenderWidget.dart';
import 'package:meals_app/models/meals.dart';
import '../WidgetsFirstScreen/dummy_data.dart';

class SecondScreen extends StatelessWidget {
  static const routeName = '/secondCategoryScreen';
// final String title;
// final String id;
// SecondScreen({required this.title,required this.id});
  @override
  Widget build(BuildContext context) {
    final recieveArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final String? title = recieveArgs['title'];
    final String? id = recieveArgs['id'];
    final filteredValue = DUMMY_MEALS.where((iterable) {
      return iterable.categories.contains(id);
    }).toList();
    
    return Scaffold(
      appBar: AppBar(title: Text(title!)),
      body: ListView.builder(
        itemBuilder: (BuildContext context,int index) {
          return SingleMealRender(
              title: filteredValue[index].title,
              imageUrl: filteredValue[index].imageUrl,
              id: filteredValue[index].id,
              affordability: filteredValue[index].affordability,
              complexity: filteredValue[index].complexity,
              duration: filteredValue[index].duration);
        },
        itemCount: filteredValue.length,
      ),
    );
  }
}
