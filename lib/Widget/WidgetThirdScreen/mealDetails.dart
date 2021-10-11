import 'package:flutter/material.dart';
import '../WidgetsFirstScreen/dummy_data.dart';

class MealDetails extends StatelessWidget {
  static const String routeName = "/mealDetailScreen";
  Function toggleFav, isMealFavourite;
  MealDetails(this.toggleFav, this.isMealFavourite);
  Widget build(BuildContext ctx) {
    final idMeal = ModalRoute.of(ctx)!.settings.arguments as String;
    var selectedMeal = DUMMY_MEALS.firstWhere((iterable) {
      if (iterable.id == idMeal) {
        return true;
      } else
        return false;
    });
    Widget buildContainer(String title) {
      return Container(
        padding: EdgeInsets.all(5),
        margin: EdgeInsets.all(5),
        child: Text(title, style: Theme.of(ctx).textTheme.bodyText2),
      );
    }

    Widget buildList(Widget child) {
      return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10),
          ),
          margin: EdgeInsets.all(4),
          height: 200,
          width: double.infinity,
          child: child);
    }

    return Scaffold(
      appBar: AppBar(title: Text("${selectedMeal.title}")),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              margin: EdgeInsets.all(4),
              height: 300,
              width: double.infinity,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(9),
                ),
                elevation: 5,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(9),
                    topRight: Radius.circular(9),
                  ),
                  child: Image.network(
                    selectedMeal.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            buildContainer("Ingredients"),
            buildList(Card(
              color: Theme.of(ctx).backgroundColor,
              child: ListView.builder(
                itemBuilder: (BuildContext ctx, int index) {
                  return Column(
                    children: [
                      Text(selectedMeal.ingredients[index]),
                      Divider(),
                    ],
                  );
                },
                itemCount: selectedMeal.ingredients.length,
              ),
            )),
            buildContainer("Recipie"),
            buildList(Card(
              color: Theme.of(ctx).backgroundColor,
              child: ListView.builder(
                itemBuilder: (BuildContext ctx, int index) {
                  return Column(
                    children: [
                      ListTile(
                          leading: CircleAvatar(
                            child: Text("${index + 1}"),
                          ),
                          title: Text(selectedMeal.steps[index])),
                      Divider(),
                    ],
                  );
                },
                itemCount: selectedMeal.steps.length,
              ),
            ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(isMealFavourite(idMeal) ? Icons.star : Icons.star_border),
          onPressed: () {
            toggleFav(selectedMeal.id);
          }),
    );
  }
}
