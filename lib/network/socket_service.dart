import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketService {
  late IO.Socket socket;

  void connect() {
    socket = IO.io('http://localhost:8000', <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false,
    });

    socket.connect();

    socket.onConnect((_) {
      print('✅ Connected to Node.js server');
    });

    socket.onDisconnect((_) {
      print('❌ Disconnected from server');
    });

    // Listen for messages from backend
    socket.on('receive_message', (data) {
      print('📩 New message: $data');
    });
  }

  void sendOrder(String foodIds, String restaurantId, String userId,) {
    socket.emit('send_message', {
      'restaurantId': restaurantId,
      'foodIds': foodIds,
      "userId" : userId
    });
  }
}
