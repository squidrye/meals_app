import 'package:flutter/material.dart';
import './dummy_data.dart';
import './singleItemRenderWidget.dart';
class CategoriesScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("My Meals")),
      body: GridView(
      children: <Widget>[
          ...DUMMY_CATEGORIES.map((singleCategory){
            return SingleItemRender(color:singleCategory.color, title:singleCategory.title, id:singleCategory.id);
          }).toList(),
      ],
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 350,
        childAspectRatio:3/2,
        crossAxisSpacing:4,
        mainAxisSpacing:4,
      ),
    ),
    );
  }
}
