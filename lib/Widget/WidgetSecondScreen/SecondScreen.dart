import 'package:flutter/material.dart';
import 'package:meals_app/Widget/WidgetSecondScreen/singleMealRenderWidget.dart';
import 'package:meals_app/models/meals.dart';
import '../WidgetsFirstScreen/dummy_data.dart';

class SecondScreen extends StatefulWidget{
  static const routeName = '/secondCategoryScreen';
  List<Meal> availableMeals;
  SecondScreen(this.availableMeals);
  SecondScreenState createState(){
    return SecondScreenState();
  }

}
class SecondScreenState extends State<SecondScreen>{
  var _loadInitialData=false;
  String? title;
  List<Meal>? filteredValue;
void didChangeDependencies(){
  if(!_loadInitialData){
final recieveArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
     title = recieveArgs['title'];
    final String? id = recieveArgs['id'];
    filteredValue = widget.availableMeals.where((iterable) {
      return iterable.categories.contains(id);
    }).toList();
  }
  _loadInitialData=true;
  super.didChangeDependencies();
}

void removeItem(String id){
 setState((){
   filteredValue!.removeWhere((iterable){
     return iterable.id==id;
   });
 });
}
  @override
  Widget build(BuildContext context) {
    
    
    return Scaffold(
      appBar: AppBar(title: Text(title!)),
      body: ListView.builder(
        itemBuilder: (BuildContext context,int index) {
          return SingleMealRender(
              title: filteredValue![index].title,
              imageUrl: filteredValue![index].imageUrl,
              id: filteredValue![index].id,
              affordability: filteredValue![index].affordability,
              complexity: filteredValue![index].complexity,
              duration: filteredValue![index].duration,
              removeItem:removeItem,
              );
        },
        itemCount: filteredValue!.length,
      ),
    );
  }
}
