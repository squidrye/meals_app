import 'package:flutter/material.dart';
import '../WidgetSecondScreen/SecondScreen.dart';

class SingleItemRender extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  SingleItemRender(
      {required this.title, required this.color, required this.id});
  void onTapFunctionInk(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      SecondScreen.routeName,arguments:{"id":this.id, "title":this.title},
    );
  }

  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTapFunctionInk(context);
      },
      splashColor: Colors.green,
      borderRadius: BorderRadius.all(Radius.circular(18)),
      child: Container(
        child: Center(child: Text(title)),
        padding: EdgeInsets.all(6),
        margin: EdgeInsets.all(6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(18)),
          gradient: LinearGradient(
            colors: [color, color.withOpacity(0.3)],
            begin: Alignment.topLeft,
            end: Alignment.topRight,
          ),
        ),
      ),
    );
  }
}
