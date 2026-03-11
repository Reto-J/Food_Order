import 'package:flutter/material.dart';
import 'package:food_order/network/socket_service.dart';
import 'package:food_order/widget/custombutton.dart';

class Restaurants extends StatefulWidget {
  const Restaurants({super.key});

  @override
  State<Restaurants> createState() => _RestaurantsState();
}

class _RestaurantsState extends State<Restaurants> {
  final socketService = SocketService();

   @override
  void initState() {
    super.initState();

    socketService.connect("user5467", "user");
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Custombutton(text: "Send order to restaurant4567", onPressed: (){
            socketService.createOrder("ertyu", "restaurant4567", "user5467");
          })
        ],
      ),
    );
  }
}