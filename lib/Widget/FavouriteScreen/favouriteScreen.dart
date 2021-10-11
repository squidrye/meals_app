import 'package:flutter/material.dart';
import 'package:meals_app/models/meals.dart';
import 'package:meals_app/Widget/WidgetSecondScreen/singleMealRenderWidget.dart';
class FavouriteScreen extends StatelessWidget{
  List<Meal> favouriteMeals;
  FavouriteScreen(this.favouriteMeals);
  Widget build(BuildContext ctx){
    if(favouriteMeals.isEmpty){
    return Center(child:Text("Your have no favourites yet"));      
    }else {
    return ListView.builder(
        itemBuilder: (BuildContext context,int index) {
          return SingleMealRender(
              title: favouriteMeals[index].title,
              imageUrl: favouriteMeals[index].imageUrl,
              id: favouriteMeals[index].id,
              affordability: favouriteMeals[index].affordability,
              complexity: favouriteMeals[index].complexity,
              duration: favouriteMeals[index].duration,
              removeItem:(_){},
              );
        },
        itemCount: favouriteMeals.length,
      ); 
  }
}
}