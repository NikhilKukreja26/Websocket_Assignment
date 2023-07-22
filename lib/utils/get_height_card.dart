import 'package:flutter/widgets.dart';
import 'package:websocket_assignment/resources/values_manager.dart';

double getCardHeight({
  required Orientation orientation,
  required double width,
}) {
  if (orientation == Orientation.landscape) {
    if (width > 700) {
      return AppHeight.h129;
    } else {
      return AppHeight.h108;
    }
  } else {
    if (width > 420) {
      return AppHeight.h76;
    } else {
      return AppHeight.h94;
    }
  }
}
