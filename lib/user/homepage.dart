import 'package:flutter/material.dart';
import 'package:food_order/user/navpages/History.dart';
import 'package:food_order/user/navpages/home.dart';
import 'package:food_order/user/navpages/profile.dart';
import 'package:food_order/user/navpages/restaurants.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  final List _navPages = [
    Home(),
    Restaurants(),
    History(),
    Profile()
  ];

  int currentPageIndex = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _navPages[currentPageIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPageIndex,
        fixedColor: Colors.green,
        unselectedItemColor: Colors.grey,
        onTap: (value) => setState(() {
          currentPageIndex = value;
        }),
        items: [
          bottomNavItem(Icons.home_filled, "Home"),
          bottomNavItem(Icons.restaurant_outlined, "Restaurants"),
          bottomNavItem(Icons.history_outlined, "History"),
          bottomNavItem(Icons.person, "Profile")
        ]
      ),
    );
  }

  BottomNavigationBarItem bottomNavItem(IconData icon, String label){
    return BottomNavigationBarItem(icon: Icon(icon), label: label);
  }
}