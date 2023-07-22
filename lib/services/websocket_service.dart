import 'dart:convert';

import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:websocket_assignment/constants/api_end_points.dart';
import 'package:websocket_assignment/models/custom_error.dart';

class WebsocketService {
  WebsocketService._();
  static final WebsocketService _instance = WebsocketService._();
  factory WebsocketService.instance() => _instance;

  final WebSocketChannel _channel =
      IOWebSocketChannel.connect(ApiEndpoints.remoteUrl);

  /// To get websocket channel stream and return stream of list
  Stream<List<dynamic>> getWebSocketStream() async* {
    try {
      await for (final message in _channel.stream) {
        final List<dynamic> jsonListMessage =
            json.decode(message as String) as List;
        yield jsonListMessage;
      }
    } on WebSocketChannelException catch (e) {
      throw CustomError(errorMessage: e.message ?? '');
    } catch (e) {
      throw CustomError(errorMessage: e.toString());
    }
  }
}
