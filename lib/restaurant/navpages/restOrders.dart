import 'package:flutter/material.dart';
import 'package:food_order/network/socket_service.dart';

class RestOrders extends StatefulWidget {
  const RestOrders({super.key});

  @override
  State<RestOrders> createState() => _RestOrdersState();
}

class _RestOrdersState extends State<RestOrders> {

  final socketService = SocketService();

  String userId = "No oredrs yet";

@override
void initState() {
  super.initState();

  socketService.connect("restaurant4567", "restaurant");

  socketService.socket.on("restaurantJoinOrder", (data) {
    print("New order from: ${data["userId"]}");

    setState(() {
      userId = data["userId"];
    });
  });
}


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(userId,style: TextStyle(fontSize: 50, color: Colors.green),),
    );
  }
}