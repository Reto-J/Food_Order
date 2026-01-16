import 'package:flutter/material.dart';
import 'package:food_order/data/food_categories.dart';
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

  void loadUser() async {
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
          restaurants = wait
              .where((cat) => cat["role"] == "Usertype.restaurant")
              .toList();
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
            padding: const EdgeInsets.fromLTRB(15, 50, 15, 15),
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hello, NAME",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "You have 8 restaurants close to your current location",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ],
                ),
                SizedBox(height: 20),
                SizedBox(
                  height: 60, // height of the horizontal list
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: food_categories.length,
                    itemBuilder: (context, index) {
                      var food_category = food_categories[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6),
                        child: GestureDetector(
                          onTap: () {
                            print("Reto --- ${food_category["Category"]}");
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: SizedBox(
                              width: 60, // ✅ WIDTH is required
                              child: Center(
                                child: Text(
                                  food_category["icon"] ?? "⁉️",
                                  style: const TextStyle(fontSize: 30),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 20),
                Expanded(
                  child: ListView.builder(
                    itemCount: restaurants.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          leading: Text(restaurants[index]["name"] ?? "No Name"),
                        ),
                      );
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
