import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(String title, IconData icon,Function tapHandler){
    return  ListTile(
            leading: Icon(icon, size: 26),
            title: Text(title,
                style: TextStyle(
                  // fontFamily: "RobotoCondensed",
                  fontSize: 24,
                  fontWeight: FontWeight.normal,
                )),
            onTap:(){tapHandler();});
  }
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      children: [
        Container(
          color: Theme.of(context).backgroundColor,
          height: 100,
          width: double.infinity,
          padding: EdgeInsets.all(20),
          alignment: Alignment.centerLeft,
          child: Text('Cooking up!',
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 30,
                color: Theme.of(context).accentColor,
              )),
        ),
        SizedBox(height: 20),
       buildListTile("Meals",Icons.restaurant,(){
         Navigator.of(context).pushReplacementNamed("/",);
       }),
       SizedBox(height: 20,),
       buildListTile("Filters",Icons.settings,(){
         Navigator.of(context).pushReplacementNamed("/FilterScreen");

       }),
      ],
    ));
  }
}
