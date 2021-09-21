import 'package:flutter/material.dart';
import '../WidgetSecondScreen/SecondScreen.dart';
class SingleItemRender extends StatelessWidget {
  final String title;
  final Color color;

  SingleItemRender({required this.title, required this.color});
void onTapFunctionInk(BuildContext ctx){
Navigator.of(ctx).push(MaterialPageRoute(builder:(_){
  return SecondScreen();
}));
}
  Widget build(BuildContext context) {
    return InkWell(
      onTap:(){onTapFunctionInk(context);},
      splashColor: Colors.green,
      borderRadius:BorderRadius.all(Radius.circular(18)),      
      child: Container(
        child: Text(title,textAlign:TextAlign.center,style: TextStyle(height:3.5,fontSize:17),),
        padding: EdgeInsets.all(6),
        margin: EdgeInsets.all(6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(18)),
          gradient: LinearGradient(
            colors: [color, color.withOpacity(0.3)],
            begin:Alignment.topLeft,
            end:Alignment.topRight,
          ),
        ),
      ),
    );
  }
}
