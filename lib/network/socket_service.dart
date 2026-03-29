import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketService {
  late IO.Socket socket;

  void connect(String userId, String role) {
    socket = IO.io(
      'http://localhost:8000',
      IO.OptionBuilder()
          .setTransports(['websocket'])
          .disableAutoConnect()
          .setQuery({"userId": userId, "role": role})
          .build(),
    );

    socket.connect();

    socket.onConnect((_) {
      print('✅ Connected to Node.js server');
    });

    socket.onDisconnect((_) {
      print('❌ Disconnected from server');
    });

    //👇 LISTEN FOR NEW ORDERS
    socket.on("orderCreated", (data) {
      print("New order received: ${data['orderId']}");

      socket.emit("restaurantJoinOrder", {"orderId": data['orderId']});
    });

    // Listen for messages from backend
    // socket.on('orderCreated', (data) {
    //   print('📩 New message: $data');
    // });
  }

  void createOrder(String foodIds, String restaurantId, String userId) {
    print("Sending Order");
    socket.emit('createOrder', {
      // 'restaurantId': restaurantId,
      // 'foodIds': foodIds,
      // "userId": userId,
      "restaurantId": restaurantId,
    });
  }
}
