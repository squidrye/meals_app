import 'package:flutter/material.dart';
import 'package:meals_app/models/meals.dart';
import '../WidgetThirdScreen/mealDetails.dart';

class SingleMealRender extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String id;
  final int duration;
  final Affordability affordability;
  final Complexity complexity;
  final Function removeItem;
  SingleMealRender({
    required this.title,
    required this.imageUrl,
    required this.id,
    required this.affordability,
    required this.complexity,
    required this.duration,
    required this.removeItem,
  });
  String complexityText() {
    if (complexity == Complexity.Simple) {
      return "Simple";
    }
    if (complexity == Complexity.Hard) {
      return "Hard";
    }
    if (complexity == Complexity.Challenging) {
      return "Challenging";
    }
    return "Unknown";
  }

  String affordabilityText() {
    switch (affordability) {
      case Affordability.Affordable:
        return "Affordable";
      case Affordability.Luxurious:
        return "Luxurious";
      case Affordability.Pricey:
        return "Pricey";
      default:
        return "Unknown";
    }
  }

  void pushPage(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      MealDetails.routeName,
      arguments: this.id,
    ).then((returnIdFromDetails){
      print(returnIdFromDetails);
      if(returnIdFromDetails!=null){
        removeItem(this.id);
      }
    });
  }

  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        pushPage(context);
      },
      child: Card(
        elevation: 6,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 200,
                  ),
                ),
                Positioned(
                  bottom: 12,
                  right: 12,
                  child: Container(
                    width: 220,
                    color: Colors.black54,
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 19,
                        color: Colors.white,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(children: <Widget>[
                    Icon(Icons.schedule),
                    SizedBox(width: 3),
                    Text("$duration min"),
                  ]),
                  Row(
                    children: [
                      Icon(Icons.work),
                      SizedBox(width: 4),
                      Text(complexityText()),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.monetization_on),
                      SizedBox(width: 3),
                      Text(affordabilityText()),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
