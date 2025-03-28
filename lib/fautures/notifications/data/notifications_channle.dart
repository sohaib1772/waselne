import 'package:web_socket_channel/web_socket_channel.dart';

class NotificationsChannle {
  late WebSocketChannel _channel;
  
  NotificationsChannle() {
    _channel = WebSocketChannel.connect(Uri.parse("ws://127.0.0.1:5000/ws"));
  }


  // Getter للوصول إلى القناة
  WebSocketChannel get channel => _channel;

  
}