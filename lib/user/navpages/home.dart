import 'package:flutter/material.dart';
import 'package:food_order/helper/serverHelper.dart';
import 'package:food_order/toastification/error.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

   @override
  void initState() {
    loadRestaurants();
    super.initState();
  }

  List<dynamic> restaurants = [];

  void loadUser()async{
    try {
      Map<String, dynamic> user = await ServerHelper().getUser();
      setState(() {
        User = user;
      });
      print(User);
    } catch (e) {
      print(e);
      showErrorMessage(context, "Something went wrong");
    }
  }

  Map<String, dynamic> User = {};

  void loadRestaurants() async {
    try {
      List<dynamic> wait = await ServerHelper().getRestaurants();

      if (wait.isEmpty) {
        print("something went wrong");
      } else {
        setState(() {
          restaurants = wait;
        });
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.green, Colors.white, Colors.white, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 15),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.location_on),
                        Text("Location"),
                        Icon(Icons.arrow_drop_down),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.notifications_outlined),
                        SizedBox(width: 10),
                        Icon(Icons.shopping_cart_outlined),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Expanded(
                  child: ListView.builder(
                    itemCount: restaurants.length,
                    itemBuilder: (context, index) {
                      return Card(child: Text(restaurants[index]["name"]));
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
