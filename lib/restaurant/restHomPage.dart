import 'package:flutter/material.dart';
import 'package:food_order/restaurant/navpages/restOrders.dart';
import 'package:food_order/restaurant/navpages/restProfile.dart';
import 'package:food_order/restaurant/navpages/resthome.dart';

class RestHomPage extends StatefulWidget {
  const RestHomPage({super.key});

  @override
  State<RestHomPage> createState() => _RestHomPageState();
}

class _RestHomPageState extends State<RestHomPage> {

  List<Widget> _navPages = [
    RestHome(),
    RestOrders(),
    RestProfile(),
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
          bottomNavItem(Icons.home, "Home"),
          bottomNavItem(Icons.work_history, "Orders"),
          bottomNavItem(Icons.person_3, "Profile")
        ]
      ),
    );
  }

  BottomNavigationBarItem bottomNavItem(IconData icon, String label){
    return BottomNavigationBarItem(icon: Icon(icon), label: label);
  }

}