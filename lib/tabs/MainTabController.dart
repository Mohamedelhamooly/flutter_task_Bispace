import 'dart:convert';

import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task/tabs/screens/AchievementScreen.dart';
import 'package:flutter_task/tabs/screens/HomeScreen.dart';
import 'package:flutter_task/tabs/screens/WishlistScreen.dart';
import 'package:flutter_task/tabs/screens/MoreScreen.dart';
import 'package:flutter_task/tabs/screens/MyCoursesScreen.dart';

class MainController extends StatefulWidget {
  @override
  _MainControllerState createState() => _MainControllerState();
}

class _MainControllerState extends State<MainController> {
  int _selectedIndex = 1;
  String currentTitle = "Home";
  List<StatefulWidget> widgets = [
    HomeItemScreen(),
    AchievementScreen(),
    WishlistScreen(),
    MyCoursesScreen(),
    MoreScreen()
  ];


  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        body: widgets[_selectedIndex],
        bottomNavigationBar: ConvexAppBar(
          items: [
            TabItem(
                icon: Image.asset("assets/images/unActive00.png"),
                activeIcon: Image.asset("assets/images/00.png"),

                title: 'Home'),
            TabItem(
                icon: Image.asset("assets/images/unActive01.png"),
                activeIcon: Image.asset("assets/images/01.png"),

                title: 'My Courses'),
            TabItem(
                icon: Image.asset("assets/images/unActive02.png"),
                activeIcon: Image.asset("assets/images/02.png"),

                title: 'Wishlist'),
            TabItem(
                icon: Image.asset("assets/images/unActive03.png"),
              activeIcon: Image.asset("assets/images/03.png"),

                title: 'Achievemen'
            ),
            TabItem(
                icon: Image.asset("assets/images/unActive04.png"),
                activeIcon: Image.asset("assets/images/04.png"),
                title: 'More'),
          ],
          color: Color(0xff17365D),
          activeColor: Colors.deepOrange,
          backgroundColor: Color(0xffEDF5F8),
          style: TabStyle.react,
          initialActiveIndex: 3,
          //optional, default as 0
          onTap: (int i) {
            _onItemTapped(i);
//            Switch(value: i, onChanged: null){}
            if(i==0){
              setState(() {
                currentTitle = "Home";
              });
            }
            else if(i==1){
              setState(() {
                currentTitle = "Bidding";
              });
            }
            else if(i==2){
              setState(() {
                currentTitle = "Create Order";
              });
            }
            else if(i==3){
              setState(() {
                currentTitle = "My Orders";
              });
            }
            else if(i==4){
              setState(() {
                currentTitle = "Profile";
              });
            }
          },
        ));
  }
}


