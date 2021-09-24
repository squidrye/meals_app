import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  static const routeName='/secondCategoryScreen';
// final String title;
// final String id;
// SecondScreen({required this.title,required this.id});
  @override
  Widget build(BuildContext context) {
    
final recieveArgs=ModalRoute.of(context)!.settings.arguments as Map<String, String>;
final String? title=recieveArgs['title'];
final String? id=recieveArgs['id'];
    return Scaffold(
      appBar:AppBar(title:Text(title!)),
      body:Text("Soon to be here stuff"),
      
    );
  }
}