import 'package:flutter/material.dart';
import './WidgetsFirstScreen/foodCategoriesScreen.dart';
import './FavouriteScreen/favouriteScreen.dart';
import './mainDrawer.dart';

class TabScreen extends StatefulWidget {
  _TabScreenState createState() {
    return _TabScreenState();
  }
}

class _TabScreenState extends State<TabScreen> {
  final List<Map<String,dynamic>> _pages=[
    {
      'page':CategoriesScreen(),
      'title':Text("My Meals")
    },
    {
      'page':FavouriteScreen(),
      'title':Text("Favourite")
    },
  ];
  int _selectedPageIndex=0;
  void _selectPage(int index){
    setState((){
      _selectedPageIndex=index;
    });
  }
  Widget build(BuildContext context) {
    //return DefaultTabController()
    return Scaffold(
      appBar: AppBar(
        title: _pages[_selectedPageIndex]['title'],
        // bottom: TabBar()
      ),
      drawer:Drawer(
        child:MainDrawer(),
      ),
      body: _pages[_selectedPageIndex]['page'],
      // TabBarView(),
      bottomNavigationBar: BottomNavigationBar(
        onTap:_selectPage,
        backgroundColor: Theme.of(context).backgroundColor,
        unselectedItemColor:Colors.white,
        selectedItemColor:Theme.of(context).accentColor,
        currentIndex:_selectedPageIndex,//tells bottom navigation bar whihch tab is actually selected because everything is done manually,
        type:BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            backgroundColor:  Theme.of(context).backgroundColor,
              icon: Icon(Icons.category), 
              label: "Categories",
              ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).backgroundColor,
            icon:Icon(Icons.star,),
            label:"Favourites",
          ),
        ],
      ),
    );
  }
}
