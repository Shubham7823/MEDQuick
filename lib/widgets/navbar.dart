import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medquick_minor/Screens/home_screen.dart';
import 'package:medquick_minor/Screens/shopping1.dart';
import 'package:medquick_minor/Screens/signup.dart';

import '../myprofile/myprofile.dart';

class NavBarRoots extends StatefulWidget {
  @override
  State<NavBarRoots> createState() => _NavbarState();
}

class _NavbarState extends State<NavBarRoots> {
  int _selectedIndex = 0;
  var something;
  final _screens = [
    HomeScreen(),
    ShoppingCart(), //medical shopping
    MyProfile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: _screens[_selectedIndex],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.deepPurple,
        color: Color.fromARGB(255, 151, 124, 197),
        animationDuration: Duration(milliseconds: 500),
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: [
          Icon(
            Icons.home,
            color: Colors.black,
          ),
          Icon(
            Icons.add_shopping_cart_rounded,
            color: Colors.black,
          ),
          Icon(Icons.person),
        ],
      ),
    );
  }
}
