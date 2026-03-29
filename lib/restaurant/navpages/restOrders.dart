import 'package:flutter/material.dart';
import 'package:food_order/network/socket_service.dart';

class RestOrders extends StatefulWidget {
  const RestOrders({super.key});

  @override
  State<RestOrders> createState() => _RestOrdersState();
}

class _RestOrdersState extends State<RestOrders> {
  final socketService = SocketService();

  String userId = "No orders yet";

  @override
  void initState() {
    super.initState();

    socketService.connect("restaurant4567", "restaurant");

    socketService.socket.off("orderCreated"); // prevent duplicates

    socketService.socket.on("orderCreated", (data) {
      print("New order received: ${data["orderId"]}");

      if (!mounted) return;

      setState(() {
        print("changing Name ......");
        userId = data["orderId"] ?? "Unknown Order";
      });
    });
  }

  @override
  void dispose() {
    socketService.socket.off("orderCreated"); // cleanup
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(userId, style: TextStyle(fontSize: 50, color: Colors.green)),
    );
  }
}
