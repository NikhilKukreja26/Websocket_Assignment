import 'package:equatable/equatable.dart';

class WebsocketResponse extends Equatable {
  final String symbol;
  final num closePrice;

  const WebsocketResponse({
    required this.symbol,
    required this.closePrice,
  });

  WebsocketResponse copyWith({
    String? symbol,
    num? closePrice,
  }) {
    return WebsocketResponse(
      symbol: symbol ?? this.symbol,
      closePrice: closePrice ?? this.closePrice,
    );
  }

  factory WebsocketResponse.fromJson(Map<String, dynamic> json) {
    return WebsocketResponse(
      symbol: json['s'] as String,
      closePrice: num.parse(json['c'] as String),
    );
  }

  @override
  String toString() =>
      'WebsocketResponse(symbol: $symbol, closePrice: $closePrice)';

  @override
  List<Object> get props => [symbol, closePrice];
}
