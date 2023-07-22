import 'package:flutter/foundation.dart' show immutable;

@immutable
class MarketData {
  final String title;
  final num price;
  final num average;
  final num percentage;

  const MarketData({
    required this.title,
    required this.price,
    required this.average,
    required this.percentage,
  });

  @override
  String toString() {
    return 'MarketData(title: $title, price: $price, average: $average, percentage: $percentage)';
  }
}
